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
-- Submodules: 391
entity eval_opcode_phased_0CLK_f0816edc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_f0816edc;
architecture arch of eval_opcode_phased_0CLK_f0816edc is
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
-- BIN_OP_AND[uxn_opcodes_h_l2669_c10_8a58]
signal BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2669_c10_009f]
signal BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2669_c41_9bcb]
signal BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2669_c57_8fa8]
signal CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2669_c10_69e9]
signal MUX_uxn_opcodes_h_l2669_c10_69e9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2669_c10_69e9_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2670_c18_4579]
signal BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2670_c18_f9db]
signal BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2670_c18_2f45]
signal MUX_uxn_opcodes_h_l2670_c18_2f45_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2670_c18_2f45_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2672_c2_a9f6[uxn_opcodes_h_l2672_c2_a9f6]
signal printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c6_907b]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2675_c7_1a6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2674_c2_3ccb]
signal opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2675_c11_5909]
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2675_c1_f74f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2676_c7_ba5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2675_c7_1a6d]
signal opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2675_c41_dcc9]
signal jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2675_c41_dcc9_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2675_c41_dcc9_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2675_c41_dcc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_6c07]
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2676_c1_b4c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2677_c7_24ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2676_c7_ba5f]
signal opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2676_c41_540d]
signal jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2676_c41_540d_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2676_c41_540d_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2676_c41_540d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2677_c11_b1c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2677_c1_dfdc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2678_c7_bfbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2677_c7_24ba]
signal opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2677_c41_aeb5]
signal jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2677_c41_aeb5_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2677_c41_aeb5_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_699f]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2678_c1_bc7f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2679_c7_485a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2678_c7_bfbe]
signal opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2678_c41_8448]
signal lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2678_c41_8448_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2678_c41_8448_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2678_c41_8448_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_8e3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2679_c1_90bb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2680_c7_cc86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2679_c7_485a]
signal opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2679_c41_8c08]
signal lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2679_c41_8c08_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2679_c41_8c08_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2679_c41_8c08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_536e]
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2680_c1_81b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c7_8cd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2680_c7_cc86]
signal opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2680_c41_47fe]
signal lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2680_c41_47fe_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2680_c41_47fe_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2680_c41_47fe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_bba9]
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c1_d238]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2682_c7_6254]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2681_c7_8cd2]
signal opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2681_c41_0eb3]
signal lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2681_c41_0eb3_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2681_c41_0eb3_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_afcf]
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2682_c1_13ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2683_c7_00fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2682_c7_6254]
signal opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2682_c41_198f]
signal inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2682_c41_198f_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2682_c41_198f_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2682_c41_198f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_22ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2683_c1_043b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2684_c7_3c3f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2683_c7_00fd]
signal opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2683_c41_85cf]
signal inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2683_c41_85cf_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2683_c41_85cf_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2683_c41_85cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_ad56]
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2684_c1_383d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c7_bc77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2684_c7_3c3f]
signal opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2684_c41_f209]
signal pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2684_c41_f209_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2684_c41_f209_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2684_c41_f209_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_990b]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c1_8b61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2686_c7_f2f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2685_c7_bc77]
signal opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2685_c41_7de9]
signal pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2685_c41_7de9_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2685_c41_7de9_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2685_c41_7de9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_5e93]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2686_c1_e66a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2687_c7_546f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2686_c7_f2f1]
signal opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2686_c41_d352]
signal nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2686_c41_d352_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2686_c41_d352_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2686_c41_d352_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_431c]
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2687_c1_63b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2688_c7_f954]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2687_c7_546f]
signal opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2687_c41_a676]
signal nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2687_c41_a676_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2687_c41_a676_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2687_c41_a676_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_0455]
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2688_c1_1276]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2689_c7_b28f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2688_c7_f954]
signal opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2688_c41_dd85]
signal swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2688_c41_dd85_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2688_c41_dd85_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2688_c41_dd85_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_86d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2689_c1_bd0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2690_c7_9702]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2689_c7_b28f]
signal opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2689_c41_f97e]
signal swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2689_c41_f97e_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2689_c41_f97e_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2689_c41_f97e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_6ddf]
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2690_c1_59eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2691_c7_bc7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2690_c7_9702]
signal opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2690_c41_18f3]
signal rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2690_c41_18f3_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2690_c41_18f3_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2690_c41_18f3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2691_c11_ce93]
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2691_c1_2ce4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2692_c7_0cb4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2691_c7_bc7a]
signal opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2691_c41_6fd1]
signal rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2691_c41_6fd1_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2691_c41_6fd1_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2692_c11_b264]
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2692_c1_419d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2693_c7_265e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2692_c7_0cb4]
signal opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2692_c41_69c8]
signal dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2692_c41_69c8_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2692_c41_69c8_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2692_c41_69c8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9558]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2693_c1_3f9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2694_c7_85dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2693_c7_265e]
signal opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2693_c41_c4dc]
signal dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2693_c41_c4dc_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2693_c41_c4dc_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2694_c11_55a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2694_c1_0d93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2695_c7_f71c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2694_c7_85dd]
signal opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2694_c41_61c1]
signal ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2694_c41_61c1_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2694_c41_61c1_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2694_c41_61c1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_28bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2695_c1_e20a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2696_c7_9ac5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2695_c7_f71c]
signal opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2695_c41_d72a]
signal ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2695_c41_d72a_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2695_c41_d72a_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_54b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2696_c1_1eb5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2697_c7_7cf9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2696_c7_9ac5]
signal opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2696_c41_b5ba]
signal equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2696_c41_b5ba_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2696_c41_b5ba_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2696_c41_b5ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_7bc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2697_c1_f3ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2698_c7_12fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2697_c7_7cf9]
signal opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2697_c41_0340]
signal equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2697_c41_0340_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2697_c41_0340_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2697_c41_0340_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_cac9]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2698_c1_eabf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2699_c7_cf2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2698_c7_12fb]
signal opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2698_c41_6b20]
signal neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2698_c41_6b20_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2698_c41_6b20_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2698_c41_6b20_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_aa57]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2699_c1_5b83]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c7_d238]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2699_c7_cf2d]
signal opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2699_c41_8dcb]
signal neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2699_c41_8dcb_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2699_c41_8dcb_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_6895]
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c1_9177]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c7_9594]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2700_c7_d238]
signal opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2700_c41_61c7]
signal gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2700_c41_61c7_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2700_c41_61c7_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2700_c41_61c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_98be]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c1_29b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c7_c8c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2701_c7_9594]
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2701_c41_4018]
signal gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2701_c41_4018_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2701_c41_4018_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2701_c41_4018_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_9d18]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c1_3c27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c7_ed3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2702_c7_c8c5]
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2702_c41_a35b]
signal lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2702_c41_a35b_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2702_c41_a35b_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2702_c41_a35b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_b8f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c1_6532]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c7_3016]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2703_c7_ed3a]
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2703_c41_fc3a]
signal lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2703_c41_fc3a_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2703_c41_fc3a_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2704_c11_1312]
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c1_5d55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c7_6361]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2704_c7_3016]
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2704_c41_18cf]
signal jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2704_c41_18cf_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2704_c41_18cf_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2704_c41_18cf_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2704_c41_18cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_89b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c1_8380]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c7_659d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2705_c7_6361]
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2705_c41_6253]
signal jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2705_c41_6253_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2705_c41_6253_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2705_c41_6253_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_f477]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c1_566f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c7_065f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2706_c7_659d]
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2706_c28_a20f[uxn_opcodes_h_l2706_c28_a20f]
signal printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_9c7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c1_4578]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c7_d3d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2707_c7_065f]
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2707_c28_f87a[uxn_opcodes_h_l2707_c28_f87a]
signal printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2708_c11_9f26]
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_7d2e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_749f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2708_c7_d3d2]
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2708_c28_9444[uxn_opcodes_h_l2708_c28_9444]
signal printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_0115]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_3f78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_0065]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2709_c7_749f]
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2709_c41_3317]
signal jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2709_c41_3317_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2709_c41_3317_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2709_c41_3317_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_4873]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_3de0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_5001]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2710_c7_0065]
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2710_c28_d90d[uxn_opcodes_h_l2710_c28_d90d]
signal printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_d6ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_ee5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_59d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2711_c7_5001]
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2711_c41_9958]
signal sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2711_c41_9958_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2711_c41_9958_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2711_c41_9958_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_c8c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_5ecf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_a431]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2712_c7_59d7]
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2712_c28_1781[uxn_opcodes_h_l2712_c28_1781]
signal printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_5e1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_4b23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_4f31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2713_c7_a431]
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2713_c28_594d[uxn_opcodes_h_l2713_c28_594d]
signal printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_ffbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_b21e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_d517]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2714_c7_4f31]
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2714_c28_f40e[uxn_opcodes_h_l2714_c28_f40e]
signal printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b1d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_8a54]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_d0bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2715_c7_d517]
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2715_c28_108f[uxn_opcodes_h_l2715_c28_108f]
signal printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_fd27]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_15b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_2492]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2716_c7_d0bf]
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2716_c28_c520[uxn_opcodes_h_l2716_c28_c520]
signal printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_3688]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_dd58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_d5ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2717_c7_2492]
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2717_c28_2ae6[uxn_opcodes_h_l2717_c28_2ae6]
signal printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_50d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_af70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_3468]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2718_c7_d5ae]
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2718_c28_a010[uxn_opcodes_h_l2718_c28_a010]
signal printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_a7ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_3af8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_d2f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c7_3468]
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2719_c28_203a[uxn_opcodes_h_l2719_c28_203a]
signal printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_7847]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_444a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_28e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_d2f6]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2720_c41_9cb1]
signal lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2720_c41_9cb1_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2720_c41_9cb1_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2720_c41_9cb1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_9eba]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_346e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_1013]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_28e2]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2721_c41_98a9]
signal lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2721_c41_98a9_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2721_c41_98a9_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2721_c41_98a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_4681]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_76ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_7df1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_1013]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2722_c41_ceca]
signal sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2722_c41_ceca_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2722_c41_ceca_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2722_c41_ceca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_1715]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_0d59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_e578]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_7df1]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2723_c41_fc5c]
signal sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2723_c41_fc5c_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2723_c41_fc5c_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_eba7]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_3295]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_004c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_e578]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2724_c28_c52d[uxn_opcodes_h_l2724_c28_c52d]
signal printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_53ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_af49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_ca7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_004c]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2725_c28_6612[uxn_opcodes_h_l2725_c28_6612]
signal printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_d972]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_4237]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_b2f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_ca7a]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2726_c41_f532]
signal deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2726_c41_f532_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2726_c41_f532_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2726_c41_f532_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_1354]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_1f60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_96ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_b2f5]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2727_c41_6175]
signal deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2727_c41_6175_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2727_c41_6175_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2727_c41_6175_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_7e64]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_be86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_5e8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_96ff]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2728_c41_fce9]
signal add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2728_c41_fce9_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2728_c41_fce9_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2728_c41_fce9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_818c]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_2b57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_d7f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_5e8d]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2729_c41_c3c8]
signal add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2729_c41_c3c8_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2729_c41_c3c8_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2729_c41_c3c8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_fc7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_32cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_4eb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_d7f6]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2730_c41_27c8]
signal sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2730_c41_27c8_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2730_c41_27c8_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2730_c41_27c8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_e83d]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_7da2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_085a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_4eb9]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2731_c41_a56f]
signal sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2731_c41_a56f_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2731_c41_a56f_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2731_c41_a56f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_9e4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_7b35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_88e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_085a]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2732_c41_ba40]
signal mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2732_c41_ba40_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2732_c41_ba40_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2732_c41_ba40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_29b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_d716]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_8f85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_88e8]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2733_c41_85ac]
signal mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2733_c41_85ac_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2733_c41_85ac_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2733_c41_85ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_3c7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_ccc2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_e7f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_8f85]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2734_c41_a0a7]
signal div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2734_c41_a0a7_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2734_c41_a0a7_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2734_c41_a0a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_9000]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_6251]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_ca73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_e7f6]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2735_c41_93db]
signal div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2735_c41_93db_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2735_c41_93db_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2735_c41_93db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_84eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_0211]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_81ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_ca73]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2736_c41_f29c]
signal and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2736_c41_f29c_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2736_c41_f29c_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2736_c41_f29c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_4823]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_7776]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_7e55]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_81ef]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2737_c41_2d4f]
signal and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2737_c41_2d4f_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2737_c41_2d4f_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2737_c41_2d4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_bdb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_aa1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_e2de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_7e55]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2738_c41_3561]
signal ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2738_c41_3561_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2738_c41_3561_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2738_c41_3561_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_f557]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_1a0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_5f23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_e2de]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2739_c41_f0f3]
signal ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2739_c41_f0f3_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2739_c41_f0f3_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_0545]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_6929]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_1fed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_5f23]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2740_c41_5177]
signal eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2740_c41_5177_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2740_c41_5177_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2740_c41_5177_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_567f]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_b0b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5c3e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_1fed]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2741_c41_3780]
signal eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2741_c41_3780_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2741_c41_3780_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2741_c41_3780_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_dad6]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_1534]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_4ccd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_5c3e]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2742_c41_712b]
signal sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2742_c41_712b_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2742_c41_712b_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2742_c41_712b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_1a7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_fbc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_0fb5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_4ccd]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2743_c41_3e26]
signal sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2743_c41_3e26_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2743_c41_3e26_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2743_c41_3e26_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2744_c9_3e9b[uxn_opcodes_h_l2744_c9_3e9b]
signal printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2746_c2_552d]
signal sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2746_c2_552d]
signal sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2747_c3_fcd7]
signal sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2747_c3_fcd7]
signal sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2748_c4_09f7]
signal BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2750_c4_d876]
signal BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2756_c19_8642]
signal MUX_uxn_opcodes_h_l2756_c19_8642_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2756_c19_8642_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2756_c19_8642_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2756_c19_8642_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2756_c19_e9e1]
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_e453]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_779b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l2759_c2_554d]
signal stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l2760_c22_52f6]
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l2769_c22_903c]
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l2779_c26_a4b5]
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58
BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left,
BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right,
BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f
BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left,
BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right,
BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb
BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left,
BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right,
BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8
CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x,
CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output);

-- MUX_uxn_opcodes_h_l2669_c10_69e9
MUX_uxn_opcodes_h_l2669_c10_69e9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2669_c10_69e9_cond,
MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue,
MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse,
MUX_uxn_opcodes_h_l2669_c10_69e9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579
BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left,
BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right,
BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db
BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left,
BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right,
BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output);

-- MUX_uxn_opcodes_h_l2670_c18_2f45
MUX_uxn_opcodes_h_l2670_c18_2f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2670_c18_2f45_cond,
MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue,
MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse,
MUX_uxn_opcodes_h_l2670_c18_2f45_return_output);

-- printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6
printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6 : entity work.printf_uxn_opcodes_h_l2672_c2_a9f6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0,
printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1,
printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b
BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb
opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond,
opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left,
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right,
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d
opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond,
opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output);

-- jci_uxn_opcodes_h_l2675_c41_dcc9
jci_uxn_opcodes_h_l2675_c41_dcc9 : entity work.jci_0CLK_bbbe252c port map (
clk,
jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2675_c41_dcc9_phase,
jci_uxn_opcodes_h_l2675_c41_dcc9_pc,
jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read,
jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read,
jci_uxn_opcodes_h_l2675_c41_dcc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f
opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond,
opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output);

-- jmi_uxn_opcodes_h_l2676_c41_540d
jmi_uxn_opcodes_h_l2676_c41_540d : entity work.jmi_0CLK_b30fc8f1 port map (
clk,
jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2676_c41_540d_phase,
jmi_uxn_opcodes_h_l2676_c41_540d_pc,
jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read,
jmi_uxn_opcodes_h_l2676_c41_540d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba
opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond,
opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output);

-- jsi_uxn_opcodes_h_l2677_c41_aeb5
jsi_uxn_opcodes_h_l2677_c41_aeb5 : entity work.jsi_0CLK_a05d6369 port map (
clk,
jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2677_c41_aeb5_phase,
jsi_uxn_opcodes_h_l2677_c41_aeb5_pc,
jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read,
jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe
opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond,
opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output);

-- lit_uxn_opcodes_h_l2678_c41_8448
lit_uxn_opcodes_h_l2678_c41_8448 : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2678_c41_8448_phase,
lit_uxn_opcodes_h_l2678_c41_8448_pc,
lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read,
lit_uxn_opcodes_h_l2678_c41_8448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2679_c7_485a
opc_result_MUX_uxn_opcodes_h_l2679_c7_485a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond,
opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output);

-- lit2_uxn_opcodes_h_l2679_c41_8c08
lit2_uxn_opcodes_h_l2679_c41_8c08 : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2679_c41_8c08_phase,
lit2_uxn_opcodes_h_l2679_c41_8c08_pc,
lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read,
lit2_uxn_opcodes_h_l2679_c41_8c08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86
opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond,
opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue,
opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse,
opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output);

-- lit_uxn_opcodes_h_l2680_c41_47fe
lit_uxn_opcodes_h_l2680_c41_47fe : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2680_c41_47fe_phase,
lit_uxn_opcodes_h_l2680_c41_47fe_pc,
lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read,
lit_uxn_opcodes_h_l2680_c41_47fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2
opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond,
opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output);

-- lit2_uxn_opcodes_h_l2681_c41_0eb3
lit2_uxn_opcodes_h_l2681_c41_0eb3 : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2681_c41_0eb3_phase,
lit2_uxn_opcodes_h_l2681_c41_0eb3_pc,
lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read,
lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2682_c7_6254
opc_result_MUX_uxn_opcodes_h_l2682_c7_6254 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond,
opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue,
opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse,
opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output);

-- inc_uxn_opcodes_h_l2682_c41_198f
inc_uxn_opcodes_h_l2682_c41_198f : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2682_c41_198f_phase,
inc_uxn_opcodes_h_l2682_c41_198f_ins,
inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read,
inc_uxn_opcodes_h_l2682_c41_198f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd
opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond,
opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output);

-- inc2_uxn_opcodes_h_l2683_c41_85cf
inc2_uxn_opcodes_h_l2683_c41_85cf : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2683_c41_85cf_phase,
inc2_uxn_opcodes_h_l2683_c41_85cf_ins,
inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read,
inc2_uxn_opcodes_h_l2683_c41_85cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f
opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond,
opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output);

-- pop_uxn_opcodes_h_l2684_c41_f209
pop_uxn_opcodes_h_l2684_c41_f209 : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2684_c41_f209_phase,
pop_uxn_opcodes_h_l2684_c41_f209_ins,
pop_uxn_opcodes_h_l2684_c41_f209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77
opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond,
opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue,
opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse,
opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output);

-- pop2_uxn_opcodes_h_l2685_c41_7de9
pop2_uxn_opcodes_h_l2685_c41_7de9 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2685_c41_7de9_phase,
pop2_uxn_opcodes_h_l2685_c41_7de9_ins,
pop2_uxn_opcodes_h_l2685_c41_7de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1
opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond,
opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output);

-- nip_uxn_opcodes_h_l2686_c41_d352
nip_uxn_opcodes_h_l2686_c41_d352 : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2686_c41_d352_phase,
nip_uxn_opcodes_h_l2686_c41_d352_ins,
nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read,
nip_uxn_opcodes_h_l2686_c41_d352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2687_c7_546f
opc_result_MUX_uxn_opcodes_h_l2687_c7_546f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond,
opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output);

-- nip2_uxn_opcodes_h_l2687_c41_a676
nip2_uxn_opcodes_h_l2687_c41_a676 : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2687_c41_a676_phase,
nip2_uxn_opcodes_h_l2687_c41_a676_ins,
nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read,
nip2_uxn_opcodes_h_l2687_c41_a676_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2688_c7_f954
opc_result_MUX_uxn_opcodes_h_l2688_c7_f954 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond,
opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue,
opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse,
opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output);

-- swp_uxn_opcodes_h_l2688_c41_dd85
swp_uxn_opcodes_h_l2688_c41_dd85 : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2688_c41_dd85_phase,
swp_uxn_opcodes_h_l2688_c41_dd85_ins,
swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read,
swp_uxn_opcodes_h_l2688_c41_dd85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f
opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond,
opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output);

-- swp2_uxn_opcodes_h_l2689_c41_f97e
swp2_uxn_opcodes_h_l2689_c41_f97e : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2689_c41_f97e_phase,
swp2_uxn_opcodes_h_l2689_c41_f97e_ins,
swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read,
swp2_uxn_opcodes_h_l2689_c41_f97e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2690_c7_9702
opc_result_MUX_uxn_opcodes_h_l2690_c7_9702 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond,
opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue,
opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse,
opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output);

-- rot_uxn_opcodes_h_l2690_c41_18f3
rot_uxn_opcodes_h_l2690_c41_18f3 : entity work.rot_0CLK_9c3c4e32 port map (
clk,
rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2690_c41_18f3_phase,
rot_uxn_opcodes_h_l2690_c41_18f3_ins,
rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read,
rot_uxn_opcodes_h_l2690_c41_18f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left,
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right,
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a
opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond,
opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output);

-- rot2_uxn_opcodes_h_l2691_c41_6fd1
rot2_uxn_opcodes_h_l2691_c41_6fd1 : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2691_c41_6fd1_phase,
rot2_uxn_opcodes_h_l2691_c41_6fd1_ins,
rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read,
rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left,
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right,
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4
opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond,
opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output);

-- dup_uxn_opcodes_h_l2692_c41_69c8
dup_uxn_opcodes_h_l2692_c41_69c8 : entity work.dup_0CLK_a148083c port map (
clk,
dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2692_c41_69c8_phase,
dup_uxn_opcodes_h_l2692_c41_69c8_ins,
dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read,
dup_uxn_opcodes_h_l2692_c41_69c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2693_c7_265e
opc_result_MUX_uxn_opcodes_h_l2693_c7_265e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond,
opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output);

-- dup2_uxn_opcodes_h_l2693_c41_c4dc
dup2_uxn_opcodes_h_l2693_c41_c4dc : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2693_c41_c4dc_phase,
dup2_uxn_opcodes_h_l2693_c41_c4dc_ins,
dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read,
dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6
BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd
opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond,
opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output);

-- ovr_uxn_opcodes_h_l2694_c41_61c1
ovr_uxn_opcodes_h_l2694_c41_61c1 : entity work.ovr_0CLK_cf70ec0f port map (
clk,
ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2694_c41_61c1_phase,
ovr_uxn_opcodes_h_l2694_c41_61c1_ins,
ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read,
ovr_uxn_opcodes_h_l2694_c41_61c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c
opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond,
opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output);

-- ovr2_uxn_opcodes_h_l2695_c41_d72a
ovr2_uxn_opcodes_h_l2695_c41_d72a : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2695_c41_d72a_phase,
ovr2_uxn_opcodes_h_l2695_c41_d72a_ins,
ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read,
ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5
opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond,
opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output);

-- equ_uxn_opcodes_h_l2696_c41_b5ba
equ_uxn_opcodes_h_l2696_c41_b5ba : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2696_c41_b5ba_phase,
equ_uxn_opcodes_h_l2696_c41_b5ba_ins,
equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read,
equ_uxn_opcodes_h_l2696_c41_b5ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9
opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond,
opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output);

-- equ2_uxn_opcodes_h_l2697_c41_0340
equ2_uxn_opcodes_h_l2697_c41_0340 : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2697_c41_0340_phase,
equ2_uxn_opcodes_h_l2697_c41_0340_ins,
equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read,
equ2_uxn_opcodes_h_l2697_c41_0340_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb
opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond,
opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output);

-- neq_uxn_opcodes_h_l2698_c41_6b20
neq_uxn_opcodes_h_l2698_c41_6b20 : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2698_c41_6b20_phase,
neq_uxn_opcodes_h_l2698_c41_6b20_ins,
neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read,
neq_uxn_opcodes_h_l2698_c41_6b20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d
opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond,
opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output);

-- neq2_uxn_opcodes_h_l2699_c41_8dcb
neq2_uxn_opcodes_h_l2699_c41_8dcb : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2699_c41_8dcb_phase,
neq2_uxn_opcodes_h_l2699_c41_8dcb_ins,
neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read,
neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2700_c7_d238
opc_result_MUX_uxn_opcodes_h_l2700_c7_d238 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond,
opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue,
opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse,
opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output);

-- gth_uxn_opcodes_h_l2700_c41_61c7
gth_uxn_opcodes_h_l2700_c41_61c7 : entity work.gth_0CLK_7c2e709f port map (
clk,
gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2700_c41_61c7_phase,
gth_uxn_opcodes_h_l2700_c41_61c7_ins,
gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read,
gth_uxn_opcodes_h_l2700_c41_61c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2701_c7_9594
opc_result_MUX_uxn_opcodes_h_l2701_c7_9594 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond,
opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue,
opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse,
opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output);

-- gth2_uxn_opcodes_h_l2701_c41_4018
gth2_uxn_opcodes_h_l2701_c41_4018 : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2701_c41_4018_phase,
gth2_uxn_opcodes_h_l2701_c41_4018_ins,
gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read,
gth2_uxn_opcodes_h_l2701_c41_4018_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5
opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond,
opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output);

-- lth_uxn_opcodes_h_l2702_c41_a35b
lth_uxn_opcodes_h_l2702_c41_a35b : entity work.lth_0CLK_7c2e709f port map (
clk,
lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2702_c41_a35b_phase,
lth_uxn_opcodes_h_l2702_c41_a35b_ins,
lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read,
lth_uxn_opcodes_h_l2702_c41_a35b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a
opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond,
opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output);

-- lth2_uxn_opcodes_h_l2703_c41_fc3a
lth2_uxn_opcodes_h_l2703_c41_fc3a : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2703_c41_fc3a_phase,
lth2_uxn_opcodes_h_l2703_c41_fc3a_ins,
lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read,
lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left,
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right,
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2704_c7_3016
opc_result_MUX_uxn_opcodes_h_l2704_c7_3016 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond,
opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue,
opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse,
opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output);

-- jmp_uxn_opcodes_h_l2704_c41_18cf
jmp_uxn_opcodes_h_l2704_c41_18cf : entity work.jmp_0CLK_6481cb28 port map (
clk,
jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2704_c41_18cf_phase,
jmp_uxn_opcodes_h_l2704_c41_18cf_ins,
jmp_uxn_opcodes_h_l2704_c41_18cf_pc,
jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read,
jmp_uxn_opcodes_h_l2704_c41_18cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2705_c7_6361
opc_result_MUX_uxn_opcodes_h_l2705_c7_6361 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output);

-- jmp2_uxn_opcodes_h_l2705_c41_6253
jmp2_uxn_opcodes_h_l2705_c41_6253 : entity work.jmp2_0CLK_f7466064 port map (
clk,
jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2705_c41_6253_phase,
jmp2_uxn_opcodes_h_l2705_c41_6253_ins,
jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read,
jmp2_uxn_opcodes_h_l2705_c41_6253_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2706_c7_659d
opc_result_MUX_uxn_opcodes_h_l2706_c7_659d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond,
opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output);

-- printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f
printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f : entity work.printf_uxn_opcodes_h_l2706_c28_a20f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2707_c7_065f
opc_result_MUX_uxn_opcodes_h_l2707_c7_065f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond,
opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output);

-- printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a
printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a : entity work.printf_uxn_opcodes_h_l2707_c28_f87a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left,
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right,
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2
opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond,
opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output);

-- printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444
printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444 : entity work.printf_uxn_opcodes_h_l2708_c28_9444_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2709_c7_749f
opc_result_MUX_uxn_opcodes_h_l2709_c7_749f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond,
opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output);

-- jsr2_uxn_opcodes_h_l2709_c41_3317
jsr2_uxn_opcodes_h_l2709_c41_3317 : entity work.jsr2_0CLK_a538d920 port map (
clk,
jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2709_c41_3317_phase,
jsr2_uxn_opcodes_h_l2709_c41_3317_ins,
jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read,
jsr2_uxn_opcodes_h_l2709_c41_3317_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2710_c7_0065
opc_result_MUX_uxn_opcodes_h_l2710_c7_0065 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output);

-- printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d
printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d : entity work.printf_uxn_opcodes_h_l2710_c28_d90d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2711_c7_5001
opc_result_MUX_uxn_opcodes_h_l2711_c7_5001 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond,
opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue,
opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse,
opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output);

-- sth2_uxn_opcodes_h_l2711_c41_9958
sth2_uxn_opcodes_h_l2711_c41_9958 : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2711_c41_9958_phase,
sth2_uxn_opcodes_h_l2711_c41_9958_ins,
sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read,
sth2_uxn_opcodes_h_l2711_c41_9958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7
opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond,
opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output);

-- printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781
printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781 : entity work.printf_uxn_opcodes_h_l2712_c28_1781_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2713_c7_a431
opc_result_MUX_uxn_opcodes_h_l2713_c7_a431 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond,
opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue,
opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse,
opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output);

-- printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d
printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d : entity work.printf_uxn_opcodes_h_l2713_c28_594d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31
opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond,
opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue,
opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse,
opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output);

-- printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e
printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e : entity work.printf_uxn_opcodes_h_l2714_c28_f40e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2715_c7_d517
opc_result_MUX_uxn_opcodes_h_l2715_c7_d517 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond,
opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue,
opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse,
opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output);

-- printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f
printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f : entity work.printf_uxn_opcodes_h_l2715_c28_108f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf
opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond,
opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output);

-- printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520
printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520 : entity work.printf_uxn_opcodes_h_l2716_c28_c520_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2717_c7_2492
opc_result_MUX_uxn_opcodes_h_l2717_c7_2492 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond,
opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue,
opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse,
opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output);

-- printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6
printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6 : entity work.printf_uxn_opcodes_h_l2717_c28_2ae6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae
opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond,
opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue,
opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse,
opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output);

-- printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010
printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010 : entity work.printf_uxn_opcodes_h_l2718_c28_a010_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c7_3468
opc_result_MUX_uxn_opcodes_h_l2719_c7_3468 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output);

-- printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a
printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a : entity work.printf_uxn_opcodes_h_l2719_c28_203a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6
opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output);

-- lda_uxn_opcodes_h_l2720_c41_9cb1
lda_uxn_opcodes_h_l2720_c41_9cb1 : entity work.lda_0CLK_d853ed1b port map (
clk,
lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2720_c41_9cb1_phase,
lda_uxn_opcodes_h_l2720_c41_9cb1_ins,
lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read,
lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read,
lda_uxn_opcodes_h_l2720_c41_9cb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2
opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output);

-- lda2_uxn_opcodes_h_l2721_c41_98a9
lda2_uxn_opcodes_h_l2721_c41_98a9 : entity work.lda2_0CLK_9347d63d port map (
clk,
lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2721_c41_98a9_phase,
lda2_uxn_opcodes_h_l2721_c41_98a9_ins,
lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read,
lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read,
lda2_uxn_opcodes_h_l2721_c41_98a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_1013
opc_result_MUX_uxn_opcodes_h_l2722_c7_1013 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output);

-- sta_uxn_opcodes_h_l2722_c41_ceca
sta_uxn_opcodes_h_l2722_c41_ceca : entity work.sta_0CLK_5e923a6a port map (
clk,
sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2722_c41_ceca_phase,
sta_uxn_opcodes_h_l2722_c41_ceca_ins,
sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read,
sta_uxn_opcodes_h_l2722_c41_ceca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1
opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output);

-- sta2_uxn_opcodes_h_l2723_c41_fc5c
sta2_uxn_opcodes_h_l2723_c41_fc5c : entity work.sta2_0CLK_201aeef3 port map (
clk,
sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2723_c41_fc5c_phase,
sta2_uxn_opcodes_h_l2723_c41_fc5c_ins,
sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read,
sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_e578
opc_result_MUX_uxn_opcodes_h_l2724_c7_e578 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output);

-- printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d
printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d : entity work.printf_uxn_opcodes_h_l2724_c28_c52d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_004c
opc_result_MUX_uxn_opcodes_h_l2725_c7_004c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output);

-- printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612
printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612 : entity work.printf_uxn_opcodes_h_l2725_c28_6612_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a
opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output);

-- deo_uxn_opcodes_h_l2726_c41_f532
deo_uxn_opcodes_h_l2726_c41_f532 : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2726_c41_f532_phase,
deo_uxn_opcodes_h_l2726_c41_f532_ins,
deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read,
deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read,
deo_uxn_opcodes_h_l2726_c41_f532_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5
opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output);

-- deo2_uxn_opcodes_h_l2727_c41_6175
deo2_uxn_opcodes_h_l2727_c41_6175 : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2727_c41_6175_phase,
deo2_uxn_opcodes_h_l2727_c41_6175_ins,
deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read,
deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read,
deo2_uxn_opcodes_h_l2727_c41_6175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff
opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output);

-- add_uxn_opcodes_h_l2728_c41_fce9
add_uxn_opcodes_h_l2728_c41_fce9 : entity work.add_0CLK_fd2391e7 port map (
clk,
add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE,
add_uxn_opcodes_h_l2728_c41_fce9_phase,
add_uxn_opcodes_h_l2728_c41_fce9_ins,
add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read,
add_uxn_opcodes_h_l2728_c41_fce9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d
opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output);

-- add2_uxn_opcodes_h_l2729_c41_c3c8
add2_uxn_opcodes_h_l2729_c41_c3c8 : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2729_c41_c3c8_phase,
add2_uxn_opcodes_h_l2729_c41_c3c8_ins,
add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read,
add2_uxn_opcodes_h_l2729_c41_c3c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6
opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output);

-- sub_uxn_opcodes_h_l2730_c41_27c8
sub_uxn_opcodes_h_l2730_c41_27c8 : entity work.sub_0CLK_fd2391e7 port map (
clk,
sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2730_c41_27c8_phase,
sub_uxn_opcodes_h_l2730_c41_27c8_ins,
sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read,
sub_uxn_opcodes_h_l2730_c41_27c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9
opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output);

-- sub2_uxn_opcodes_h_l2731_c41_a56f
sub2_uxn_opcodes_h_l2731_c41_a56f : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2731_c41_a56f_phase,
sub2_uxn_opcodes_h_l2731_c41_a56f_ins,
sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read,
sub2_uxn_opcodes_h_l2731_c41_a56f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_085a
opc_result_MUX_uxn_opcodes_h_l2732_c7_085a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output);

-- mul_uxn_opcodes_h_l2732_c41_ba40
mul_uxn_opcodes_h_l2732_c41_ba40 : entity work.mul_0CLK_fd2391e7 port map (
clk,
mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2732_c41_ba40_phase,
mul_uxn_opcodes_h_l2732_c41_ba40_ins,
mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read,
mul_uxn_opcodes_h_l2732_c41_ba40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8
opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output);

-- mul2_uxn_opcodes_h_l2733_c41_85ac
mul2_uxn_opcodes_h_l2733_c41_85ac : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2733_c41_85ac_phase,
mul2_uxn_opcodes_h_l2733_c41_85ac_ins,
mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read,
mul2_uxn_opcodes_h_l2733_c41_85ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85
opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output);

-- div_uxn_opcodes_h_l2734_c41_a0a7
div_uxn_opcodes_h_l2734_c41_a0a7 : entity work.div_0CLK_f6fa2c7d port map (
clk,
div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE,
div_uxn_opcodes_h_l2734_c41_a0a7_phase,
div_uxn_opcodes_h_l2734_c41_a0a7_ins,
div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read,
div_uxn_opcodes_h_l2734_c41_a0a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6
opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output);

-- div2_uxn_opcodes_h_l2735_c41_93db
div2_uxn_opcodes_h_l2735_c41_93db : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2735_c41_93db_phase,
div2_uxn_opcodes_h_l2735_c41_93db_ins,
div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read,
div2_uxn_opcodes_h_l2735_c41_93db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73
opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output);

-- and_uxn_opcodes_h_l2736_c41_f29c
and_uxn_opcodes_h_l2736_c41_f29c : entity work.and_0CLK_fd2391e7 port map (
clk,
and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE,
and_uxn_opcodes_h_l2736_c41_f29c_phase,
and_uxn_opcodes_h_l2736_c41_f29c_ins,
and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read,
and_uxn_opcodes_h_l2736_c41_f29c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef
opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output);

-- and2_uxn_opcodes_h_l2737_c41_2d4f
and2_uxn_opcodes_h_l2737_c41_2d4f : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2737_c41_2d4f_phase,
and2_uxn_opcodes_h_l2737_c41_2d4f_ins,
and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read,
and2_uxn_opcodes_h_l2737_c41_2d4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55
opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output);

-- ora_uxn_opcodes_h_l2738_c41_3561
ora_uxn_opcodes_h_l2738_c41_3561 : entity work.ora_0CLK_fd2391e7 port map (
clk,
ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2738_c41_3561_phase,
ora_uxn_opcodes_h_l2738_c41_3561_ins,
ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read,
ora_uxn_opcodes_h_l2738_c41_3561_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de
opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output);

-- ora2_uxn_opcodes_h_l2739_c41_f0f3
ora2_uxn_opcodes_h_l2739_c41_f0f3 : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2739_c41_f0f3_phase,
ora2_uxn_opcodes_h_l2739_c41_f0f3_ins,
ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read,
ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23
opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output);

-- eor_uxn_opcodes_h_l2740_c41_5177
eor_uxn_opcodes_h_l2740_c41_5177 : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2740_c41_5177_phase,
eor_uxn_opcodes_h_l2740_c41_5177_ins,
eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read,
eor_uxn_opcodes_h_l2740_c41_5177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed
opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output);

-- eor2_uxn_opcodes_h_l2741_c41_3780
eor2_uxn_opcodes_h_l2741_c41_3780 : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2741_c41_3780_phase,
eor2_uxn_opcodes_h_l2741_c41_3780_ins,
eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read,
eor2_uxn_opcodes_h_l2741_c41_3780_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e
opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output);

-- sft_uxn_opcodes_h_l2742_c41_712b
sft_uxn_opcodes_h_l2742_c41_712b : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2742_c41_712b_phase,
sft_uxn_opcodes_h_l2742_c41_712b_ins,
sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read,
sft_uxn_opcodes_h_l2742_c41_712b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd
opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output);

-- sft2_uxn_opcodes_h_l2743_c41_3e26
sft2_uxn_opcodes_h_l2743_c41_3e26 : entity work.sft2_0CLK_d29b8e2d port map (
clk,
sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2743_c41_3e26_phase,
sft2_uxn_opcodes_h_l2743_c41_3e26_ins,
sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read,
sft2_uxn_opcodes_h_l2743_c41_3e26_return_output);

-- printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b
printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b : entity work.printf_uxn_opcodes_h_l2744_c9_3e9b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0);

-- sp0_MUX_uxn_opcodes_h_l2746_c2_552d
sp0_MUX_uxn_opcodes_h_l2746_c2_552d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond,
sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue,
sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse,
sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output);

-- sp1_MUX_uxn_opcodes_h_l2746_c2_552d
sp1_MUX_uxn_opcodes_h_l2746_c2_552d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond,
sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue,
sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse,
sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output);

-- sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7
sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond,
sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue,
sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse,
sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output);

-- sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7
sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond,
sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue,
sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse,
sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7
BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left,
BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right,
BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876
BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left,
BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right,
BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output);

-- MUX_uxn_opcodes_h_l2756_c19_8642
MUX_uxn_opcodes_h_l2756_c19_8642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2756_c19_8642_cond,
MUX_uxn_opcodes_h_l2756_c19_8642_iftrue,
MUX_uxn_opcodes_h_l2756_c19_8642_iffalse,
MUX_uxn_opcodes_h_l2756_c19_8642_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1
BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d
stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond,
stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output);

-- device_ram_update_uxn_opcodes_h_l2779_c26_a4b5
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable,
device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output,
 CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output,
 MUX_uxn_opcodes_h_l2669_c10_69e9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output,
 MUX_uxn_opcodes_h_l2670_c18_2f45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output,
 jci_uxn_opcodes_h_l2675_c41_dcc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output,
 jmi_uxn_opcodes_h_l2676_c41_540d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output,
 jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output,
 lit_uxn_opcodes_h_l2678_c41_8448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output,
 opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output,
 lit2_uxn_opcodes_h_l2679_c41_8c08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output,
 lit_uxn_opcodes_h_l2680_c41_47fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output,
 opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output,
 lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output,
 inc_uxn_opcodes_h_l2682_c41_198f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output,
 inc2_uxn_opcodes_h_l2683_c41_85cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output,
 opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output,
 pop_uxn_opcodes_h_l2684_c41_f209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output,
 pop2_uxn_opcodes_h_l2685_c41_7de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output,
 nip_uxn_opcodes_h_l2686_c41_d352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output,
 opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output,
 nip2_uxn_opcodes_h_l2687_c41_a676_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output,
 swp_uxn_opcodes_h_l2688_c41_dd85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output,
 opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output,
 swp2_uxn_opcodes_h_l2689_c41_f97e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output,
 rot_uxn_opcodes_h_l2690_c41_18f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output,
 rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output,
 dup_uxn_opcodes_h_l2692_c41_69c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output,
 dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output,
 ovr_uxn_opcodes_h_l2694_c41_61c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output,
 ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output,
 equ_uxn_opcodes_h_l2696_c41_b5ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output,
 equ2_uxn_opcodes_h_l2697_c41_0340_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output,
 neq_uxn_opcodes_h_l2698_c41_6b20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output,
 opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output,
 neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output,
 opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output,
 gth_uxn_opcodes_h_l2700_c41_61c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output,
 gth2_uxn_opcodes_h_l2701_c41_4018_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output,
 lth_uxn_opcodes_h_l2702_c41_a35b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output,
 opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output,
 lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output,
 opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output,
 jmp_uxn_opcodes_h_l2704_c41_18cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output,
 jmp2_uxn_opcodes_h_l2705_c41_6253_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output,
 opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output,
 jsr2_uxn_opcodes_h_l2709_c41_3317_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output,
 opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output,
 sth2_uxn_opcodes_h_l2711_c41_9958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output,
 opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output,
 opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output,
 opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output,
 opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output,
 opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output,
 opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output,
 lda_uxn_opcodes_h_l2720_c41_9cb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output,
 lda2_uxn_opcodes_h_l2721_c41_98a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output,
 sta_uxn_opcodes_h_l2722_c41_ceca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output,
 sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output,
 deo_uxn_opcodes_h_l2726_c41_f532_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output,
 deo2_uxn_opcodes_h_l2727_c41_6175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output,
 add_uxn_opcodes_h_l2728_c41_fce9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output,
 add2_uxn_opcodes_h_l2729_c41_c3c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output,
 sub_uxn_opcodes_h_l2730_c41_27c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output,
 sub2_uxn_opcodes_h_l2731_c41_a56f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output,
 mul_uxn_opcodes_h_l2732_c41_ba40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output,
 mul2_uxn_opcodes_h_l2733_c41_85ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output,
 div_uxn_opcodes_h_l2734_c41_a0a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output,
 div2_uxn_opcodes_h_l2735_c41_93db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output,
 and_uxn_opcodes_h_l2736_c41_f29c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output,
 and2_uxn_opcodes_h_l2737_c41_2d4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output,
 ora_uxn_opcodes_h_l2738_c41_3561_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output,
 ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output,
 eor_uxn_opcodes_h_l2740_c41_5177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output,
 eor2_uxn_opcodes_h_l2741_c41_3780_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output,
 sft_uxn_opcodes_h_l2742_c41_712b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output,
 sft2_uxn_opcodes_h_l2743_c41_3e26_return_output,
 sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output,
 sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output,
 sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output,
 sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output,
 MUX_uxn_opcodes_h_l2756_c19_8642_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output,
 stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output,
 stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output,
 device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2669_c2_1a4e : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c30_46bc_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c57_3ec3_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2674_c2_3ccb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2676_c41_540d_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2676_c41_540d_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2676_c41_540d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2678_c41_8448_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2678_c41_8448_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2678_c41_8448_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2680_c41_47fe_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2680_c41_47fe_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2680_c41_47fe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2682_c41_198f_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2682_c41_198f_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2682_c41_198f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2684_c41_f209_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2684_c41_f209_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2684_c41_f209_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2686_c41_d352_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2686_c41_d352_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2686_c41_d352_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2687_c41_a676_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2687_c41_a676_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2687_c41_a676_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2688_c41_dd85_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2688_c41_dd85_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2688_c41_dd85_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2690_c41_18f3_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2690_c41_18f3_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2690_c41_18f3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2692_c41_69c8_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2692_c41_69c8_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2692_c41_69c8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2697_c41_0340_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2697_c41_0340_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2697_c41_0340_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2698_c41_6b20_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2698_c41_6b20_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2698_c41_6b20_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2700_c41_61c7_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2700_c41_61c7_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2700_c41_61c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2701_c41_4018_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2701_c41_4018_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2701_c41_4018_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2702_c41_a35b_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2702_c41_a35b_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2702_c41_a35b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2706_c7_659d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2707_c7_065f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c7_d3d2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2710_c7_0065_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2711_c41_9958_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2711_c41_9958_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2711_c41_9958_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c7_59d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2713_c7_a431_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2714_c7_4f31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2715_c7_d517_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2716_c7_d0bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2717_c7_2492_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2718_c7_d5ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c7_3468_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2722_c41_ceca_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2722_c41_ceca_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2722_c41_ceca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2724_c7_e578_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2725_c7_004c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2726_c41_f532_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2727_c41_6175_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2728_c41_fce9_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2728_c41_fce9_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2728_c41_fce9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2730_c41_27c8_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2730_c41_27c8_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2730_c41_27c8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2732_c41_ba40_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2732_c41_ba40_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2732_c41_ba40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2734_c41_a0a7_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2734_c41_a0a7_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2734_c41_a0a7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2735_c41_93db_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2735_c41_93db_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2735_c41_93db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2736_c41_f29c_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2736_c41_f29c_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2736_c41_f29c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2738_c41_3561_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2738_c41_3561_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2738_c41_3561_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2740_c41_5177_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2740_c41_5177_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2740_c41_5177_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2741_c41_3780_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2741_c41_3780_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2741_c41_3780_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2742_c41_712b_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2742_c41_712b_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2742_c41_712b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2746_c6_12a8_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2750_c4_751b : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2748_c4_1ece : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2754_c18_7835_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_c19_2f12_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2756_c19_8642_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2756_c19_8642_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2756_c82_2b3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2757_c22_dcd7_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2760_c3_98e9 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2769_c3_044e : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l2779_c2_2712 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2781_c3_d99c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2782_c3_ae65_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2785_c3_5107_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2788_c34_3937_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2789_c23_c232_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2790_c32_d659_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2791_c33_e8d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2792_c29_290f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2793_c30_d11a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2794_c34_5cf5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2795_c33_d2b6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2796_c31_413b_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2797_c32_280e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2747_l2756_l2759_DUPLICATE_a6ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2750_DUPLICATE_2a1a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2784_l2780_DUPLICATE_87ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2799_l2652_DUPLICATE_b89a_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right := to_unsigned(38, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right := to_unsigned(58, 6);
     VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue := to_unsigned(0, 1);
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right := to_unsigned(18, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right := to_unsigned(2560, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right := to_unsigned(15, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right := to_unsigned(28, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue := to_unsigned(0, 1);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue := to_unsigned(0, 1);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right := to_unsigned(33, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2728_c41_fce9_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2736_c41_f29c_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2735_c41_93db_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2734_c41_a0a7_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2692_c41_69c8_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2741_c41_3780_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2740_c41_5177_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2697_c41_0340_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2701_c41_4018_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2700_c41_61c7_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2682_c41_198f_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2702_c41_a35b_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2732_c41_ba40_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2698_c41_6b20_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2687_c41_a676_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2686_c41_d352_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2738_c41_3561_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2684_c41_f209_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2690_c41_18f3_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2742_c41_712b_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2722_c41_ceca_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2711_c41_9958_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2730_c41_27c8_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2688_c41_dd85_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2676_c41_540d_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2678_c41_8448_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2680_c41_47fe_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2728_c41_fce9_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2736_c41_f29c_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2735_c41_93db_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2734_c41_a0a7_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2692_c41_69c8_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2741_c41_3780_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2740_c41_5177_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2697_c41_0340_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2701_c41_4018_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2700_c41_61c7_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2682_c41_198f_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2676_c41_540d_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2678_c41_8448_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2680_c41_47fe_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2702_c41_a35b_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2732_c41_ba40_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2698_c41_6b20_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2687_c41_a676_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2686_c41_d352_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2738_c41_3561_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2684_c41_f209_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2690_c41_18f3_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2742_c41_712b_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2722_c41_ceca_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2711_c41_9958_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2730_c41_27c8_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2688_c41_dd85_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2669_c57_3ec3] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c57_3ec3_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l2669_c10_8a58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_left;
     BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output := BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2710_c7_0065] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2710_c7_0065_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2716_c7_d0bf] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2716_c7_d0bf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2718_c7_d5ae] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2718_c7_d5ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2713_c7_a431] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2713_c7_a431_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2707_c7_065f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2707_c7_065f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2715_c7_d517] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2715_c7_d517_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2708_c7_d3d2] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c7_d3d2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2674_c2_3ccb] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2674_c2_3ccb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2670_c18_4579] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_left;
     BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output := BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2712_c7_59d7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c7_59d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2714_c7_4f31] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2714_c7_4f31_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2717_c7_2492] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2717_c7_2492_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2669_c41_9bcb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_left;
     BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output := BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2706_c7_659d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2706_c7_659d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2719_c7_3468] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c7_3468_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2724_c7_e578] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2724_c7_e578_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2725_c7_004c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2725_c7_004c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c10_8a58_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2670_c18_4579_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c57_3ec3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2674_c2_3ccb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2706_c7_659d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2707_c7_065f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c7_d3d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2710_c7_0065_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2712_c7_59d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2713_c7_a431_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2714_c7_4f31_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2715_c7_d517_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2716_c7_d0bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2717_c7_2492_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2718_c7_d5ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c7_3468_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2724_c7_e578_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2725_c7_004c_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2669_c30_46bc] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c30_46bc_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2669_c41_9bcb_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2669_c10_009f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_left;
     BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output := BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l2669_c57_8fa8] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output := CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2670_c18_f9db] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_left;
     BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output := BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2669_c10_009f_return_output;
     VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2670_c18_f9db_return_output;
     VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2669_c30_46bc_return_output;
     VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2669_c57_8fa8_return_output;
     -- MUX[uxn_opcodes_h_l2669_c10_69e9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2669_c10_69e9_cond <= VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_cond;
     MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue <= VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iftrue;
     MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse <= VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_return_output := MUX_uxn_opcodes_h_l2669_c10_69e9_return_output;

     -- MUX[uxn_opcodes_h_l2670_c18_2f45] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2670_c18_2f45_cond <= VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_cond;
     MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue <= VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iftrue;
     MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse <= VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_return_output := MUX_uxn_opcodes_h_l2670_c18_2f45_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2669_c2_1a4e := VAR_MUX_uxn_opcodes_h_l2669_c10_69e9_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left := VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l2670_c18_2f45_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2669_c2_1a4e;
     VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2669_c2_1a4e, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_3688] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_431c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_afcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_f477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_bba9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_c8c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_a7ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output;

     -- printf_uxn_opcodes_h_l2672_c2_a9f6[uxn_opcodes_h_l2672_c2_a9f6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0 <= VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg0;
     printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1 <= VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg1;
     printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2 <= VAR_printf_uxn_opcodes_h_l2672_c2_a9f6_uxn_opcodes_h_l2672_c2_a9f6_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_7847] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_9e4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_9000] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_bdb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_1354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_22ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_eba7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_4823] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_6895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_left;
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output := BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_5e93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_7bc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_1715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_818c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_699f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_9d18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2692_c11_b264] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_left;
     BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output := BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_3c7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_53ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_7e64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_5e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_84eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_50d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_d972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_dad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_0545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_9eba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_ffbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_fc7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_9c7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_6ddf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_fd27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_536e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_e83d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_cac9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2708_c11_9f26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b1d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_89b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2694_c11_55a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_4873] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2704_c11_1312] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_left;
     BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output := BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_1a7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2691_c11_ce93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_98be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2675_c11_5909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_left;
     BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output := BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_8e3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_54b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_86d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_0115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_4681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_990b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_0455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_left;
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output := BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2677_c11_b1c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_f557] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c6_907b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_567f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_28bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_6c07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_d6ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_aa57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_ad56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_left;
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output := BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_29b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_b8f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c6_907b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_5909_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_6c07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_b1c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_699f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_8e3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_536e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_bba9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_afcf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_22ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_ad56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_990b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_5e93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_431c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_0455_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_86d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_6ddf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_ce93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_b264_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9558_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2694_c11_55a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_28bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_54b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_7bc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_cac9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_aa57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_6895_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_98be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_9d18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_b8f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_1312_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_89b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f477_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_9c7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_9f26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_0115_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_4873_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d6ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_c8c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_5e1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_ffbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b1d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_fd27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_3688_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_50d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_a7ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_7847_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_9eba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4681_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_1715_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_eba7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_53ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d972_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_1354_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_7e64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_818c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_fc7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_e83d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_9e4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_29b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_3c7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9000_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_84eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_4823_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_bdb6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f557_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_0545_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_567f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_dad6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_1a7f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2675_c7_1a6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2676_c7_ba5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2675_c1_f74f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output;
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2675_c1_f74f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2676_c1_b4c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output;

     -- jci[uxn_opcodes_h_l2675_c41_dcc9] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2675_c41_dcc9_phase <= VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_phase;
     jci_uxn_opcodes_h_l2675_c41_dcc9_pc <= VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_pc;
     jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_stack_read;
     jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_return_output := jci_uxn_opcodes_h_l2675_c41_dcc9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2677_c7_24ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output;
     VAR_jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2676_c1_b4c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue := VAR_jci_uxn_opcodes_h_l2675_c41_dcc9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2678_c7_bfbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2677_c1_dfdc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output;

     -- jmi[uxn_opcodes_h_l2676_c41_540d] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2676_c41_540d_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2676_c41_540d_phase <= VAR_jmi_uxn_opcodes_h_l2676_c41_540d_phase;
     jmi_uxn_opcodes_h_l2676_c41_540d_pc <= VAR_jmi_uxn_opcodes_h_l2676_c41_540d_pc;
     jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2676_c41_540d_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2676_c41_540d_return_output := jmi_uxn_opcodes_h_l2676_c41_540d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output;
     VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2677_c1_dfdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue := VAR_jmi_uxn_opcodes_h_l2676_c41_540d_return_output;
     -- jsi[uxn_opcodes_h_l2677_c41_aeb5] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2677_c41_aeb5_phase <= VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_phase;
     jsi_uxn_opcodes_h_l2677_c41_aeb5_pc <= VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_pc;
     jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output := jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2679_c7_485a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2678_c1_bc7f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c7_485a_return_output;
     VAR_lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2678_c1_bc7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue := VAR_jsi_uxn_opcodes_h_l2677_c41_aeb5_return_output;
     -- lit[uxn_opcodes_h_l2678_c41_8448] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2678_c41_8448_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2678_c41_8448_phase <= VAR_lit_uxn_opcodes_h_l2678_c41_8448_phase;
     lit_uxn_opcodes_h_l2678_c41_8448_pc <= VAR_lit_uxn_opcodes_h_l2678_c41_8448_pc;
     lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2678_c41_8448_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2678_c41_8448_return_output := lit_uxn_opcodes_h_l2678_c41_8448_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2679_c1_90bb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2680_c7_cc86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output;
     VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2679_c1_90bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue := VAR_lit_uxn_opcodes_h_l2678_c41_8448_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2680_c1_81b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output;

     -- lit2[uxn_opcodes_h_l2679_c41_8c08] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2679_c41_8c08_phase <= VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_phase;
     lit2_uxn_opcodes_h_l2679_c41_8c08_pc <= VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_pc;
     lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_return_output := lit2_uxn_opcodes_h_l2679_c41_8c08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c7_8cd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output;
     VAR_lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2680_c1_81b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue := VAR_lit2_uxn_opcodes_h_l2679_c41_8c08_return_output;
     -- lit[uxn_opcodes_h_l2680_c41_47fe] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2680_c41_47fe_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2680_c41_47fe_phase <= VAR_lit_uxn_opcodes_h_l2680_c41_47fe_phase;
     lit_uxn_opcodes_h_l2680_c41_47fe_pc <= VAR_lit_uxn_opcodes_h_l2680_c41_47fe_pc;
     lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2680_c41_47fe_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2680_c41_47fe_return_output := lit_uxn_opcodes_h_l2680_c41_47fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2682_c7_6254] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c1_d238] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c7_6254_return_output;
     VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_d238_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue := VAR_lit_uxn_opcodes_h_l2680_c41_47fe_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2683_c7_00fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2682_c1_13ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output;

     -- lit2[uxn_opcodes_h_l2681_c41_0eb3] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2681_c41_0eb3_phase <= VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_phase;
     lit2_uxn_opcodes_h_l2681_c41_0eb3_pc <= VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_pc;
     lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output := lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output;
     VAR_inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2682_c1_13ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue := VAR_lit2_uxn_opcodes_h_l2681_c41_0eb3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2683_c1_043b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output;

     -- inc[uxn_opcodes_h_l2682_c41_198f] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2682_c41_198f_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2682_c41_198f_phase <= VAR_inc_uxn_opcodes_h_l2682_c41_198f_phase;
     inc_uxn_opcodes_h_l2682_c41_198f_ins <= VAR_inc_uxn_opcodes_h_l2682_c41_198f_ins;
     inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2682_c41_198f_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2682_c41_198f_return_output := inc_uxn_opcodes_h_l2682_c41_198f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2684_c7_3c3f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output;
     VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2683_c1_043b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue := VAR_inc_uxn_opcodes_h_l2682_c41_198f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2684_c1_383d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output;

     -- inc2[uxn_opcodes_h_l2683_c41_85cf] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2683_c41_85cf_phase <= VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_phase;
     inc2_uxn_opcodes_h_l2683_c41_85cf_ins <= VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_ins;
     inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_return_output := inc2_uxn_opcodes_h_l2683_c41_85cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c7_bc77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output;
     VAR_pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2684_c1_383d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue := VAR_inc2_uxn_opcodes_h_l2683_c41_85cf_return_output;
     -- pop[uxn_opcodes_h_l2684_c41_f209] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2684_c41_f209_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2684_c41_f209_phase <= VAR_pop_uxn_opcodes_h_l2684_c41_f209_phase;
     pop_uxn_opcodes_h_l2684_c41_f209_ins <= VAR_pop_uxn_opcodes_h_l2684_c41_f209_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2684_c41_f209_return_output := pop_uxn_opcodes_h_l2684_c41_f209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2686_c7_f2f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c1_8b61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output;
     VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_8b61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue := VAR_pop_uxn_opcodes_h_l2684_c41_f209_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2686_c1_e66a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2687_c7_546f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output;

     -- pop2[uxn_opcodes_h_l2685_c41_7de9] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2685_c41_7de9_phase <= VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_phase;
     pop2_uxn_opcodes_h_l2685_c41_7de9_ins <= VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_return_output := pop2_uxn_opcodes_h_l2685_c41_7de9_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c7_546f_return_output;
     VAR_nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2686_c1_e66a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue := VAR_pop2_uxn_opcodes_h_l2685_c41_7de9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2687_c1_63b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2688_c7_f954] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output;

     -- nip[uxn_opcodes_h_l2686_c41_d352] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2686_c41_d352_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2686_c41_d352_phase <= VAR_nip_uxn_opcodes_h_l2686_c41_d352_phase;
     nip_uxn_opcodes_h_l2686_c41_d352_ins <= VAR_nip_uxn_opcodes_h_l2686_c41_d352_ins;
     nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2686_c41_d352_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2686_c41_d352_return_output := nip_uxn_opcodes_h_l2686_c41_d352_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c7_f954_return_output;
     VAR_nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2687_c1_63b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue := VAR_nip_uxn_opcodes_h_l2686_c41_d352_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2689_c7_b28f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2688_c1_1276] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output;

     -- nip2[uxn_opcodes_h_l2687_c41_a676] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2687_c41_a676_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2687_c41_a676_phase <= VAR_nip2_uxn_opcodes_h_l2687_c41_a676_phase;
     nip2_uxn_opcodes_h_l2687_c41_a676_ins <= VAR_nip2_uxn_opcodes_h_l2687_c41_a676_ins;
     nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2687_c41_a676_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2687_c41_a676_return_output := nip2_uxn_opcodes_h_l2687_c41_a676_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output;
     VAR_swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2688_c1_1276_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue := VAR_nip2_uxn_opcodes_h_l2687_c41_a676_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2690_c7_9702] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2689_c1_bd0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output;

     -- swp[uxn_opcodes_h_l2688_c41_dd85] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2688_c41_dd85_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2688_c41_dd85_phase <= VAR_swp_uxn_opcodes_h_l2688_c41_dd85_phase;
     swp_uxn_opcodes_h_l2688_c41_dd85_ins <= VAR_swp_uxn_opcodes_h_l2688_c41_dd85_ins;
     swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2688_c41_dd85_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2688_c41_dd85_return_output := swp_uxn_opcodes_h_l2688_c41_dd85_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c7_9702_return_output;
     VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2689_c1_bd0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue := VAR_swp_uxn_opcodes_h_l2688_c41_dd85_return_output;
     -- swp2[uxn_opcodes_h_l2689_c41_f97e] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2689_c41_f97e_phase <= VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_phase;
     swp2_uxn_opcodes_h_l2689_c41_f97e_ins <= VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_ins;
     swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_return_output := swp2_uxn_opcodes_h_l2689_c41_f97e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2690_c1_59eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2691_c7_bc7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output;
     VAR_rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2690_c1_59eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue := VAR_swp2_uxn_opcodes_h_l2689_c41_f97e_return_output;
     -- rot[uxn_opcodes_h_l2690_c41_18f3] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2690_c41_18f3_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2690_c41_18f3_phase <= VAR_rot_uxn_opcodes_h_l2690_c41_18f3_phase;
     rot_uxn_opcodes_h_l2690_c41_18f3_ins <= VAR_rot_uxn_opcodes_h_l2690_c41_18f3_ins;
     rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2690_c41_18f3_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2690_c41_18f3_return_output := rot_uxn_opcodes_h_l2690_c41_18f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2691_c1_2ce4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2692_c7_0cb4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output;
     VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2691_c1_2ce4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue := VAR_rot_uxn_opcodes_h_l2690_c41_18f3_return_output;
     -- rot2[uxn_opcodes_h_l2691_c41_6fd1] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2691_c41_6fd1_phase <= VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_phase;
     rot2_uxn_opcodes_h_l2691_c41_6fd1_ins <= VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_ins;
     rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output := rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2693_c7_265e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2692_c1_419d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c7_265e_return_output;
     VAR_dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2692_c1_419d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue := VAR_rot2_uxn_opcodes_h_l2691_c41_6fd1_return_output;
     -- dup[uxn_opcodes_h_l2692_c41_69c8] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2692_c41_69c8_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2692_c41_69c8_phase <= VAR_dup_uxn_opcodes_h_l2692_c41_69c8_phase;
     dup_uxn_opcodes_h_l2692_c41_69c8_ins <= VAR_dup_uxn_opcodes_h_l2692_c41_69c8_ins;
     dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2692_c41_69c8_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2692_c41_69c8_return_output := dup_uxn_opcodes_h_l2692_c41_69c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2693_c1_3f9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2694_c7_85dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output;
     VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2693_c1_3f9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue := VAR_dup_uxn_opcodes_h_l2692_c41_69c8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2695_c7_f71c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2694_c1_0d93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output;

     -- dup2[uxn_opcodes_h_l2693_c41_c4dc] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2693_c41_c4dc_phase <= VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_phase;
     dup2_uxn_opcodes_h_l2693_c41_c4dc_ins <= VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_ins;
     dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output := dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output;
     VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2694_c1_0d93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue := VAR_dup2_uxn_opcodes_h_l2693_c41_c4dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2695_c1_e20a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output;

     -- ovr[uxn_opcodes_h_l2694_c41_61c1] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2694_c41_61c1_phase <= VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_phase;
     ovr_uxn_opcodes_h_l2694_c41_61c1_ins <= VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_ins;
     ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_return_output := ovr_uxn_opcodes_h_l2694_c41_61c1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2696_c7_9ac5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output;
     VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2695_c1_e20a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue := VAR_ovr_uxn_opcodes_h_l2694_c41_61c1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2696_c1_1eb5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output;

     -- ovr2[uxn_opcodes_h_l2695_c41_d72a] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2695_c41_d72a_phase <= VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_phase;
     ovr2_uxn_opcodes_h_l2695_c41_d72a_ins <= VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_ins;
     ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output := ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2697_c7_7cf9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output;
     VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2696_c1_1eb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue := VAR_ovr2_uxn_opcodes_h_l2695_c41_d72a_return_output;
     -- equ[uxn_opcodes_h_l2696_c41_b5ba] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2696_c41_b5ba_phase <= VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_phase;
     equ_uxn_opcodes_h_l2696_c41_b5ba_ins <= VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_ins;
     equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_return_output := equ_uxn_opcodes_h_l2696_c41_b5ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2697_c1_f3ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2698_c7_12fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output;
     VAR_equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2697_c1_f3ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue := VAR_equ_uxn_opcodes_h_l2696_c41_b5ba_return_output;
     -- equ2[uxn_opcodes_h_l2697_c41_0340] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2697_c41_0340_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2697_c41_0340_phase <= VAR_equ2_uxn_opcodes_h_l2697_c41_0340_phase;
     equ2_uxn_opcodes_h_l2697_c41_0340_ins <= VAR_equ2_uxn_opcodes_h_l2697_c41_0340_ins;
     equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2697_c41_0340_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2697_c41_0340_return_output := equ2_uxn_opcodes_h_l2697_c41_0340_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2699_c7_cf2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2698_c1_eabf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output;
     VAR_neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2698_c1_eabf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue := VAR_equ2_uxn_opcodes_h_l2697_c41_0340_return_output;
     -- neq[uxn_opcodes_h_l2698_c41_6b20] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2698_c41_6b20_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2698_c41_6b20_phase <= VAR_neq_uxn_opcodes_h_l2698_c41_6b20_phase;
     neq_uxn_opcodes_h_l2698_c41_6b20_ins <= VAR_neq_uxn_opcodes_h_l2698_c41_6b20_ins;
     neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2698_c41_6b20_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2698_c41_6b20_return_output := neq_uxn_opcodes_h_l2698_c41_6b20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c7_d238] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2699_c1_5b83] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c7_d238_return_output;
     VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2699_c1_5b83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue := VAR_neq_uxn_opcodes_h_l2698_c41_6b20_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c1_9177] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output;

     -- neq2[uxn_opcodes_h_l2699_c41_8dcb] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2699_c41_8dcb_phase <= VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_phase;
     neq2_uxn_opcodes_h_l2699_c41_8dcb_ins <= VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_ins;
     neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output := neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c7_9594] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_9594_return_output;
     VAR_gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_9177_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue := VAR_neq2_uxn_opcodes_h_l2699_c41_8dcb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c7_c8c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output;

     -- gth[uxn_opcodes_h_l2700_c41_61c7] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2700_c41_61c7_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2700_c41_61c7_phase <= VAR_gth_uxn_opcodes_h_l2700_c41_61c7_phase;
     gth_uxn_opcodes_h_l2700_c41_61c7_ins <= VAR_gth_uxn_opcodes_h_l2700_c41_61c7_ins;
     gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2700_c41_61c7_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2700_c41_61c7_return_output := gth_uxn_opcodes_h_l2700_c41_61c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c1_29b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output;
     VAR_gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_29b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue := VAR_gth_uxn_opcodes_h_l2700_c41_61c7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c1_3c27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output;

     -- gth2[uxn_opcodes_h_l2701_c41_4018] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2701_c41_4018_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2701_c41_4018_phase <= VAR_gth2_uxn_opcodes_h_l2701_c41_4018_phase;
     gth2_uxn_opcodes_h_l2701_c41_4018_ins <= VAR_gth2_uxn_opcodes_h_l2701_c41_4018_ins;
     gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2701_c41_4018_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2701_c41_4018_return_output := gth2_uxn_opcodes_h_l2701_c41_4018_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c7_ed3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output;
     VAR_lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_3c27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue := VAR_gth2_uxn_opcodes_h_l2701_c41_4018_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c1_6532] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output;

     -- lth[uxn_opcodes_h_l2702_c41_a35b] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2702_c41_a35b_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2702_c41_a35b_phase <= VAR_lth_uxn_opcodes_h_l2702_c41_a35b_phase;
     lth_uxn_opcodes_h_l2702_c41_a35b_ins <= VAR_lth_uxn_opcodes_h_l2702_c41_a35b_ins;
     lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2702_c41_a35b_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2702_c41_a35b_return_output := lth_uxn_opcodes_h_l2702_c41_a35b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c7_3016] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_3016_return_output;
     VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_6532_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue := VAR_lth_uxn_opcodes_h_l2702_c41_a35b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c7_6361] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output;

     -- lth2[uxn_opcodes_h_l2703_c41_fc3a] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2703_c41_fc3a_phase <= VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_phase;
     lth2_uxn_opcodes_h_l2703_c41_fc3a_ins <= VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_ins;
     lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output := lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c1_5d55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6361_return_output;
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_5d55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue := VAR_lth2_uxn_opcodes_h_l2703_c41_fc3a_return_output;
     -- jmp[uxn_opcodes_h_l2704_c41_18cf] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2704_c41_18cf_phase <= VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_phase;
     jmp_uxn_opcodes_h_l2704_c41_18cf_ins <= VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_ins;
     jmp_uxn_opcodes_h_l2704_c41_18cf_pc <= VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_pc;
     jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_return_output := jmp_uxn_opcodes_h_l2704_c41_18cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c7_659d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c1_8380] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_659d_return_output;
     VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_8380_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue := VAR_jmp_uxn_opcodes_h_l2704_c41_18cf_return_output;
     -- jmp2[uxn_opcodes_h_l2705_c41_6253] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2705_c41_6253_phase <= VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_phase;
     jmp2_uxn_opcodes_h_l2705_c41_6253_ins <= VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_ins;
     jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_return_output := jmp2_uxn_opcodes_h_l2705_c41_6253_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c7_065f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c1_566f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_065f_return_output;
     VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_566f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue := VAR_jmp2_uxn_opcodes_h_l2705_c41_6253_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c7_d3d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c1_4578] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output;

     -- printf_uxn_opcodes_h_l2706_c28_a20f[uxn_opcodes_h_l2706_c28_a20f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0 <= VAR_printf_uxn_opcodes_h_l2706_c28_a20f_uxn_opcodes_h_l2706_c28_a20f_arg0;
     -- Outputs

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output;
     VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_4578_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_749f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output;

     -- printf_uxn_opcodes_h_l2707_c28_f87a[uxn_opcodes_h_l2707_c28_f87a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0 <= VAR_printf_uxn_opcodes_h_l2707_c28_f87a_uxn_opcodes_h_l2707_c28_f87a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_7d2e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_749f_return_output;
     VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_7d2e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_0065] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output;

     -- printf_uxn_opcodes_h_l2708_c28_9444[uxn_opcodes_h_l2708_c28_9444] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0 <= VAR_printf_uxn_opcodes_h_l2708_c28_9444_uxn_opcodes_h_l2708_c28_9444_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_3f78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0065_return_output;
     VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_3f78_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_3de0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_5001] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output;

     -- jsr2[uxn_opcodes_h_l2709_c41_3317] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2709_c41_3317_phase <= VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_phase;
     jsr2_uxn_opcodes_h_l2709_c41_3317_ins <= VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_ins;
     jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_return_output := jsr2_uxn_opcodes_h_l2709_c41_3317_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_5001_return_output;
     VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_3de0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue := VAR_jsr2_uxn_opcodes_h_l2709_c41_3317_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_59d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output;

     -- printf_uxn_opcodes_h_l2710_c28_d90d[uxn_opcodes_h_l2710_c28_d90d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0 <= VAR_printf_uxn_opcodes_h_l2710_c28_d90d_uxn_opcodes_h_l2710_c28_d90d_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_ee5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output;
     VAR_sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_ee5d_return_output;
     -- sth2[uxn_opcodes_h_l2711_c41_9958] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2711_c41_9958_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2711_c41_9958_phase <= VAR_sth2_uxn_opcodes_h_l2711_c41_9958_phase;
     sth2_uxn_opcodes_h_l2711_c41_9958_ins <= VAR_sth2_uxn_opcodes_h_l2711_c41_9958_ins;
     sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2711_c41_9958_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2711_c41_9958_return_output := sth2_uxn_opcodes_h_l2711_c41_9958_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_5ecf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_a431] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_a431_return_output;
     VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_5ecf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue := VAR_sth2_uxn_opcodes_h_l2711_c41_9958_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_4b23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_4f31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output;

     -- printf_uxn_opcodes_h_l2712_c28_1781[uxn_opcodes_h_l2712_c28_1781] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0 <= VAR_printf_uxn_opcodes_h_l2712_c28_1781_uxn_opcodes_h_l2712_c28_1781_arg0;
     -- Outputs

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output;
     VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_4b23_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_d517] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_b21e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output;

     -- printf_uxn_opcodes_h_l2713_c28_594d[uxn_opcodes_h_l2713_c28_594d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0 <= VAR_printf_uxn_opcodes_h_l2713_c28_594d_uxn_opcodes_h_l2713_c28_594d_arg0;
     -- Outputs

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_d517_return_output;
     VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b21e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_8a54] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_d0bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output;

     -- printf_uxn_opcodes_h_l2714_c28_f40e[uxn_opcodes_h_l2714_c28_f40e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0 <= VAR_printf_uxn_opcodes_h_l2714_c28_f40e_uxn_opcodes_h_l2714_c28_f40e_arg0;
     -- Outputs

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output;
     VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_8a54_return_output;
     -- printf_uxn_opcodes_h_l2715_c28_108f[uxn_opcodes_h_l2715_c28_108f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0 <= VAR_printf_uxn_opcodes_h_l2715_c28_108f_uxn_opcodes_h_l2715_c28_108f_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_15b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_2492] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_2492_return_output;
     VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_15b6_return_output;
     -- printf_uxn_opcodes_h_l2716_c28_c520[uxn_opcodes_h_l2716_c28_c520] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0 <= VAR_printf_uxn_opcodes_h_l2716_c28_c520_uxn_opcodes_h_l2716_c28_c520_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_dd58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_d5ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output;
     VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_dd58_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_af70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_3468] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output;

     -- printf_uxn_opcodes_h_l2717_c28_2ae6[uxn_opcodes_h_l2717_c28_2ae6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0 <= VAR_printf_uxn_opcodes_h_l2717_c28_2ae6_uxn_opcodes_h_l2717_c28_2ae6_arg0;
     -- Outputs

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_3468_return_output;
     VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_af70_return_output;
     -- printf_uxn_opcodes_h_l2718_c28_a010[uxn_opcodes_h_l2718_c28_a010] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0 <= VAR_printf_uxn_opcodes_h_l2718_c28_a010_uxn_opcodes_h_l2718_c28_a010_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_d2f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_3af8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output;
     VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_3af8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_28e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output;

     -- printf_uxn_opcodes_h_l2719_c28_203a[uxn_opcodes_h_l2719_c28_203a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0 <= VAR_printf_uxn_opcodes_h_l2719_c28_203a_uxn_opcodes_h_l2719_c28_203a_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_444a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output;
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_444a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_346e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output;

     -- lda[uxn_opcodes_h_l2720_c41_9cb1] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2720_c41_9cb1_phase <= VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_phase;
     lda_uxn_opcodes_h_l2720_c41_9cb1_ins <= VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_ins;
     lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_stack_read;
     lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_return_output := lda_uxn_opcodes_h_l2720_c41_9cb1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_1013] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_1013_return_output;
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_346e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue := VAR_lda_uxn_opcodes_h_l2720_c41_9cb1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_76ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_7df1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output;

     -- lda2[uxn_opcodes_h_l2721_c41_98a9] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2721_c41_98a9_phase <= VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_phase;
     lda2_uxn_opcodes_h_l2721_c41_98a9_ins <= VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_ins;
     lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_stack_read;
     lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_return_output := lda2_uxn_opcodes_h_l2721_c41_98a9_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output;
     VAR_sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_76ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue := VAR_lda2_uxn_opcodes_h_l2721_c41_98a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_0d59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_e578] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output;

     -- sta[uxn_opcodes_h_l2722_c41_ceca] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2722_c41_ceca_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2722_c41_ceca_phase <= VAR_sta_uxn_opcodes_h_l2722_c41_ceca_phase;
     sta_uxn_opcodes_h_l2722_c41_ceca_ins <= VAR_sta_uxn_opcodes_h_l2722_c41_ceca_ins;
     sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2722_c41_ceca_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2722_c41_ceca_return_output := sta_uxn_opcodes_h_l2722_c41_ceca_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_e578_return_output;
     VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_0d59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue := VAR_sta_uxn_opcodes_h_l2722_c41_ceca_return_output;
     -- sta2[uxn_opcodes_h_l2723_c41_fc5c] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2723_c41_fc5c_phase <= VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_phase;
     sta2_uxn_opcodes_h_l2723_c41_fc5c_ins <= VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_ins;
     sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output := sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_004c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_3295] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_004c_return_output;
     VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_3295_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue := VAR_sta2_uxn_opcodes_h_l2723_c41_fc5c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_ca7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_af49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output;

     -- printf_uxn_opcodes_h_l2724_c28_c52d[uxn_opcodes_h_l2724_c28_c52d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0 <= VAR_printf_uxn_opcodes_h_l2724_c28_c52d_uxn_opcodes_h_l2724_c28_c52d_arg0;
     -- Outputs

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output;
     VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_af49_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_b2f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_4237] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output;

     -- printf_uxn_opcodes_h_l2725_c28_6612[uxn_opcodes_h_l2725_c28_6612] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0 <= VAR_printf_uxn_opcodes_h_l2725_c28_6612_uxn_opcodes_h_l2725_c28_6612_arg0;
     -- Outputs

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output;
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4237_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_96ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_1f60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output;

     -- deo[uxn_opcodes_h_l2726_c41_f532] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2726_c41_f532_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2726_c41_f532_phase <= VAR_deo_uxn_opcodes_h_l2726_c41_f532_phase;
     deo_uxn_opcodes_h_l2726_c41_f532_ins <= VAR_deo_uxn_opcodes_h_l2726_c41_f532_ins;
     deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_stack_read;
     deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2726_c41_f532_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2726_c41_f532_return_output := deo_uxn_opcodes_h_l2726_c41_f532_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output;
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_1f60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue := VAR_deo_uxn_opcodes_h_l2726_c41_f532_return_output;
     -- deo2[uxn_opcodes_h_l2727_c41_6175] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2727_c41_6175_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2727_c41_6175_phase <= VAR_deo2_uxn_opcodes_h_l2727_c41_6175_phase;
     deo2_uxn_opcodes_h_l2727_c41_6175_ins <= VAR_deo2_uxn_opcodes_h_l2727_c41_6175_ins;
     deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_stack_read;
     deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2727_c41_6175_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2727_c41_6175_return_output := deo2_uxn_opcodes_h_l2727_c41_6175_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_5e8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_be86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output;
     VAR_add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_be86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue := VAR_deo2_uxn_opcodes_h_l2727_c41_6175_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_d7f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output;

     -- add[uxn_opcodes_h_l2728_c41_fce9] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2728_c41_fce9_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2728_c41_fce9_phase <= VAR_add_uxn_opcodes_h_l2728_c41_fce9_phase;
     add_uxn_opcodes_h_l2728_c41_fce9_ins <= VAR_add_uxn_opcodes_h_l2728_c41_fce9_ins;
     add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read <= VAR_add_uxn_opcodes_h_l2728_c41_fce9_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2728_c41_fce9_return_output := add_uxn_opcodes_h_l2728_c41_fce9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_2b57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output;
     VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_2b57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue := VAR_add_uxn_opcodes_h_l2728_c41_fce9_return_output;
     -- add2[uxn_opcodes_h_l2729_c41_c3c8] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2729_c41_c3c8_phase <= VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_phase;
     add2_uxn_opcodes_h_l2729_c41_c3c8_ins <= VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_ins;
     add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_return_output := add2_uxn_opcodes_h_l2729_c41_c3c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_32cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_4eb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output;
     VAR_sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_32cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue := VAR_add2_uxn_opcodes_h_l2729_c41_c3c8_return_output;
     -- sub[uxn_opcodes_h_l2730_c41_27c8] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2730_c41_27c8_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2730_c41_27c8_phase <= VAR_sub_uxn_opcodes_h_l2730_c41_27c8_phase;
     sub_uxn_opcodes_h_l2730_c41_27c8_ins <= VAR_sub_uxn_opcodes_h_l2730_c41_27c8_ins;
     sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2730_c41_27c8_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2730_c41_27c8_return_output := sub_uxn_opcodes_h_l2730_c41_27c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_7da2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_085a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_085a_return_output;
     VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_7da2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue := VAR_sub_uxn_opcodes_h_l2730_c41_27c8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_88e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output;

     -- sub2[uxn_opcodes_h_l2731_c41_a56f] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2731_c41_a56f_phase <= VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_phase;
     sub2_uxn_opcodes_h_l2731_c41_a56f_ins <= VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_ins;
     sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_return_output := sub2_uxn_opcodes_h_l2731_c41_a56f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_7b35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output;
     VAR_mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_7b35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue := VAR_sub2_uxn_opcodes_h_l2731_c41_a56f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_d716] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output;

     -- mul[uxn_opcodes_h_l2732_c41_ba40] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2732_c41_ba40_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2732_c41_ba40_phase <= VAR_mul_uxn_opcodes_h_l2732_c41_ba40_phase;
     mul_uxn_opcodes_h_l2732_c41_ba40_ins <= VAR_mul_uxn_opcodes_h_l2732_c41_ba40_ins;
     mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2732_c41_ba40_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2732_c41_ba40_return_output := mul_uxn_opcodes_h_l2732_c41_ba40_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_8f85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output;
     VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_d716_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue := VAR_mul_uxn_opcodes_h_l2732_c41_ba40_return_output;
     -- mul2[uxn_opcodes_h_l2733_c41_85ac] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2733_c41_85ac_phase <= VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_phase;
     mul2_uxn_opcodes_h_l2733_c41_85ac_ins <= VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_ins;
     mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_return_output := mul2_uxn_opcodes_h_l2733_c41_85ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_ccc2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_e7f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output;
     VAR_div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_ccc2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue := VAR_mul2_uxn_opcodes_h_l2733_c41_85ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_6251] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output;

     -- div[uxn_opcodes_h_l2734_c41_a0a7] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2734_c41_a0a7_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2734_c41_a0a7_phase <= VAR_div_uxn_opcodes_h_l2734_c41_a0a7_phase;
     div_uxn_opcodes_h_l2734_c41_a0a7_ins <= VAR_div_uxn_opcodes_h_l2734_c41_a0a7_ins;
     div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read <= VAR_div_uxn_opcodes_h_l2734_c41_a0a7_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2734_c41_a0a7_return_output := div_uxn_opcodes_h_l2734_c41_a0a7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_ca73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output;
     VAR_div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_6251_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue := VAR_div_uxn_opcodes_h_l2734_c41_a0a7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_81ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_0211] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output;

     -- div2[uxn_opcodes_h_l2735_c41_93db] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2735_c41_93db_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2735_c41_93db_phase <= VAR_div2_uxn_opcodes_h_l2735_c41_93db_phase;
     div2_uxn_opcodes_h_l2735_c41_93db_ins <= VAR_div2_uxn_opcodes_h_l2735_c41_93db_ins;
     div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2735_c41_93db_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2735_c41_93db_return_output := div2_uxn_opcodes_h_l2735_c41_93db_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output;
     VAR_and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_0211_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue := VAR_div2_uxn_opcodes_h_l2735_c41_93db_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_7776] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output;

     -- and[uxn_opcodes_h_l2736_c41_f29c] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2736_c41_f29c_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2736_c41_f29c_phase <= VAR_and_uxn_opcodes_h_l2736_c41_f29c_phase;
     and_uxn_opcodes_h_l2736_c41_f29c_ins <= VAR_and_uxn_opcodes_h_l2736_c41_f29c_ins;
     and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read <= VAR_and_uxn_opcodes_h_l2736_c41_f29c_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2736_c41_f29c_return_output := and_uxn_opcodes_h_l2736_c41_f29c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_7e55] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output;
     VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7776_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue := VAR_and_uxn_opcodes_h_l2736_c41_f29c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_e2de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output;

     -- and2[uxn_opcodes_h_l2737_c41_2d4f] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2737_c41_2d4f_phase <= VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_phase;
     and2_uxn_opcodes_h_l2737_c41_2d4f_ins <= VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_ins;
     and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_return_output := and2_uxn_opcodes_h_l2737_c41_2d4f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_aa1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output;
     VAR_ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_aa1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue := VAR_and2_uxn_opcodes_h_l2737_c41_2d4f_return_output;
     -- ora[uxn_opcodes_h_l2738_c41_3561] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2738_c41_3561_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2738_c41_3561_phase <= VAR_ora_uxn_opcodes_h_l2738_c41_3561_phase;
     ora_uxn_opcodes_h_l2738_c41_3561_ins <= VAR_ora_uxn_opcodes_h_l2738_c41_3561_ins;
     ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2738_c41_3561_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2738_c41_3561_return_output := ora_uxn_opcodes_h_l2738_c41_3561_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_5f23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_1a0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output;
     VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1a0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue := VAR_ora_uxn_opcodes_h_l2738_c41_3561_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_6929] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output;

     -- ora2[uxn_opcodes_h_l2739_c41_f0f3] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2739_c41_f0f3_phase <= VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_phase;
     ora2_uxn_opcodes_h_l2739_c41_f0f3_ins <= VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_ins;
     ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output := ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_1fed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output;
     VAR_eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_6929_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue := VAR_ora2_uxn_opcodes_h_l2739_c41_f0f3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5c3e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_b0b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output;

     -- eor[uxn_opcodes_h_l2740_c41_5177] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2740_c41_5177_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2740_c41_5177_phase <= VAR_eor_uxn_opcodes_h_l2740_c41_5177_phase;
     eor_uxn_opcodes_h_l2740_c41_5177_ins <= VAR_eor_uxn_opcodes_h_l2740_c41_5177_ins;
     eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2740_c41_5177_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2740_c41_5177_return_output := eor_uxn_opcodes_h_l2740_c41_5177_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output;
     VAR_eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_b0b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue := VAR_eor_uxn_opcodes_h_l2740_c41_5177_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_1534] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output;

     -- eor2[uxn_opcodes_h_l2741_c41_3780] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2741_c41_3780_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2741_c41_3780_phase <= VAR_eor2_uxn_opcodes_h_l2741_c41_3780_phase;
     eor2_uxn_opcodes_h_l2741_c41_3780_ins <= VAR_eor2_uxn_opcodes_h_l2741_c41_3780_ins;
     eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2741_c41_3780_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2741_c41_3780_return_output := eor2_uxn_opcodes_h_l2741_c41_3780_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_4ccd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output;
     VAR_sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_1534_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue := VAR_eor2_uxn_opcodes_h_l2741_c41_3780_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_0fb5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output;

     -- sft[uxn_opcodes_h_l2742_c41_712b] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2742_c41_712b_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2742_c41_712b_phase <= VAR_sft_uxn_opcodes_h_l2742_c41_712b_phase;
     sft_uxn_opcodes_h_l2742_c41_712b_ins <= VAR_sft_uxn_opcodes_h_l2742_c41_712b_ins;
     sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2742_c41_712b_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2742_c41_712b_return_output := sft_uxn_opcodes_h_l2742_c41_712b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_fbc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_0fb5_return_output;
     VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_fbc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue := VAR_sft_uxn_opcodes_h_l2742_c41_712b_return_output;
     -- sft2[uxn_opcodes_h_l2743_c41_3e26] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2743_c41_3e26_phase <= VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_phase;
     sft2_uxn_opcodes_h_l2743_c41_3e26_ins <= VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_ins;
     sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_return_output := sft2_uxn_opcodes_h_l2743_c41_3e26_return_output;

     -- printf_uxn_opcodes_h_l2744_c9_3e9b[uxn_opcodes_h_l2744_c9_3e9b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0 <= VAR_printf_uxn_opcodes_h_l2744_c9_3e9b_uxn_opcodes_h_l2744_c9_3e9b_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue := VAR_sft2_uxn_opcodes_h_l2743_c41_3e26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_4ccd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_4ccd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_5c3e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5c3e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_1fed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_1fed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_5f23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_5f23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_e2de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_e2de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_7e55] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_7e55_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_81ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_81ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_ca73] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_ca73_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_e7f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_e7f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_8f85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_8f85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_88e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_88e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_085a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_085a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_4eb9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_4eb9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_d7f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_d7f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_5e8d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_5e8d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_96ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_96ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_b2f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_b2f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_ca7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_ca7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_004c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_004c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_e578] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_e578_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_7df1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_7df1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_1013] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_1013_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_28e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_28e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_d2f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_d2f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c7_3468] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_3468_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2718_c7_d5ae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_cond;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output := opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_d5ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2717_c7_2492] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_cond;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output := opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_2492_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2716_c7_d0bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output := opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_d0bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2715_c7_d517] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_cond;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output := opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_d517_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2714_c7_4f31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_cond;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output := opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_4f31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2713_c7_a431] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_cond;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output := opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_a431_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2712_c7_59d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output := opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_59d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2711_c7_5001] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_cond;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output := opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_5001_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2710_c7_0065] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_cond;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output := opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0065_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2709_c7_749f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_cond;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output := opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_749f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2708_c7_d3d2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_cond;
     opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output := opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_d3d2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2707_c7_065f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_cond;
     opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output := opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_065f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2706_c7_659d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_cond;
     opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output := opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_659d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2705_c7_6361] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_cond;
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output := opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6361_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2704_c7_3016] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_cond;
     opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output := opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_3016_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2703_c7_ed3a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_cond;
     opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output := opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_ed3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2702_c7_c8c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output := opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_c8c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2701_c7_9594] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_cond;
     opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output := opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_9594_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2700_c7_d238] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_cond;
     opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output := opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c7_d238_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2699_c7_cf2d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_cond;
     opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output := opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2699_c7_cf2d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2698_c7_12fb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_cond;
     opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output := opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2698_c7_12fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2697_c7_7cf9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_cond;
     opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output := opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2697_c7_7cf9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2696_c7_9ac5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_cond;
     opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output := opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2696_c7_9ac5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2695_c7_f71c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_cond;
     opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output := opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2695_c7_f71c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2694_c7_85dd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_cond;
     opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output := opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2694_c7_85dd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2693_c7_265e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_cond;
     opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output := opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2693_c7_265e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2692_c7_0cb4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_cond;
     opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output := opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2692_c7_0cb4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2691_c7_bc7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output := opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2691_c7_bc7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2690_c7_9702] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_cond;
     opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output := opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2690_c7_9702_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2689_c7_b28f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_cond;
     opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output := opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2689_c7_b28f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2688_c7_f954] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_cond;
     opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output := opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2688_c7_f954_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2687_c7_546f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_cond;
     opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output := opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2687_c7_546f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2686_c7_f2f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output := opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2686_c7_f2f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2685_c7_bc77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_cond;
     opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output := opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2685_c7_bc77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2684_c7_3c3f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_cond;
     opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output := opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2684_c7_3c3f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2683_c7_00fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output := opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2683_c7_00fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2682_c7_6254] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_cond;
     opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output := opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2682_c7_6254_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2681_c7_8cd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output := opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2681_c7_8cd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2680_c7_cc86] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_cond;
     opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output := opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2680_c7_cc86_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2679_c7_485a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_cond;
     opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output := opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2679_c7_485a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2678_c7_bfbe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_cond;
     opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output := opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2678_c7_bfbe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2677_c7_24ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output := opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2677_c7_24ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2676_c7_ba5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_cond;
     opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output := opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2676_c7_ba5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2675_c7_1a6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output := opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2675_c7_1a6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2674_c2_3ccb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_cond;
     opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output := opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2794_c34_5cf5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2794_c34_5cf5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2782_c3_ae65] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2782_c3_ae65_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l2796_c31_413b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2796_c31_413b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l2785_c3_5107] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2785_c3_5107_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2747_l2756_l2759_DUPLICATE_a6ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2747_l2756_l2759_DUPLICATE_a6ce_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2795_c33_d2b6] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2795_c33_d2b6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l2792_c29_290f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2792_c29_290f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l2790_c32_d659] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2790_c32_d659_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2755_c19_2f12] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_c19_2f12_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l2781_c3_d99c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2781_c3_d99c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.device_ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2784_l2780_DUPLICATE_87ad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2784_l2780_DUPLICATE_87ad_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2797_c32_280e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2797_c32_280e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l2757_c22_dcd7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2757_c22_dcd7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2746_c6_12a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2746_c6_12a8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2788_c34_3937] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2788_c34_3937_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l2789_c23_c232] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2789_c23_c232_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l2754_c18_7835] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2754_c18_7835_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2750_DUPLICATE_2a1a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2750_DUPLICATE_2a1a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2791_c33_e8d1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2791_c33_e8d1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2756_c82_2b3e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2756_c82_2b3e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l2793_c30_d11a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2793_c30_d11a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2674_c2_3ccb_return_output.ram_value;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2750_DUPLICATE_2a1a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2750_DUPLICATE_2a1a_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2785_c3_5107_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2782_c3_ae65_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2746_c6_12a8_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2746_c6_12a8_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2747_l2756_l2759_DUPLICATE_a6ce_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2754_c18_7835_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2754_c18_7835_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2754_c18_7835_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_c19_2f12_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_c19_2f12_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2755_c19_2f12_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2784_l2780_DUPLICATE_87ad_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2784_l2780_DUPLICATE_87ad_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2781_c3_d99c_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2756_c82_2b3e_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2757_c22_dcd7_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2757_c22_dcd7_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2757_c22_dcd7_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2748_c4_09f7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2750_c4_d876] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2799_l2652_DUPLICATE_b89a LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2799_l2652_DUPLICATE_b89a_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2788_c34_3937_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2789_c23_c232_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2790_c32_d659_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2791_c33_e8d1_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2792_c29_290f_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2793_c30_d11a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2794_c34_5cf5_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2795_c33_d2b6_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2796_c31_413b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2797_c32_280e_return_output);

     -- device_ram_update[uxn_opcodes_h_l2779_c26_a4b5] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0 <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address0;
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_value;
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_write0_enable;
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read0_enable;
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1 <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_address1;
     device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output := device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l2748_c4_1ece := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2748_c4_09f7_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2750_c4_751b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2750_c4_d876_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     VAR_MUX_uxn_opcodes_h_l2756_c19_8642_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2747_l2759_l2756_DUPLICATE_c6ea_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2799_l2652_DUPLICATE_b89a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2799_l2652_DUPLICATE_b89a_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l2779_c2_2712 := resize(VAR_device_ram_update_uxn_opcodes_h_l2779_c26_a4b5_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l2779_c2_2712;
     VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse := VAR_sp0_uxn_opcodes_h_l2750_c4_751b;
     VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue := VAR_sp1_uxn_opcodes_h_l2748_c4_1ece;
     -- sp1_MUX[uxn_opcodes_h_l2747_c3_fcd7] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond;
     sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue;
     sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output := sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2747_c3_fcd7] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_cond;
     sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iftrue;
     sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output := sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_e453] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_779b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_779b_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e453_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2747_c3_fcd7_return_output;
     -- sp1_MUX[uxn_opcodes_h_l2746_c2_552d] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_cond;
     sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue;
     sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output := sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2746_c2_552d] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_cond;
     sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iftrue;
     sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output := sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;
     VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2746_c2_552d_return_output;
     -- MUX[uxn_opcodes_h_l2756_c19_8642] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2756_c19_8642_cond <= VAR_MUX_uxn_opcodes_h_l2756_c19_8642_cond;
     MUX_uxn_opcodes_h_l2756_c19_8642_iftrue <= VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iftrue;
     MUX_uxn_opcodes_h_l2756_c19_8642_iffalse <= VAR_MUX_uxn_opcodes_h_l2756_c19_8642_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2756_c19_8642_return_output := MUX_uxn_opcodes_h_l2756_c19_8642_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left := VAR_MUX_uxn_opcodes_h_l2756_c19_8642_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2756_c19_e9e1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c19_e9e1_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2756_c2_23a2, 8);
     -- stack_w_ram_update[uxn_opcodes_h_l2769_c22_903c] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address0;
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_address1;
     stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output := stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output;

     -- stack_r_ram_update[uxn_opcodes_h_l2760_c22_52f6] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address0;
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_address1;
     stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output := stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l2760_c3_98e9 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l2760_c22_52f6_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l2769_c3_044e := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l2769_c22_903c_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue := VAR_stack_read_value_uxn_opcodes_h_l2760_c3_98e9;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse := VAR_stack_read_value_uxn_opcodes_h_l2769_c3_044e;
     -- stack_read_value_MUX[uxn_opcodes_h_l2759_c2_554d] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_cond;
     stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output := stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l2759_c2_554d_return_output;
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
