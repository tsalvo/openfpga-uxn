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
-- Submodules: 374
entity eval_opcode_phased_0CLK_1ad9220f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_1ad9220f;
architecture arch of eval_opcode_phased_0CLK_1ad9220f is
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
-- BIN_OP_AND[uxn_opcodes_h_l3256_c10_760c]
signal BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3256_c10_4c39]
signal BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3256_c41_f1a0]
signal BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3256_c57_2fc7]
signal CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3256_c10_5501]
signal MUX_uxn_opcodes_h_l3256_c10_5501_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3256_c10_5501_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3256_c10_5501_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3256_c10_5501_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3257_c18_277d]
signal BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3257_c18_65cf]
signal BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3257_c18_d3de]
signal MUX_uxn_opcodes_h_l3257_c18_d3de_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3257_c18_d3de_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3259_c2_ef9e[uxn_opcodes_h_l3259_c2_ef9e]
signal printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3261_c6_61e0]
signal BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c7_d851]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3261_c2_b503]
signal opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3262_c11_13f7]
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c1_6a48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3263_c7_0fe4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3262_c7_d851]
signal opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3262_c41_d2d4]
signal jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3262_c41_d2d4_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3262_c41_d2d4_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3262_c41_d2d4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3263_c11_1978]
signal BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3263_c1_8e68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3264_c7_dc8c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3263_c7_0fe4]
signal opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3263_c41_f27b]
signal jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3263_c41_f27b_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3263_c41_f27b_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3263_c41_f27b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3264_c11_1f5a]
signal BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3264_c1_d301]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3265_c7_0fbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3264_c7_dc8c]
signal opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3264_c41_df43]
signal jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3264_c41_df43_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3264_c41_df43_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3264_c41_df43_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3265_c11_1ad9]
signal BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3265_c1_e782]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3266_c7_b3ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3265_c7_0fbc]
signal opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3265_c41_440a]
signal lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3265_c41_440a_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3265_c41_440a_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3265_c41_440a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3266_c11_b034]
signal BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3266_c1_9528]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3267_c7_bf49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3266_c7_b3ab]
signal opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3266_c41_515d]
signal lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3266_c41_515d_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3266_c41_515d_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3266_c41_515d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3267_c11_14c2]
signal BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3267_c1_7874]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3268_c7_bde2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3267_c7_bf49]
signal opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3267_c41_33be]
signal lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3267_c41_33be_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3267_c41_33be_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3267_c41_33be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3268_c11_9390]
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3268_c1_b751]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3269_c7_6e71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3268_c7_bde2]
signal opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3268_c41_cc09]
signal lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3268_c41_cc09_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3268_c41_cc09_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3268_c41_cc09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3269_c11_f269]
signal BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3269_c1_ce88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3270_c7_d5d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3269_c7_6e71]
signal opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3269_c41_25a0]
signal inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3269_c41_25a0_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3269_c41_25a0_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3269_c41_25a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3270_c11_2db8]
signal BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3270_c1_bb2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3271_c7_2510]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3270_c7_d5d7]
signal opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3270_c41_b4b6]
signal inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3270_c41_b4b6_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3270_c41_b4b6_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3271_c11_6e43]
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3271_c1_ee71]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3272_c7_3322]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3271_c7_2510]
signal opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3271_c41_a191]
signal pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3271_c41_a191_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3271_c41_a191_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3271_c41_a191_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3272_c11_2d26]
signal BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3272_c1_9e32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3273_c7_d998]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3272_c7_3322]
signal opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3272_c41_bd05]
signal pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3272_c41_bd05_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3272_c41_bd05_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3272_c41_bd05_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3273_c11_4e7a]
signal BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3273_c1_f411]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3274_c7_c23f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3273_c7_d998]
signal opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3273_c41_3c53]
signal nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3273_c41_3c53_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3273_c41_3c53_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3273_c41_3c53_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3274_c11_08ab]
signal BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3274_c1_2215]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3275_c7_bc1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3274_c7_c23f]
signal opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3274_c41_3641]
signal nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3274_c41_3641_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3274_c41_3641_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3274_c41_3641_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3275_c11_a05d]
signal BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3275_c1_7860]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3276_c7_b9c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3275_c7_bc1d]
signal opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3275_c41_17d9]
signal swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3275_c41_17d9_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3275_c41_17d9_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3275_c41_17d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3276_c11_97ad]
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3276_c1_ace5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3277_c7_16bc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3276_c7_b9c9]
signal opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3276_c41_f64c]
signal swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3276_c41_f64c_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3276_c41_f64c_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3276_c41_f64c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3277_c11_a2d2]
signal BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3277_c1_73c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3278_c7_187a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3277_c7_16bc]
signal opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3277_c41_afd6]
signal rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3277_c41_afd6_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3277_c41_afd6_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3277_c41_afd6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3278_c11_e989]
signal BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3278_c1_5f08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3279_c7_13b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3278_c7_187a]
signal opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3278_c41_c0de]
signal rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3278_c41_c0de_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3278_c41_c0de_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3278_c41_c0de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3279_c11_380b]
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3279_c1_4026]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3280_c7_e03f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3279_c7_13b8]
signal opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3279_c41_c1ef]
signal dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3279_c41_c1ef_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3279_c41_c1ef_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3279_c41_c1ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3280_c11_0653]
signal BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3280_c1_be0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3281_c7_985a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3280_c7_e03f]
signal opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3280_c41_bf67]
signal dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3280_c41_bf67_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3280_c41_bf67_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3280_c41_bf67_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3281_c11_73a3]
signal BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3281_c1_ec57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3282_c7_3756]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3281_c7_985a]
signal opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3281_c41_f5be]
signal ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3281_c41_f5be_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3281_c41_f5be_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3281_c41_f5be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3282_c11_678c]
signal BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3282_c1_8d45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3283_c7_fa22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3282_c7_3756]
signal opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3282_c41_2cc6]
signal ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3283_c11_9a56]
signal BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3283_c1_4e27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3284_c7_19b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3283_c7_fa22]
signal opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3283_c41_9a30]
signal equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3283_c41_9a30_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3283_c41_9a30_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3283_c41_9a30_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3284_c11_d2a1]
signal BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3284_c1_4339]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3285_c7_c993]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3284_c7_19b7]
signal opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3284_c41_ae23]
signal equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3284_c41_ae23_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3284_c41_ae23_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3284_c41_ae23_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3285_c11_204a]
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3285_c1_4ff2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c7_16e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3285_c7_c993]
signal opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3285_c41_a485]
signal neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3285_c41_a485_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3285_c41_a485_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3285_c41_a485_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3286_c11_e2bb]
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c1_0e99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c7_51a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3286_c7_16e5]
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3286_c41_9c2c]
signal neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3286_c41_9c2c_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3286_c41_9c2c_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3287_c11_7543]
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c1_75aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c7_aadc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3287_c7_51a9]
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3287_c41_073e]
signal gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3287_c41_073e_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3287_c41_073e_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3287_c41_073e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3288_c11_d218]
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c1_c790]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c7_96f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3288_c7_aadc]
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3288_c41_73ce]
signal gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3288_c41_73ce_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3288_c41_73ce_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3288_c41_73ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3289_c11_ea49]
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c1_481f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c7_eb64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3289_c7_96f1]
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3289_c41_1b11]
signal lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3289_c41_1b11_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3289_c41_1b11_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3289_c41_1b11_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3290_c11_f8a4]
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c1_692d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c7_5618]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3290_c7_eb64]
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3290_c41_e9f1]
signal lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3290_c41_e9f1_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3290_c41_e9f1_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_7228]
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c1_7b6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c7_0aba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3291_c7_5618]
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3291_c41_c300]
signal jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3291_c41_c300_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3291_c41_c300_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3291_c41_c300_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3291_c41_c300_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3292_c11_017b]
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c1_16c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c7_361b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3292_c7_0aba]
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3292_c41_9bc9]
signal jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3293_c11_8c32]
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c1_a25d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c7_ed87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3293_c7_361b]
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3293_c41_8f3e]
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3294_c11_ccfa]
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c1_258e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c7_8d07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3294_c7_ed87]
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3294_c41_127d]
signal jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3294_c41_127d_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3294_c41_127d_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3294_c41_127d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_d036]
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c1_e73c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c7_b38f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3295_c7_8d07]
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3295_c41_b42d]
signal jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3295_c41_b42d_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3295_c41_b42d_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3295_c41_b42d_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3295_c41_b42d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3296_c11_1ead]
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c1_4ee1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c7_b928]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3296_c7_b38f]
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3296_c41_e79b]
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3297_c11_8564]
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c1_14c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c7_300c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3297_c7_b928]
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3297_c41_acb2]
signal sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3297_c41_acb2_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3297_c41_acb2_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3297_c41_acb2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3298_c11_b871]
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c1_9913]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c7_56b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3298_c7_300c]
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3298_c41_d59a]
signal sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3298_c41_d59a_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3298_c41_d59a_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3298_c41_d59a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_e66c]
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c1_fdf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c7_3a78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3299_c7_56b2]
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3299_c41_bfde]
signal ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3299_c41_bfde_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3299_c41_bfde_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3299_c41_bfde_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3300_c11_4133]
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c1_853f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c7_a23a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3300_c7_3a78]
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3300_c41_a914]
signal ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3300_c41_a914_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3300_c41_a914_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3300_c41_a914_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3301_c11_10e4]
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c1_a20c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c7_21d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3301_c7_a23a]
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3301_c41_7c5d]
signal stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3301_c41_7c5d_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3301_c41_7c5d_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3301_c41_7c5d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3302_c11_9fb4]
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c1_6668]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c7_4786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3302_c7_21d3]
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3302_c41_ee38]
signal stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3302_c41_ee38_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3302_c41_ee38_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3302_c41_ee38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_c22f]
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c1_ed68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c7_b45b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3303_c7_4786]
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3303_c41_46eb]
signal ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3303_c41_46eb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3304_c11_8079]
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c1_0de2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c7_de1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3304_c7_b45b]
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3304_c41_932e]
signal ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3304_c41_932e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3305_c11_7219]
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c1_e824]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c7_e9cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3305_c7_de1e]
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3305_c41_ac5e]
signal str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3305_c41_ac5e_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3305_c41_ac5e_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3305_c41_ac5e_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3305_c41_ac5e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3306_c11_7d95]
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c1_256e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c7_d253]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3306_c7_e9cb]
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3306_c41_daf9]
signal str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3306_c41_daf9_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3306_c41_daf9_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3306_c41_daf9_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3306_c41_daf9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3307_c11_b0ba]
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c1_67de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c7_c42f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3307_c7_d253]
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3307_c41_0e46]
signal lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3307_c41_0e46_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3307_c41_0e46_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3307_c41_0e46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3308_c11_6988]
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c1_9f75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c7_27d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3308_c7_c42f]
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3308_c41_5cef]
signal lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3308_c41_5cef_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3308_c41_5cef_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3308_c41_5cef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3309_c11_8a7c]
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c1_8ccd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c7_35f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3309_c7_27d7]
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3309_c41_0b3b]
signal sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3309_c41_0b3b_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3309_c41_0b3b_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3309_c41_0b3b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3310_c11_6681]
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c1_2a93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c7_c49f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3310_c7_35f4]
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3310_c41_5bf6]
signal sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3310_c41_5bf6_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3310_c41_5bf6_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3311_c11_72a6]
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c1_4c6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c7_4ec2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3311_c7_c49f]
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3311_c41_bced]
signal dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3311_c41_bced_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3311_c41_bced_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3311_c41_bced_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3312_c11_c64b]
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c1_856f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c7_e804]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3312_c7_4ec2]
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3312_c41_4a0b]
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3313_c11_280d]
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c1_b232]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c7_3801]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3313_c7_e804]
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3313_c41_946c]
signal deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3313_c41_946c_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3313_c41_946c_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3313_c41_946c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3314_c11_1813]
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c1_f641]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c7_258a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3314_c7_3801]
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3314_c41_cc19]
signal deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3314_c41_cc19_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3314_c41_cc19_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3314_c41_cc19_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3315_c11_400f]
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c1_d530]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c7_b7eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3315_c7_258a]
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3315_c41_58fa]
signal add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3315_c41_58fa_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3315_c41_58fa_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3315_c41_58fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3316_c11_8557]
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c1_b817]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c7_62b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3316_c7_b7eb]
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3316_c41_a87d]
signal add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3316_c41_a87d_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3316_c41_a87d_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3316_c41_a87d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3317_c11_5e4d]
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c1_29e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c7_187f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3317_c7_62b4]
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3317_c41_9537]
signal sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3317_c41_9537_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3317_c41_9537_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3317_c41_9537_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3318_c11_2b7c]
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c1_f702]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c7_1ac2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3318_c7_187f]
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3318_c41_0939]
signal sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3318_c41_0939_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3318_c41_0939_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3318_c41_0939_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3319_c11_20fa]
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c1_b831]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c7_3078]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3319_c7_1ac2]
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3319_c41_13a0]
signal mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3319_c41_13a0_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3319_c41_13a0_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3319_c41_13a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3320_c11_d824]
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c1_7a08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c7_315a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3320_c7_3078]
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3320_c41_d0f6]
signal mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3320_c41_d0f6_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3320_c41_d0f6_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3321_c11_af99]
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c1_c388]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c7_183d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3321_c7_315a]
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3321_c41_79bf]
signal div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3321_c41_79bf_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3321_c41_79bf_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3321_c41_79bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3322_c11_a1d7]
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c1_6dd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c7_77de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3322_c7_183d]
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3322_c41_bb38]
signal div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3322_c41_bb38_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3322_c41_bb38_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3322_c41_bb38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3323_c11_accb]
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c1_a0f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c7_9a7c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3323_c7_77de]
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3323_c41_c0ef]
signal and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3323_c41_c0ef_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3323_c41_c0ef_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3323_c41_c0ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3324_c11_686f]
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c1_cf93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c7_a585]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3324_c7_9a7c]
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3324_c41_0be2]
signal and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3324_c41_0be2_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3324_c41_0be2_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3324_c41_0be2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3325_c11_47a1]
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c1_cc8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c7_51b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3325_c7_a585]
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3325_c41_242b]
signal ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3325_c41_242b_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3325_c41_242b_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3325_c41_242b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3326_c11_7f19]
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c1_90ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c7_4354]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3326_c7_51b4]
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3326_c41_762a]
signal ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3326_c41_762a_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3326_c41_762a_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3326_c41_762a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3327_c11_154d]
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c1_f54d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c7_47fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3327_c7_4354]
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3327_c41_82c9]
signal eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3327_c41_82c9_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3327_c41_82c9_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3327_c41_82c9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3328_c11_00ff]
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c1_2c27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c7_7e77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3328_c7_47fa]
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3328_c41_e62c]
signal eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3328_c41_e62c_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3328_c41_e62c_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3328_c41_e62c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3329_c11_e0a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c1_c816]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c7_ad09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3329_c7_7e77]
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3329_c41_0430]
signal sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3329_c41_0430_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3329_c41_0430_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3329_c41_0430_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3330_c11_92a2]
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c1_2462]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c1_c949]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3330_c7_ad09]
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3330_c41_cd68]
signal sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3330_c41_cd68_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3330_c41_cd68_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3330_c41_cd68_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3331_c9_e54a[uxn_opcodes_h_l3331_c9_e54a]
signal printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0 : unsigned(31 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3333_c2_b6a7]
signal sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3333_c2_b6a7]
signal sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3334_c3_91f3]
signal sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3334_c3_91f3]
signal sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3335_c4_f448]
signal BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3337_c4_b88c]
signal BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3343_c19_468c]
signal MUX_uxn_opcodes_h_l3343_c19_468c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3343_c19_468c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3343_c19_468c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3343_c19_468c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3343_c19_0937]
signal BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l3347_c5_a8ae]
signal UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output : unsigned(0 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3346_c21_4399]
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0 : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1 : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l3356_c26_6c84]
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_pc_updated := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c
BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left,
BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right,
BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39
BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left,
BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right,
BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0
BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left,
BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right,
BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7
CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x,
CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output);

-- MUX_uxn_opcodes_h_l3256_c10_5501
MUX_uxn_opcodes_h_l3256_c10_5501 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3256_c10_5501_cond,
MUX_uxn_opcodes_h_l3256_c10_5501_iftrue,
MUX_uxn_opcodes_h_l3256_c10_5501_iffalse,
MUX_uxn_opcodes_h_l3256_c10_5501_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d
BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left,
BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right,
BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf
BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left,
BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right,
BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output);

-- MUX_uxn_opcodes_h_l3257_c18_d3de
MUX_uxn_opcodes_h_l3257_c18_d3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3257_c18_d3de_cond,
MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue,
MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse,
MUX_uxn_opcodes_h_l3257_c18_d3de_return_output);

-- printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e
printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e : entity work.printf_uxn_opcodes_h_l3259_c2_ef9e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0,
printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1,
printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0
BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left,
BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right,
BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3261_c2_b503
opc_result_MUX_uxn_opcodes_h_l3261_c2_b503 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond,
opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue,
opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse,
opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7
BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left,
BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right,
BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3262_c7_d851
opc_result_MUX_uxn_opcodes_h_l3262_c7_d851 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond,
opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue,
opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse,
opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output);

-- jci_uxn_opcodes_h_l3262_c41_d2d4
jci_uxn_opcodes_h_l3262_c41_d2d4 : entity work.jci_0CLK_cf70ec0f port map (
clk,
jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3262_c41_d2d4_phase,
jci_uxn_opcodes_h_l3262_c41_d2d4_pc,
jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read,
jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read,
jci_uxn_opcodes_h_l3262_c41_d2d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978
BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left,
BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right,
BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4
opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond,
opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output);

-- jmi_uxn_opcodes_h_l3263_c41_f27b
jmi_uxn_opcodes_h_l3263_c41_f27b : entity work.jmi_0CLK_3045e391 port map (
clk,
jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3263_c41_f27b_phase,
jmi_uxn_opcodes_h_l3263_c41_f27b_pc,
jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read,
jmi_uxn_opcodes_h_l3263_c41_f27b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a
BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left,
BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right,
BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c
opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond,
opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output);

-- jsi_uxn_opcodes_h_l3264_c41_df43
jsi_uxn_opcodes_h_l3264_c41_df43 : entity work.jsi_0CLK_cf70ec0f port map (
clk,
jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3264_c41_df43_phase,
jsi_uxn_opcodes_h_l3264_c41_df43_pc,
jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read,
jsi_uxn_opcodes_h_l3264_c41_df43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9
BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left,
BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right,
BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc
opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond,
opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output);

-- lit_uxn_opcodes_h_l3265_c41_440a
lit_uxn_opcodes_h_l3265_c41_440a : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3265_c41_440a_phase,
lit_uxn_opcodes_h_l3265_c41_440a_pc,
lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read,
lit_uxn_opcodes_h_l3265_c41_440a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034
BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left,
BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right,
BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab
opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond,
opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output);

-- lit2_uxn_opcodes_h_l3266_c41_515d
lit2_uxn_opcodes_h_l3266_c41_515d : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3266_c41_515d_phase,
lit2_uxn_opcodes_h_l3266_c41_515d_pc,
lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read,
lit2_uxn_opcodes_h_l3266_c41_515d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2
BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left,
BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right,
BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49
opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond,
opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue,
opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse,
opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output);

-- lit_uxn_opcodes_h_l3267_c41_33be
lit_uxn_opcodes_h_l3267_c41_33be : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3267_c41_33be_phase,
lit_uxn_opcodes_h_l3267_c41_33be_pc,
lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read,
lit_uxn_opcodes_h_l3267_c41_33be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left,
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right,
BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2
opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond,
opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output);

-- lit2_uxn_opcodes_h_l3268_c41_cc09
lit2_uxn_opcodes_h_l3268_c41_cc09 : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3268_c41_cc09_phase,
lit2_uxn_opcodes_h_l3268_c41_cc09_pc,
lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read,
lit2_uxn_opcodes_h_l3268_c41_cc09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269
BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left,
BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right,
BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71
opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond,
opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue,
opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse,
opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output);

-- inc_uxn_opcodes_h_l3269_c41_25a0
inc_uxn_opcodes_h_l3269_c41_25a0 : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3269_c41_25a0_phase,
inc_uxn_opcodes_h_l3269_c41_25a0_ins,
inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read,
inc_uxn_opcodes_h_l3269_c41_25a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8
BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left,
BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right,
BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7
opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond,
opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output);

-- inc2_uxn_opcodes_h_l3270_c41_b4b6
inc2_uxn_opcodes_h_l3270_c41_b4b6 : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3270_c41_b4b6_phase,
inc2_uxn_opcodes_h_l3270_c41_b4b6_ins,
inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read,
inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left,
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right,
BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3271_c7_2510
opc_result_MUX_uxn_opcodes_h_l3271_c7_2510 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond,
opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue,
opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse,
opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output);

-- pop_uxn_opcodes_h_l3271_c41_a191
pop_uxn_opcodes_h_l3271_c41_a191 : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3271_c41_a191_phase,
pop_uxn_opcodes_h_l3271_c41_a191_ins,
pop_uxn_opcodes_h_l3271_c41_a191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26
BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left,
BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right,
BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3272_c7_3322
opc_result_MUX_uxn_opcodes_h_l3272_c7_3322 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond,
opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue,
opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse,
opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output);

-- pop2_uxn_opcodes_h_l3272_c41_bd05
pop2_uxn_opcodes_h_l3272_c41_bd05 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3272_c41_bd05_phase,
pop2_uxn_opcodes_h_l3272_c41_bd05_ins,
pop2_uxn_opcodes_h_l3272_c41_bd05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a
BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left,
BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right,
BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3273_c7_d998
opc_result_MUX_uxn_opcodes_h_l3273_c7_d998 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond,
opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue,
opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse,
opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output);

-- nip_uxn_opcodes_h_l3273_c41_3c53
nip_uxn_opcodes_h_l3273_c41_3c53 : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3273_c41_3c53_phase,
nip_uxn_opcodes_h_l3273_c41_3c53_ins,
nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read,
nip_uxn_opcodes_h_l3273_c41_3c53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab
BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left,
BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right,
BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f
opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond,
opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output);

-- nip2_uxn_opcodes_h_l3274_c41_3641
nip2_uxn_opcodes_h_l3274_c41_3641 : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3274_c41_3641_phase,
nip2_uxn_opcodes_h_l3274_c41_3641_ins,
nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read,
nip2_uxn_opcodes_h_l3274_c41_3641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d
BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left,
BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right,
BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d
opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond,
opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output);

-- swp_uxn_opcodes_h_l3275_c41_17d9
swp_uxn_opcodes_h_l3275_c41_17d9 : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3275_c41_17d9_phase,
swp_uxn_opcodes_h_l3275_c41_17d9_ins,
swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read,
swp_uxn_opcodes_h_l3275_c41_17d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left,
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right,
BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9
opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond,
opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output);

-- swp2_uxn_opcodes_h_l3276_c41_f64c
swp2_uxn_opcodes_h_l3276_c41_f64c : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3276_c41_f64c_phase,
swp2_uxn_opcodes_h_l3276_c41_f64c_ins,
swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read,
swp2_uxn_opcodes_h_l3276_c41_f64c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2
BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left,
BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right,
BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc
opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond,
opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output);

-- rot_uxn_opcodes_h_l3277_c41_afd6
rot_uxn_opcodes_h_l3277_c41_afd6 : entity work.rot_0CLK_9c3c4e32 port map (
clk,
rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3277_c41_afd6_phase,
rot_uxn_opcodes_h_l3277_c41_afd6_ins,
rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read,
rot_uxn_opcodes_h_l3277_c41_afd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989
BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left,
BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right,
BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3278_c7_187a
opc_result_MUX_uxn_opcodes_h_l3278_c7_187a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond,
opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output);

-- rot2_uxn_opcodes_h_l3278_c41_c0de
rot2_uxn_opcodes_h_l3278_c41_c0de : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3278_c41_c0de_phase,
rot2_uxn_opcodes_h_l3278_c41_c0de_ins,
rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read,
rot2_uxn_opcodes_h_l3278_c41_c0de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left,
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right,
BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8
opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond,
opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output);

-- dup_uxn_opcodes_h_l3279_c41_c1ef
dup_uxn_opcodes_h_l3279_c41_c1ef : entity work.dup_0CLK_a148083c port map (
clk,
dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3279_c41_c1ef_phase,
dup_uxn_opcodes_h_l3279_c41_c1ef_ins,
dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read,
dup_uxn_opcodes_h_l3279_c41_c1ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653
BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left,
BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right,
BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f
opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond,
opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output);

-- dup2_uxn_opcodes_h_l3280_c41_bf67
dup2_uxn_opcodes_h_l3280_c41_bf67 : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3280_c41_bf67_phase,
dup2_uxn_opcodes_h_l3280_c41_bf67_ins,
dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read,
dup2_uxn_opcodes_h_l3280_c41_bf67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3
BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left,
BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right,
BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3281_c7_985a
opc_result_MUX_uxn_opcodes_h_l3281_c7_985a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond,
opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output);

-- ovr_uxn_opcodes_h_l3281_c41_f5be
ovr_uxn_opcodes_h_l3281_c41_f5be : entity work.ovr_0CLK_cf70ec0f port map (
clk,
ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3281_c41_f5be_phase,
ovr_uxn_opcodes_h_l3281_c41_f5be_ins,
ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read,
ovr_uxn_opcodes_h_l3281_c41_f5be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c
BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left,
BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right,
BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3282_c7_3756
opc_result_MUX_uxn_opcodes_h_l3282_c7_3756 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond,
opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue,
opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse,
opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output);

-- ovr2_uxn_opcodes_h_l3282_c41_2cc6
ovr2_uxn_opcodes_h_l3282_c41_2cc6 : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase,
ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins,
ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read,
ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56
BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left,
BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right,
BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22
opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond,
opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue,
opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse,
opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output);

-- equ_uxn_opcodes_h_l3283_c41_9a30
equ_uxn_opcodes_h_l3283_c41_9a30 : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3283_c41_9a30_phase,
equ_uxn_opcodes_h_l3283_c41_9a30_ins,
equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read,
equ_uxn_opcodes_h_l3283_c41_9a30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1
BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left,
BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right,
BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7
opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond,
opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output);

-- equ2_uxn_opcodes_h_l3284_c41_ae23
equ2_uxn_opcodes_h_l3284_c41_ae23 : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3284_c41_ae23_phase,
equ2_uxn_opcodes_h_l3284_c41_ae23_ins,
equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read,
equ2_uxn_opcodes_h_l3284_c41_ae23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left,
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right,
BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3285_c7_c993
opc_result_MUX_uxn_opcodes_h_l3285_c7_c993 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond,
opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue,
opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse,
opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output);

-- neq_uxn_opcodes_h_l3285_c41_a485
neq_uxn_opcodes_h_l3285_c41_a485 : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3285_c41_a485_phase,
neq_uxn_opcodes_h_l3285_c41_a485_ins,
neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read,
neq_uxn_opcodes_h_l3285_c41_a485_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left,
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right,
BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5
opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond,
opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output);

-- neq2_uxn_opcodes_h_l3286_c41_9c2c
neq2_uxn_opcodes_h_l3286_c41_9c2c : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3286_c41_9c2c_phase,
neq2_uxn_opcodes_h_l3286_c41_9c2c_ins,
neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read,
neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left,
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right,
BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9
opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond,
opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output);

-- gth_uxn_opcodes_h_l3287_c41_073e
gth_uxn_opcodes_h_l3287_c41_073e : entity work.gth_0CLK_7c2e709f port map (
clk,
gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3287_c41_073e_phase,
gth_uxn_opcodes_h_l3287_c41_073e_ins,
gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read,
gth_uxn_opcodes_h_l3287_c41_073e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left,
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right,
BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc
opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond,
opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output);

-- gth2_uxn_opcodes_h_l3288_c41_73ce
gth2_uxn_opcodes_h_l3288_c41_73ce : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3288_c41_73ce_phase,
gth2_uxn_opcodes_h_l3288_c41_73ce_ins,
gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read,
gth2_uxn_opcodes_h_l3288_c41_73ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left,
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right,
BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1
opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond,
opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output);

-- lth_uxn_opcodes_h_l3289_c41_1b11
lth_uxn_opcodes_h_l3289_c41_1b11 : entity work.lth_0CLK_7c2e709f port map (
clk,
lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3289_c41_1b11_phase,
lth_uxn_opcodes_h_l3289_c41_1b11_ins,
lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read,
lth_uxn_opcodes_h_l3289_c41_1b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left,
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right,
BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64
opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond,
opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue,
opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse,
opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output);

-- lth2_uxn_opcodes_h_l3290_c41_e9f1
lth2_uxn_opcodes_h_l3290_c41_e9f1 : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3290_c41_e9f1_phase,
lth2_uxn_opcodes_h_l3290_c41_e9f1_ins,
lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read,
lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right,
BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3291_c7_5618
opc_result_MUX_uxn_opcodes_h_l3291_c7_5618 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond,
opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue,
opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse,
opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output);

-- jmp_uxn_opcodes_h_l3291_c41_c300
jmp_uxn_opcodes_h_l3291_c41_c300 : entity work.jmp_0CLK_46011230 port map (
clk,
jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3291_c41_c300_phase,
jmp_uxn_opcodes_h_l3291_c41_c300_ins,
jmp_uxn_opcodes_h_l3291_c41_c300_pc,
jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read,
jmp_uxn_opcodes_h_l3291_c41_c300_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left,
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right,
BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba
opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse,
opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output);

-- jmp2_uxn_opcodes_h_l3292_c41_9bc9
jmp2_uxn_opcodes_h_l3292_c41_9bc9 : entity work.jmp2_0CLK_3d5a5eea port map (
clk,
jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase,
jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins,
jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read,
jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left,
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right,
BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3293_c7_361b
opc_result_MUX_uxn_opcodes_h_l3293_c7_361b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond,
opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output);

-- jcn_uxn_opcodes_h_l3293_c41_8f3e
jcn_uxn_opcodes_h_l3293_c41_8f3e : entity work.jcn_0CLK_f7466064 port map (
clk,
jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3293_c41_8f3e_phase,
jcn_uxn_opcodes_h_l3293_c41_8f3e_ins,
jcn_uxn_opcodes_h_l3293_c41_8f3e_pc,
jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read,
jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left,
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right,
BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87
opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond,
opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue,
opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse,
opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output);

-- jcn2_uxn_opcodes_h_l3294_c41_127d
jcn2_uxn_opcodes_h_l3294_c41_127d : entity work.jcn2_0CLK_77d0ca3d port map (
clk,
jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3294_c41_127d_phase,
jcn2_uxn_opcodes_h_l3294_c41_127d_ins,
jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read,
jcn2_uxn_opcodes_h_l3294_c41_127d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right,
BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07
opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond,
opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue,
opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse,
opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output);

-- jsr_uxn_opcodes_h_l3295_c41_b42d
jsr_uxn_opcodes_h_l3295_c41_b42d : entity work.jsr_0CLK_f1c92b33 port map (
clk,
jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3295_c41_b42d_phase,
jsr_uxn_opcodes_h_l3295_c41_b42d_ins,
jsr_uxn_opcodes_h_l3295_c41_b42d_pc,
jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read,
jsr_uxn_opcodes_h_l3295_c41_b42d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left,
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right,
BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f
opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond,
opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output);

-- jsr2_uxn_opcodes_h_l3296_c41_e79b
jsr2_uxn_opcodes_h_l3296_c41_e79b : entity work.jsr2_0CLK_3a9c1537 port map (
clk,
jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3296_c41_e79b_phase,
jsr2_uxn_opcodes_h_l3296_c41_e79b_ins,
jsr2_uxn_opcodes_h_l3296_c41_e79b_pc,
jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read,
jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left,
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right,
BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3297_c7_b928
opc_result_MUX_uxn_opcodes_h_l3297_c7_b928 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond,
opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue,
opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse,
opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output);

-- sth_uxn_opcodes_h_l3297_c41_acb2
sth_uxn_opcodes_h_l3297_c41_acb2 : entity work.sth_0CLK_edc09f97 port map (
clk,
sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3297_c41_acb2_phase,
sth_uxn_opcodes_h_l3297_c41_acb2_ins,
sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read,
sth_uxn_opcodes_h_l3297_c41_acb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left,
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right,
BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3298_c7_300c
opc_result_MUX_uxn_opcodes_h_l3298_c7_300c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond,
opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output);

-- sth2_uxn_opcodes_h_l3298_c41_d59a
sth2_uxn_opcodes_h_l3298_c41_d59a : entity work.sth2_0CLK_bbbe252c port map (
clk,
sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3298_c41_d59a_phase,
sth2_uxn_opcodes_h_l3298_c41_d59a_ins,
sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read,
sth2_uxn_opcodes_h_l3298_c41_d59a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right,
BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2
opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond,
opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output);

-- ldz_uxn_opcodes_h_l3299_c41_bfde
ldz_uxn_opcodes_h_l3299_c41_bfde : entity work.ldz_0CLK_1c7b7172 port map (
clk,
ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3299_c41_bfde_phase,
ldz_uxn_opcodes_h_l3299_c41_bfde_ins,
ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read,
ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read,
ldz_uxn_opcodes_h_l3299_c41_bfde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left,
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right,
BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78
opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond,
opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue,
opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse,
opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output);

-- ldz2_uxn_opcodes_h_l3300_c41_a914
ldz2_uxn_opcodes_h_l3300_c41_a914 : entity work.ldz2_0CLK_bbbe252c port map (
clk,
ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3300_c41_a914_phase,
ldz2_uxn_opcodes_h_l3300_c41_a914_ins,
ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read,
ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read,
ldz2_uxn_opcodes_h_l3300_c41_a914_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left,
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right,
BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a
opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond,
opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output);

-- stz_uxn_opcodes_h_l3301_c41_7c5d
stz_uxn_opcodes_h_l3301_c41_7c5d : entity work.stz_0CLK_fd2391e7 port map (
clk,
stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3301_c41_7c5d_phase,
stz_uxn_opcodes_h_l3301_c41_7c5d_ins,
stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read,
stz_uxn_opcodes_h_l3301_c41_7c5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left,
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right,
BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3
opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond,
opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output);

-- stz2_uxn_opcodes_h_l3302_c41_ee38
stz2_uxn_opcodes_h_l3302_c41_ee38 : entity work.stz2_0CLK_5ccafc54 port map (
clk,
stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3302_c41_ee38_phase,
stz2_uxn_opcodes_h_l3302_c41_ee38_ins,
stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read,
stz2_uxn_opcodes_h_l3302_c41_ee38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right,
BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3303_c7_4786
opc_result_MUX_uxn_opcodes_h_l3303_c7_4786 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond,
opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue,
opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse,
opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output);

-- ldr_uxn_opcodes_h_l3303_c41_46eb
ldr_uxn_opcodes_h_l3303_c41_46eb : entity work.ldr_0CLK_f7466064 port map (
clk,
ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3303_c41_46eb_phase,
ldr_uxn_opcodes_h_l3303_c41_46eb_ins,
ldr_uxn_opcodes_h_l3303_c41_46eb_pc,
ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read,
ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read,
ldr_uxn_opcodes_h_l3303_c41_46eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left,
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right,
BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b
opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond,
opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output);

-- ldr2_uxn_opcodes_h_l3304_c41_932e
ldr2_uxn_opcodes_h_l3304_c41_932e : entity work.ldr2_0CLK_bbbe252c port map (
clk,
ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3304_c41_932e_phase,
ldr2_uxn_opcodes_h_l3304_c41_932e_ins,
ldr2_uxn_opcodes_h_l3304_c41_932e_pc,
ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read,
ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read,
ldr2_uxn_opcodes_h_l3304_c41_932e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left,
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right,
BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e
opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond,
opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output);

-- str1_uxn_opcodes_h_l3305_c41_ac5e
str1_uxn_opcodes_h_l3305_c41_ac5e : entity work.str1_0CLK_7c2e709f port map (
clk,
str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3305_c41_ac5e_phase,
str1_uxn_opcodes_h_l3305_c41_ac5e_ins,
str1_uxn_opcodes_h_l3305_c41_ac5e_pc,
str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read,
str1_uxn_opcodes_h_l3305_c41_ac5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left,
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right,
BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb
opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond,
opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output);

-- str2_uxn_opcodes_h_l3306_c41_daf9
str2_uxn_opcodes_h_l3306_c41_daf9 : entity work.str2_0CLK_5ccafc54 port map (
clk,
str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3306_c41_daf9_phase,
str2_uxn_opcodes_h_l3306_c41_daf9_ins,
str2_uxn_opcodes_h_l3306_c41_daf9_pc,
str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read,
str2_uxn_opcodes_h_l3306_c41_daf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left,
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right,
BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3307_c7_d253
opc_result_MUX_uxn_opcodes_h_l3307_c7_d253 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond,
opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue,
opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse,
opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output);

-- lda_uxn_opcodes_h_l3307_c41_0e46
lda_uxn_opcodes_h_l3307_c41_0e46 : entity work.lda_0CLK_f1c92b33 port map (
clk,
lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3307_c41_0e46_phase,
lda_uxn_opcodes_h_l3307_c41_0e46_ins,
lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read,
lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read,
lda_uxn_opcodes_h_l3307_c41_0e46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left,
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right,
BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f
opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond,
opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output);

-- lda2_uxn_opcodes_h_l3308_c41_5cef
lda2_uxn_opcodes_h_l3308_c41_5cef : entity work.lda2_0CLK_5fcb251d port map (
clk,
lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3308_c41_5cef_phase,
lda2_uxn_opcodes_h_l3308_c41_5cef_ins,
lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read,
lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read,
lda2_uxn_opcodes_h_l3308_c41_5cef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left,
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right,
BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7
opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond,
opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output);

-- sta_uxn_opcodes_h_l3309_c41_0b3b
sta_uxn_opcodes_h_l3309_c41_0b3b : entity work.sta_0CLK_bbbe252c port map (
clk,
sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3309_c41_0b3b_phase,
sta_uxn_opcodes_h_l3309_c41_0b3b_ins,
sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read,
sta_uxn_opcodes_h_l3309_c41_0b3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left,
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right,
BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4
opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond,
opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output);

-- sta2_uxn_opcodes_h_l3310_c41_5bf6
sta2_uxn_opcodes_h_l3310_c41_5bf6 : entity work.sta2_0CLK_37dbf2f3 port map (
clk,
sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3310_c41_5bf6_phase,
sta2_uxn_opcodes_h_l3310_c41_5bf6_ins,
sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read,
sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left,
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right,
BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f
opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond,
opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output);

-- dei_uxn_opcodes_h_l3311_c41_bced
dei_uxn_opcodes_h_l3311_c41_bced : entity work.dei_0CLK_622ac75f port map (
clk,
dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3311_c41_bced_phase,
dei_uxn_opcodes_h_l3311_c41_bced_ins,
dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read,
dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read,
dei_uxn_opcodes_h_l3311_c41_bced_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left,
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right,
BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2
opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond,
opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output);

-- dei2_uxn_opcodes_h_l3312_c41_4a0b
dei2_uxn_opcodes_h_l3312_c41_4a0b : entity work.dei2_0CLK_14a12093 port map (
clk,
dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3312_c41_4a0b_phase,
dei2_uxn_opcodes_h_l3312_c41_4a0b_ins,
dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read,
dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read,
dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left,
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right,
BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3313_c7_e804
opc_result_MUX_uxn_opcodes_h_l3313_c7_e804 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond,
opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue,
opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse,
opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output);

-- deo_uxn_opcodes_h_l3313_c41_946c
deo_uxn_opcodes_h_l3313_c41_946c : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3313_c41_946c_phase,
deo_uxn_opcodes_h_l3313_c41_946c_ins,
deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read,
deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read,
deo_uxn_opcodes_h_l3313_c41_946c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left,
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right,
BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3314_c7_3801
opc_result_MUX_uxn_opcodes_h_l3314_c7_3801 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond,
opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue,
opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse,
opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output);

-- deo2_uxn_opcodes_h_l3314_c41_cc19
deo2_uxn_opcodes_h_l3314_c41_cc19 : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3314_c41_cc19_phase,
deo2_uxn_opcodes_h_l3314_c41_cc19_ins,
deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read,
deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read,
deo2_uxn_opcodes_h_l3314_c41_cc19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left,
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right,
BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3315_c7_258a
opc_result_MUX_uxn_opcodes_h_l3315_c7_258a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond,
opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output);

-- add_uxn_opcodes_h_l3315_c41_58fa
add_uxn_opcodes_h_l3315_c41_58fa : entity work.add_0CLK_fd2391e7 port map (
clk,
add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE,
add_uxn_opcodes_h_l3315_c41_58fa_phase,
add_uxn_opcodes_h_l3315_c41_58fa_ins,
add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read,
add_uxn_opcodes_h_l3315_c41_58fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left,
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right,
BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb
opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond,
opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output);

-- add2_uxn_opcodes_h_l3316_c41_a87d
add2_uxn_opcodes_h_l3316_c41_a87d : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3316_c41_a87d_phase,
add2_uxn_opcodes_h_l3316_c41_a87d_ins,
add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read,
add2_uxn_opcodes_h_l3316_c41_a87d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left,
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right,
BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4
opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond,
opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output);

-- sub_uxn_opcodes_h_l3317_c41_9537
sub_uxn_opcodes_h_l3317_c41_9537 : entity work.sub_0CLK_fd2391e7 port map (
clk,
sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3317_c41_9537_phase,
sub_uxn_opcodes_h_l3317_c41_9537_ins,
sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read,
sub_uxn_opcodes_h_l3317_c41_9537_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left,
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right,
BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3318_c7_187f
opc_result_MUX_uxn_opcodes_h_l3318_c7_187f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond,
opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output);

-- sub2_uxn_opcodes_h_l3318_c41_0939
sub2_uxn_opcodes_h_l3318_c41_0939 : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3318_c41_0939_phase,
sub2_uxn_opcodes_h_l3318_c41_0939_ins,
sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read,
sub2_uxn_opcodes_h_l3318_c41_0939_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left,
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right,
BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2
opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond,
opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output);

-- mul_uxn_opcodes_h_l3319_c41_13a0
mul_uxn_opcodes_h_l3319_c41_13a0 : entity work.mul_0CLK_fd2391e7 port map (
clk,
mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3319_c41_13a0_phase,
mul_uxn_opcodes_h_l3319_c41_13a0_ins,
mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read,
mul_uxn_opcodes_h_l3319_c41_13a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left,
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right,
BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3320_c7_3078
opc_result_MUX_uxn_opcodes_h_l3320_c7_3078 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond,
opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue,
opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse,
opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output);

-- mul2_uxn_opcodes_h_l3320_c41_d0f6
mul2_uxn_opcodes_h_l3320_c41_d0f6 : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3320_c41_d0f6_phase,
mul2_uxn_opcodes_h_l3320_c41_d0f6_ins,
mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read,
mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left,
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right,
BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3321_c7_315a
opc_result_MUX_uxn_opcodes_h_l3321_c7_315a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond,
opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output);

-- div_uxn_opcodes_h_l3321_c41_79bf
div_uxn_opcodes_h_l3321_c41_79bf : entity work.div_0CLK_f6fa2c7d port map (
clk,
div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE,
div_uxn_opcodes_h_l3321_c41_79bf_phase,
div_uxn_opcodes_h_l3321_c41_79bf_ins,
div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read,
div_uxn_opcodes_h_l3321_c41_79bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left,
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right,
BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3322_c7_183d
opc_result_MUX_uxn_opcodes_h_l3322_c7_183d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond,
opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output);

-- div2_uxn_opcodes_h_l3322_c41_bb38
div2_uxn_opcodes_h_l3322_c41_bb38 : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3322_c41_bb38_phase,
div2_uxn_opcodes_h_l3322_c41_bb38_ins,
div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read,
div2_uxn_opcodes_h_l3322_c41_bb38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left,
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right,
BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3323_c7_77de
opc_result_MUX_uxn_opcodes_h_l3323_c7_77de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond,
opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue,
opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse,
opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output);

-- and_uxn_opcodes_h_l3323_c41_c0ef
and_uxn_opcodes_h_l3323_c41_c0ef : entity work.and_0CLK_fd2391e7 port map (
clk,
and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE,
and_uxn_opcodes_h_l3323_c41_c0ef_phase,
and_uxn_opcodes_h_l3323_c41_c0ef_ins,
and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read,
and_uxn_opcodes_h_l3323_c41_c0ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left,
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right,
BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c
opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond,
opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output);

-- and2_uxn_opcodes_h_l3324_c41_0be2
and2_uxn_opcodes_h_l3324_c41_0be2 : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3324_c41_0be2_phase,
and2_uxn_opcodes_h_l3324_c41_0be2_ins,
and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read,
and2_uxn_opcodes_h_l3324_c41_0be2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left,
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right,
BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3325_c7_a585
opc_result_MUX_uxn_opcodes_h_l3325_c7_a585 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond,
opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue,
opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse,
opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output);

-- ora_uxn_opcodes_h_l3325_c41_242b
ora_uxn_opcodes_h_l3325_c41_242b : entity work.ora_0CLK_fd2391e7 port map (
clk,
ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3325_c41_242b_phase,
ora_uxn_opcodes_h_l3325_c41_242b_ins,
ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read,
ora_uxn_opcodes_h_l3325_c41_242b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left,
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right,
BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4
opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond,
opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output);

-- ora2_uxn_opcodes_h_l3326_c41_762a
ora2_uxn_opcodes_h_l3326_c41_762a : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3326_c41_762a_phase,
ora2_uxn_opcodes_h_l3326_c41_762a_ins,
ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read,
ora2_uxn_opcodes_h_l3326_c41_762a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left,
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right,
BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3327_c7_4354
opc_result_MUX_uxn_opcodes_h_l3327_c7_4354 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond,
opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue,
opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse,
opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output);

-- eor_uxn_opcodes_h_l3327_c41_82c9
eor_uxn_opcodes_h_l3327_c41_82c9 : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3327_c41_82c9_phase,
eor_uxn_opcodes_h_l3327_c41_82c9_ins,
eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read,
eor_uxn_opcodes_h_l3327_c41_82c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left,
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right,
BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa
opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond,
opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output);

-- eor2_uxn_opcodes_h_l3328_c41_e62c
eor2_uxn_opcodes_h_l3328_c41_e62c : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3328_c41_e62c_phase,
eor2_uxn_opcodes_h_l3328_c41_e62c_ins,
eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read,
eor2_uxn_opcodes_h_l3328_c41_e62c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77
opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond,
opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue,
opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse,
opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output);

-- sft_uxn_opcodes_h_l3329_c41_0430
sft_uxn_opcodes_h_l3329_c41_0430 : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3329_c41_0430_phase,
sft_uxn_opcodes_h_l3329_c41_0430_ins,
sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read,
sft_uxn_opcodes_h_l3329_c41_0430_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left,
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right,
BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09
opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond,
opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue,
opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse,
opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output);

-- sft2_uxn_opcodes_h_l3330_c41_cd68
sft2_uxn_opcodes_h_l3330_c41_cd68 : entity work.sft2_0CLK_d29b8e2d port map (
clk,
sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3330_c41_cd68_phase,
sft2_uxn_opcodes_h_l3330_c41_cd68_ins,
sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read,
sft2_uxn_opcodes_h_l3330_c41_cd68_return_output);

-- printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a
printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a : entity work.printf_uxn_opcodes_h_l3331_c9_e54a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0);

-- sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7
sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond,
sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue,
sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse,
sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output);

-- sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7
sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond,
sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue,
sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse,
sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output);

-- sp1_MUX_uxn_opcodes_h_l3334_c3_91f3
sp1_MUX_uxn_opcodes_h_l3334_c3_91f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond,
sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue,
sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse,
sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output);

-- sp0_MUX_uxn_opcodes_h_l3334_c3_91f3
sp0_MUX_uxn_opcodes_h_l3334_c3_91f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond,
sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue,
sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse,
sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448
BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left,
BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right,
BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c
BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left,
BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right,
BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output);

-- MUX_uxn_opcodes_h_l3343_c19_468c
MUX_uxn_opcodes_h_l3343_c19_468c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3343_c19_468c_cond,
MUX_uxn_opcodes_h_l3343_c19_468c_iftrue,
MUX_uxn_opcodes_h_l3343_c19_468c_iffalse,
MUX_uxn_opcodes_h_l3343_c19_468c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937
BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left,
BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right,
BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae
UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr,
UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output);

-- stack_ram_update_uxn_opcodes_h_l3346_c21_4399
stack_ram_update_uxn_opcodes_h_l3346_c21_4399 : entity work.stack_ram_update_0CLK_bdb363bb port map (
clk,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable,
stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output);

-- device_ram_update_uxn_opcodes_h_l3356_c26_6c84
device_ram_update_uxn_opcodes_h_l3356_c26_6c84 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable,
device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output,
 CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output,
 MUX_uxn_opcodes_h_l3256_c10_5501_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output,
 MUX_uxn_opcodes_h_l3257_c18_d3de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output,
 opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output,
 jci_uxn_opcodes_h_l3262_c41_d2d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output,
 jmi_uxn_opcodes_h_l3263_c41_f27b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output,
 jsi_uxn_opcodes_h_l3264_c41_df43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output,
 lit_uxn_opcodes_h_l3265_c41_440a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output,
 opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output,
 lit2_uxn_opcodes_h_l3266_c41_515d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output,
 lit_uxn_opcodes_h_l3267_c41_33be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output,
 opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output,
 lit2_uxn_opcodes_h_l3268_c41_cc09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output,
 inc_uxn_opcodes_h_l3269_c41_25a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output,
 opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output,
 inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output,
 opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output,
 pop_uxn_opcodes_h_l3271_c41_a191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output,
 opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output,
 pop2_uxn_opcodes_h_l3272_c41_bd05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output,
 nip_uxn_opcodes_h_l3273_c41_3c53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output,
 nip2_uxn_opcodes_h_l3274_c41_3641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output,
 swp_uxn_opcodes_h_l3275_c41_17d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output,
 swp2_uxn_opcodes_h_l3276_c41_f64c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output,
 rot_uxn_opcodes_h_l3277_c41_afd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output,
 rot2_uxn_opcodes_h_l3278_c41_c0de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output,
 dup_uxn_opcodes_h_l3279_c41_c1ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output,
 dup2_uxn_opcodes_h_l3280_c41_bf67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output,
 opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output,
 ovr_uxn_opcodes_h_l3281_c41_f5be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output,
 opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output,
 ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output,
 equ_uxn_opcodes_h_l3283_c41_9a30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output,
 opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output,
 equ2_uxn_opcodes_h_l3284_c41_ae23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output,
 neq_uxn_opcodes_h_l3285_c41_a485_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output,
 neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output,
 gth_uxn_opcodes_h_l3287_c41_073e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output,
 gth2_uxn_opcodes_h_l3288_c41_73ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output,
 opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output,
 lth_uxn_opcodes_h_l3289_c41_1b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output,
 opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output,
 lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output,
 opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output,
 jmp_uxn_opcodes_h_l3291_c41_c300_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output,
 jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output,
 opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output,
 jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output,
 opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output,
 jcn2_uxn_opcodes_h_l3294_c41_127d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output,
 jsr_uxn_opcodes_h_l3295_c41_b42d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output,
 opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output,
 jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output,
 sth_uxn_opcodes_h_l3297_c41_acb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output,
 sth2_uxn_opcodes_h_l3298_c41_d59a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output,
 opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output,
 ldz_uxn_opcodes_h_l3299_c41_bfde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output,
 ldz2_uxn_opcodes_h_l3300_c41_a914_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output,
 stz_uxn_opcodes_h_l3301_c41_7c5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output,
 opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output,
 stz2_uxn_opcodes_h_l3302_c41_ee38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output,
 ldr_uxn_opcodes_h_l3303_c41_46eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output,
 ldr2_uxn_opcodes_h_l3304_c41_932e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output,
 str1_uxn_opcodes_h_l3305_c41_ac5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output,
 opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output,
 str2_uxn_opcodes_h_l3306_c41_daf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output,
 lda_uxn_opcodes_h_l3307_c41_0e46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output,
 lda2_uxn_opcodes_h_l3308_c41_5cef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output,
 sta_uxn_opcodes_h_l3309_c41_0b3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output,
 sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output,
 dei_uxn_opcodes_h_l3311_c41_bced_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output,
 opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output,
 dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output,
 opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output,
 deo_uxn_opcodes_h_l3313_c41_946c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output,
 deo2_uxn_opcodes_h_l3314_c41_cc19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output,
 add_uxn_opcodes_h_l3315_c41_58fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output,
 add2_uxn_opcodes_h_l3316_c41_a87d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output,
 sub_uxn_opcodes_h_l3317_c41_9537_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output,
 sub2_uxn_opcodes_h_l3318_c41_0939_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output,
 opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output,
 mul_uxn_opcodes_h_l3319_c41_13a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output,
 mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output,
 div_uxn_opcodes_h_l3321_c41_79bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output,
 opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output,
 div2_uxn_opcodes_h_l3322_c41_bb38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output,
 and_uxn_opcodes_h_l3323_c41_c0ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output,
 opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output,
 and2_uxn_opcodes_h_l3324_c41_0be2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output,
 ora_uxn_opcodes_h_l3325_c41_242b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output,
 opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output,
 ora2_uxn_opcodes_h_l3326_c41_762a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output,
 eor_uxn_opcodes_h_l3327_c41_82c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output,
 opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output,
 eor2_uxn_opcodes_h_l3328_c41_e62c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output,
 opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output,
 sft_uxn_opcodes_h_l3329_c41_0430_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output,
 opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output,
 sft2_uxn_opcodes_h_l3330_c41_cd68_return_output,
 sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output,
 sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output,
 sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output,
 sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output,
 MUX_uxn_opcodes_h_l3343_c19_468c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output,
 stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output,
 device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3256_c2_5f68 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3256_c10_5501_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c30_4e9d_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c57_2fec_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3256_c10_5501_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3261_c2_b503_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3264_c41_df43_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3264_c41_df43_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3264_c41_df43_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3265_c41_440a_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3265_c41_440a_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3265_c41_440a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3266_c41_515d_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3266_c41_515d_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3266_c41_515d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3267_c41_33be_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3267_c41_33be_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3267_c41_33be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3269_c41_25a0_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3269_c41_25a0_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3269_c41_25a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3271_c41_a191_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3271_c41_a191_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3271_c41_a191_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3273_c41_3c53_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3273_c41_3c53_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3273_c41_3c53_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3274_c41_3641_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3274_c41_3641_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3274_c41_3641_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3275_c41_17d9_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3275_c41_17d9_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3275_c41_17d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3277_c41_afd6_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3277_c41_afd6_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3277_c41_afd6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3283_c41_9a30_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3283_c41_9a30_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3283_c41_9a30_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3285_c41_a485_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3285_c41_a485_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3285_c41_a485_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3287_c41_073e_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3287_c41_073e_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3287_c41_073e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3289_c41_1b11_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3289_c41_1b11_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3289_c41_1b11_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3291_c41_c300_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3297_c41_acb2_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3297_c41_acb2_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3297_c41_acb2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3306_c41_daf9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3307_c41_0e46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3311_c41_bced_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3313_c41_946c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3315_c41_58fa_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3315_c41_58fa_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3315_c41_58fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3316_c41_a87d_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3316_c41_a87d_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3316_c41_a87d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3317_c41_9537_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3317_c41_9537_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3317_c41_9537_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3318_c41_0939_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3318_c41_0939_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3318_c41_0939_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3319_c41_13a0_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3319_c41_13a0_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3319_c41_13a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3321_c41_79bf_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3321_c41_79bf_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3321_c41_79bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3322_c41_bb38_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3322_c41_bb38_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3322_c41_bb38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3323_c41_c0ef_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3323_c41_c0ef_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3323_c41_c0ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3324_c41_0be2_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3324_c41_0be2_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3324_c41_0be2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3325_c41_242b_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3325_c41_242b_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3325_c41_242b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3326_c41_762a_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3326_c41_762a_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3326_c41_762a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3327_c41_82c9_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3327_c41_82c9_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3327_c41_82c9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3329_c41_0430_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3329_c41_0430_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3329_c41_0430_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3333_c6_2112_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3335_c4_f12e : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3337_c4_decd : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3341_c18_3b47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3342_c19_f1da_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3343_c2_291a : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3343_c19_468c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3343_c19_468c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3343_c82_d572_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3344_c22_40ce_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l3346_c2_c9e2 : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0 : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1 : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l3356_c2_a659 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3358_c3_2f8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3359_c3_93d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3362_c3_5e13_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3365_c34_1720_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3366_c23_5f54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3367_c33_6c5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3368_c29_18cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3369_c30_15b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3370_c34_592f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3371_c33_c8a6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3372_c31_e945_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3373_c32_b299_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3343_l3347_l3334_DUPLICATE_fe3a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3337_l3335_DUPLICATE_a47b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3361_l3357_DUPLICATE_5b6c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3375_l3239_DUPLICATE_95cf_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right := to_unsigned(2560, 12);
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right := to_unsigned(1024, 11);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right := to_unsigned(33, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right := to_unsigned(64, 7);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right := to_unsigned(19, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right := to_unsigned(44, 6);
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right := to_unsigned(26, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right := to_unsigned(38, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right := to_unsigned(24, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right := to_unsigned(34, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right := to_unsigned(39, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3316_c41_a87d_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3315_c41_58fa_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3324_c41_0be2_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3323_c41_c0ef_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3322_c41_bb38_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3321_c41_79bf_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3327_c41_82c9_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3283_c41_9a30_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3287_c41_073e_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3269_c41_25a0_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3289_c41_1b11_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3319_c41_13a0_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3285_c41_a485_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3274_c41_3641_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3273_c41_3c53_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3326_c41_762a_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3325_c41_242b_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3271_c41_a191_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3277_c41_afd6_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3329_c41_0430_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3297_c41_acb2_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3318_c41_0939_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3317_c41_9537_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3275_c41_17d9_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3264_c41_df43_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3266_c41_515d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3265_c41_440a_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3267_c41_33be_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3316_c41_a87d_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3315_c41_58fa_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3324_c41_0be2_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3323_c41_c0ef_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3322_c41_bb38_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3321_c41_79bf_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3327_c41_82c9_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3283_c41_9a30_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3287_c41_073e_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3269_c41_25a0_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3264_c41_df43_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3266_c41_515d_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3265_c41_440a_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3267_c41_33be_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3289_c41_1b11_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3319_c41_13a0_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3285_c41_a485_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3274_c41_3641_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3273_c41_3c53_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3326_c41_762a_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3325_c41_242b_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3271_c41_a191_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3277_c41_afd6_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3329_c41_0430_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3297_c41_acb2_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3318_c41_0939_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3317_c41_9537_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3275_c41_17d9_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l3256_c41_f1a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_left;
     BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output := BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3256_c57_2fec] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c57_2fec_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3257_c18_277d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_left;
     BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output := BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3256_c10_760c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_left;
     BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output := BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3261_c2_b503] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3261_c2_b503_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c10_760c_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3257_c18_277d_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c57_2fec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3261_c2_b503_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l3257_c18_65cf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_left;
     BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output := BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3256_c30_4e9d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c30_4e9d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3256_c41_f1a0_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3256_c10_4c39] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_left;
     BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output := BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3256_c57_2fc7] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output := CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3256_c10_5501_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3256_c10_4c39_return_output;
     VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3257_c18_65cf_return_output;
     VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3256_c30_4e9d_return_output;
     VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3256_c57_2fc7_return_output;
     -- MUX[uxn_opcodes_h_l3257_c18_d3de] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3257_c18_d3de_cond <= VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_cond;
     MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue <= VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iftrue;
     MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse <= VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_return_output := MUX_uxn_opcodes_h_l3257_c18_d3de_return_output;

     -- MUX[uxn_opcodes_h_l3256_c10_5501] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3256_c10_5501_cond <= VAR_MUX_uxn_opcodes_h_l3256_c10_5501_cond;
     MUX_uxn_opcodes_h_l3256_c10_5501_iftrue <= VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iftrue;
     MUX_uxn_opcodes_h_l3256_c10_5501_iffalse <= VAR_MUX_uxn_opcodes_h_l3256_c10_5501_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3256_c10_5501_return_output := MUX_uxn_opcodes_h_l3256_c10_5501_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3256_c2_5f68 := VAR_MUX_uxn_opcodes_h_l3256_c10_5501_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left := VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3257_c18_d3de_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3256_c2_5f68;
     VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1 := resize(VAR_opc_uxn_opcodes_h_l3256_c2_5f68, 32);
     VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0 := resize(VAR_opc_uxn_opcodes_h_l3256_c2_5f68, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3287_c11_7543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_left;
     BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output := BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3316_c11_8557] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_left;
     BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output := BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3324_c11_686f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3309_c11_8a7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3292_c11_017b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3322_c11_a1d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3297_c11_8564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_left;
     BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output := BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3283_c11_9a56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_left;
     BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output := BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3318_c11_2b7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3312_c11_c64b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3279_c11_380b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3320_c11_d824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_left;
     BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output := BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3274_c11_08ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3293_c11_8c32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_left;
     BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output := BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3271_c11_6e43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_left;
     BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output := BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3314_c11_1813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_left;
     BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output := BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3298_c11_b871] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_left;
     BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output := BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3301_c11_10e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3327_c11_154d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3319_c11_20fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3265_c11_1ad9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3313_c11_280d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3294_c11_ccfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3323_c11_accb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3286_c11_e2bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3321_c11_af99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_left;
     BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output := BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3266_c11_b034] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_left;
     BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output := BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3275_c11_a05d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3311_c11_72a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3310_c11_6681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_left;
     BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output := BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3289_c11_ea49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_left;
     BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output := BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3304_c11_8079] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_left;
     BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output := BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3308_c11_6988] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_left;
     BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output := BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3261_c6_61e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3295_c11_d036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_left;
     BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output := BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3296_c11_1ead] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_left;
     BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output := BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3299_c11_e66c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3272_c11_2d26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_left;
     BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output := BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3317_c11_5e4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3273_c11_4e7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3281_c11_73a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3300_c11_4133] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_left;
     BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output := BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3269_c11_f269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_left;
     BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output := BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3280_c11_0653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_left;
     BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output := BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3302_c11_9fb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3330_c11_92a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3277_c11_a2d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3305_c11_7219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_left;
     BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output := BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3285_c11_204a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3328_c11_00ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3267_c11_14c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3263_c11_1978] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_left;
     BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output := BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3284_c11_d2a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3276_c11_97ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3325_c11_47a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output;

     -- printf_uxn_opcodes_h_l3259_c2_ef9e[uxn_opcodes_h_l3259_c2_ef9e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0 <= VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg0;
     printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1 <= VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg1;
     printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2 <= VAR_printf_uxn_opcodes_h_l3259_c2_ef9e_uxn_opcodes_h_l3259_c2_ef9e_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3262_c11_13f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3278_c11_e989] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_left;
     BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output := BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3264_c11_1f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3288_c11_d218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_left;
     BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output := BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3326_c11_7f19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_left;
     BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output := BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3329_c11_e0a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3268_c11_9390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_left;
     BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output := BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3282_c11_678c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3291_c11_7228] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_left;
     BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output := BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3290_c11_f8a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3315_c11_400f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3306_c11_7d95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_left;
     BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output := BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3307_c11_b0ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3270_c11_2db8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3303_c11_c22f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3261_c6_61e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3262_c11_13f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3263_c11_1978_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3264_c11_1f5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3265_c11_1ad9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3266_c11_b034_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3267_c11_14c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3268_c11_9390_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3269_c11_f269_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3270_c11_2db8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3271_c11_6e43_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3272_c11_2d26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3273_c11_4e7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3274_c11_08ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3275_c11_a05d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3276_c11_97ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3277_c11_a2d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3278_c11_e989_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3279_c11_380b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3280_c11_0653_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3281_c11_73a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3282_c11_678c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3283_c11_9a56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3284_c11_d2a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3285_c11_204a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3286_c11_e2bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3287_c11_7543_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3288_c11_d218_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3289_c11_ea49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3290_c11_f8a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3291_c11_7228_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3292_c11_017b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3293_c11_8c32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3294_c11_ccfa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3295_c11_d036_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3296_c11_1ead_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3297_c11_8564_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3298_c11_b871_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3299_c11_e66c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3300_c11_4133_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3301_c11_10e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3302_c11_9fb4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3303_c11_c22f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3304_c11_8079_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3305_c11_7219_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3306_c11_7d95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3307_c11_b0ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3308_c11_6988_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3309_c11_8a7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3310_c11_6681_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3311_c11_72a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3312_c11_c64b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3313_c11_280d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3314_c11_1813_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3315_c11_400f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3316_c11_8557_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3317_c11_5e4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3318_c11_2b7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3319_c11_20fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3320_c11_d824_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3321_c11_af99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3322_c11_a1d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3323_c11_accb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3324_c11_686f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3325_c11_47a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3326_c11_7f19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3327_c11_154d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3328_c11_00ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3329_c11_e0a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3330_c11_92a2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c7_d851] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c7_d851_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3262_c1_6a48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3263_c7_0fe4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output;
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3262_c1_6a48_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3264_c7_dc8c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output;

     -- jci[uxn_opcodes_h_l3262_c41_d2d4] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3262_c41_d2d4_phase <= VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_phase;
     jci_uxn_opcodes_h_l3262_c41_d2d4_pc <= VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_pc;
     jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_stack_read;
     jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_return_output := jci_uxn_opcodes_h_l3262_c41_d2d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3263_c1_8e68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output;
     VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3263_c1_8e68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue := VAR_jci_uxn_opcodes_h_l3262_c41_d2d4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3264_c1_d301] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3265_c7_0fbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output;

     -- jmi[uxn_opcodes_h_l3263_c41_f27b] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3263_c41_f27b_phase <= VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_phase;
     jmi_uxn_opcodes_h_l3263_c41_f27b_pc <= VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_pc;
     jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_return_output := jmi_uxn_opcodes_h_l3263_c41_f27b_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output;
     VAR_jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3264_c1_d301_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue := VAR_jmi_uxn_opcodes_h_l3263_c41_f27b_return_output;
     -- jsi[uxn_opcodes_h_l3264_c41_df43] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3264_c41_df43_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3264_c41_df43_phase <= VAR_jsi_uxn_opcodes_h_l3264_c41_df43_phase;
     jsi_uxn_opcodes_h_l3264_c41_df43_pc <= VAR_jsi_uxn_opcodes_h_l3264_c41_df43_pc;
     jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3264_c41_df43_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3264_c41_df43_return_output := jsi_uxn_opcodes_h_l3264_c41_df43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3266_c7_b3ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3265_c1_e782] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output;
     VAR_lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3265_c1_e782_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue := VAR_jsi_uxn_opcodes_h_l3264_c41_df43_return_output;
     -- lit[uxn_opcodes_h_l3265_c41_440a] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3265_c41_440a_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3265_c41_440a_phase <= VAR_lit_uxn_opcodes_h_l3265_c41_440a_phase;
     lit_uxn_opcodes_h_l3265_c41_440a_pc <= VAR_lit_uxn_opcodes_h_l3265_c41_440a_pc;
     lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3265_c41_440a_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3265_c41_440a_return_output := lit_uxn_opcodes_h_l3265_c41_440a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3266_c1_9528] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3267_c7_bf49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output;
     VAR_lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3266_c1_9528_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue := VAR_lit_uxn_opcodes_h_l3265_c41_440a_return_output;
     -- lit2[uxn_opcodes_h_l3266_c41_515d] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3266_c41_515d_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3266_c41_515d_phase <= VAR_lit2_uxn_opcodes_h_l3266_c41_515d_phase;
     lit2_uxn_opcodes_h_l3266_c41_515d_pc <= VAR_lit2_uxn_opcodes_h_l3266_c41_515d_pc;
     lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3266_c41_515d_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3266_c41_515d_return_output := lit2_uxn_opcodes_h_l3266_c41_515d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3268_c7_bde2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3267_c1_7874] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output;
     VAR_lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3267_c1_7874_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue := VAR_lit2_uxn_opcodes_h_l3266_c41_515d_return_output;
     -- lit[uxn_opcodes_h_l3267_c41_33be] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3267_c41_33be_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3267_c41_33be_phase <= VAR_lit_uxn_opcodes_h_l3267_c41_33be_phase;
     lit_uxn_opcodes_h_l3267_c41_33be_pc <= VAR_lit_uxn_opcodes_h_l3267_c41_33be_pc;
     lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3267_c41_33be_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3267_c41_33be_return_output := lit_uxn_opcodes_h_l3267_c41_33be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3269_c7_6e71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3268_c1_b751] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output;
     VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3268_c1_b751_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue := VAR_lit_uxn_opcodes_h_l3267_c41_33be_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3270_c7_d5d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3269_c1_ce88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output;

     -- lit2[uxn_opcodes_h_l3268_c41_cc09] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3268_c41_cc09_phase <= VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_phase;
     lit2_uxn_opcodes_h_l3268_c41_cc09_pc <= VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_pc;
     lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_return_output := lit2_uxn_opcodes_h_l3268_c41_cc09_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output;
     VAR_inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3269_c1_ce88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue := VAR_lit2_uxn_opcodes_h_l3268_c41_cc09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3270_c1_bb2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3271_c7_2510] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output;

     -- inc[uxn_opcodes_h_l3269_c41_25a0] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3269_c41_25a0_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3269_c41_25a0_phase <= VAR_inc_uxn_opcodes_h_l3269_c41_25a0_phase;
     inc_uxn_opcodes_h_l3269_c41_25a0_ins <= VAR_inc_uxn_opcodes_h_l3269_c41_25a0_ins;
     inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3269_c41_25a0_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3269_c41_25a0_return_output := inc_uxn_opcodes_h_l3269_c41_25a0_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c7_2510_return_output;
     VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3270_c1_bb2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue := VAR_inc_uxn_opcodes_h_l3269_c41_25a0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3271_c1_ee71] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output;

     -- inc2[uxn_opcodes_h_l3270_c41_b4b6] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3270_c41_b4b6_phase <= VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_phase;
     inc2_uxn_opcodes_h_l3270_c41_b4b6_ins <= VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_ins;
     inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output := inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3272_c7_3322] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c7_3322_return_output;
     VAR_pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3271_c1_ee71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue := VAR_inc2_uxn_opcodes_h_l3270_c41_b4b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3272_c1_9e32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3273_c7_d998] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output;

     -- pop[uxn_opcodes_h_l3271_c41_a191] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3271_c41_a191_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3271_c41_a191_phase <= VAR_pop_uxn_opcodes_h_l3271_c41_a191_phase;
     pop_uxn_opcodes_h_l3271_c41_a191_ins <= VAR_pop_uxn_opcodes_h_l3271_c41_a191_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3271_c41_a191_return_output := pop_uxn_opcodes_h_l3271_c41_a191_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c7_d998_return_output;
     VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3272_c1_9e32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue := VAR_pop_uxn_opcodes_h_l3271_c41_a191_return_output;
     -- pop2[uxn_opcodes_h_l3272_c41_bd05] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3272_c41_bd05_phase <= VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_phase;
     pop2_uxn_opcodes_h_l3272_c41_bd05_ins <= VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_return_output := pop2_uxn_opcodes_h_l3272_c41_bd05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3273_c1_f411] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3274_c7_c23f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output;
     VAR_nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3273_c1_f411_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue := VAR_pop2_uxn_opcodes_h_l3272_c41_bd05_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3274_c1_2215] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output;

     -- nip[uxn_opcodes_h_l3273_c41_3c53] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3273_c41_3c53_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3273_c41_3c53_phase <= VAR_nip_uxn_opcodes_h_l3273_c41_3c53_phase;
     nip_uxn_opcodes_h_l3273_c41_3c53_ins <= VAR_nip_uxn_opcodes_h_l3273_c41_3c53_ins;
     nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3273_c41_3c53_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3273_c41_3c53_return_output := nip_uxn_opcodes_h_l3273_c41_3c53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3275_c7_bc1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output;
     VAR_nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3274_c1_2215_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue := VAR_nip_uxn_opcodes_h_l3273_c41_3c53_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3275_c1_7860] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output;

     -- nip2[uxn_opcodes_h_l3274_c41_3641] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3274_c41_3641_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3274_c41_3641_phase <= VAR_nip2_uxn_opcodes_h_l3274_c41_3641_phase;
     nip2_uxn_opcodes_h_l3274_c41_3641_ins <= VAR_nip2_uxn_opcodes_h_l3274_c41_3641_ins;
     nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3274_c41_3641_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3274_c41_3641_return_output := nip2_uxn_opcodes_h_l3274_c41_3641_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3276_c7_b9c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output;
     VAR_swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3275_c1_7860_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue := VAR_nip2_uxn_opcodes_h_l3274_c41_3641_return_output;
     -- swp[uxn_opcodes_h_l3275_c41_17d9] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3275_c41_17d9_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3275_c41_17d9_phase <= VAR_swp_uxn_opcodes_h_l3275_c41_17d9_phase;
     swp_uxn_opcodes_h_l3275_c41_17d9_ins <= VAR_swp_uxn_opcodes_h_l3275_c41_17d9_ins;
     swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3275_c41_17d9_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3275_c41_17d9_return_output := swp_uxn_opcodes_h_l3275_c41_17d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3277_c7_16bc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3276_c1_ace5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output;
     VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3276_c1_ace5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue := VAR_swp_uxn_opcodes_h_l3275_c41_17d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3277_c1_73c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output;

     -- swp2[uxn_opcodes_h_l3276_c41_f64c] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3276_c41_f64c_phase <= VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_phase;
     swp2_uxn_opcodes_h_l3276_c41_f64c_ins <= VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_ins;
     swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_return_output := swp2_uxn_opcodes_h_l3276_c41_f64c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3278_c7_187a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c7_187a_return_output;
     VAR_rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3277_c1_73c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue := VAR_swp2_uxn_opcodes_h_l3276_c41_f64c_return_output;
     -- rot[uxn_opcodes_h_l3277_c41_afd6] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3277_c41_afd6_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3277_c41_afd6_phase <= VAR_rot_uxn_opcodes_h_l3277_c41_afd6_phase;
     rot_uxn_opcodes_h_l3277_c41_afd6_ins <= VAR_rot_uxn_opcodes_h_l3277_c41_afd6_ins;
     rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3277_c41_afd6_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3277_c41_afd6_return_output := rot_uxn_opcodes_h_l3277_c41_afd6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3278_c1_5f08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3279_c7_13b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output;
     VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3278_c1_5f08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue := VAR_rot_uxn_opcodes_h_l3277_c41_afd6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3280_c7_e03f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3279_c1_4026] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output;

     -- rot2[uxn_opcodes_h_l3278_c41_c0de] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3278_c41_c0de_phase <= VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_phase;
     rot2_uxn_opcodes_h_l3278_c41_c0de_ins <= VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_ins;
     rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_return_output := rot2_uxn_opcodes_h_l3278_c41_c0de_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output;
     VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3279_c1_4026_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue := VAR_rot2_uxn_opcodes_h_l3278_c41_c0de_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3281_c7_985a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output;

     -- dup[uxn_opcodes_h_l3279_c41_c1ef] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3279_c41_c1ef_phase <= VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_phase;
     dup_uxn_opcodes_h_l3279_c41_c1ef_ins <= VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_ins;
     dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_return_output := dup_uxn_opcodes_h_l3279_c41_c1ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3280_c1_be0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c7_985a_return_output;
     VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3280_c1_be0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue := VAR_dup_uxn_opcodes_h_l3279_c41_c1ef_return_output;
     -- dup2[uxn_opcodes_h_l3280_c41_bf67] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3280_c41_bf67_phase <= VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_phase;
     dup2_uxn_opcodes_h_l3280_c41_bf67_ins <= VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_ins;
     dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_return_output := dup2_uxn_opcodes_h_l3280_c41_bf67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3281_c1_ec57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3282_c7_3756] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c7_3756_return_output;
     VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3281_c1_ec57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue := VAR_dup2_uxn_opcodes_h_l3280_c41_bf67_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3283_c7_fa22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3282_c1_8d45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output;

     -- ovr[uxn_opcodes_h_l3281_c41_f5be] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3281_c41_f5be_phase <= VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_phase;
     ovr_uxn_opcodes_h_l3281_c41_f5be_ins <= VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_ins;
     ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_return_output := ovr_uxn_opcodes_h_l3281_c41_f5be_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output;
     VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3282_c1_8d45_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue := VAR_ovr_uxn_opcodes_h_l3281_c41_f5be_return_output;
     -- ovr2[uxn_opcodes_h_l3282_c41_2cc6] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase <= VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_phase;
     ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins <= VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_ins;
     ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output := ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3284_c7_19b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3283_c1_4e27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output;
     VAR_equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3283_c1_4e27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue := VAR_ovr2_uxn_opcodes_h_l3282_c41_2cc6_return_output;
     -- equ[uxn_opcodes_h_l3283_c41_9a30] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3283_c41_9a30_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3283_c41_9a30_phase <= VAR_equ_uxn_opcodes_h_l3283_c41_9a30_phase;
     equ_uxn_opcodes_h_l3283_c41_9a30_ins <= VAR_equ_uxn_opcodes_h_l3283_c41_9a30_ins;
     equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3283_c41_9a30_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3283_c41_9a30_return_output := equ_uxn_opcodes_h_l3283_c41_9a30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3285_c7_c993] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3284_c1_4339] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c7_c993_return_output;
     VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3284_c1_4339_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue := VAR_equ_uxn_opcodes_h_l3283_c41_9a30_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3285_c1_4ff2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c7_16e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output;

     -- equ2[uxn_opcodes_h_l3284_c41_ae23] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3284_c41_ae23_phase <= VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_phase;
     equ2_uxn_opcodes_h_l3284_c41_ae23_ins <= VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_ins;
     equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_return_output := equ2_uxn_opcodes_h_l3284_c41_ae23_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output;
     VAR_neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3285_c1_4ff2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue := VAR_equ2_uxn_opcodes_h_l3284_c41_ae23_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c7_51a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3286_c1_0e99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output;

     -- neq[uxn_opcodes_h_l3285_c41_a485] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3285_c41_a485_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3285_c41_a485_phase <= VAR_neq_uxn_opcodes_h_l3285_c41_a485_phase;
     neq_uxn_opcodes_h_l3285_c41_a485_ins <= VAR_neq_uxn_opcodes_h_l3285_c41_a485_ins;
     neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3285_c41_a485_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3285_c41_a485_return_output := neq_uxn_opcodes_h_l3285_c41_a485_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output;
     VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3286_c1_0e99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue := VAR_neq_uxn_opcodes_h_l3285_c41_a485_return_output;
     -- neq2[uxn_opcodes_h_l3286_c41_9c2c] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3286_c41_9c2c_phase <= VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_phase;
     neq2_uxn_opcodes_h_l3286_c41_9c2c_ins <= VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_ins;
     neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output := neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3287_c1_75aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c7_aadc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output;
     VAR_gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3287_c1_75aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue := VAR_neq2_uxn_opcodes_h_l3286_c41_9c2c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3288_c1_c790] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output;

     -- gth[uxn_opcodes_h_l3287_c41_073e] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3287_c41_073e_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3287_c41_073e_phase <= VAR_gth_uxn_opcodes_h_l3287_c41_073e_phase;
     gth_uxn_opcodes_h_l3287_c41_073e_ins <= VAR_gth_uxn_opcodes_h_l3287_c41_073e_ins;
     gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3287_c41_073e_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3287_c41_073e_return_output := gth_uxn_opcodes_h_l3287_c41_073e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c7_96f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output;
     VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3288_c1_c790_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue := VAR_gth_uxn_opcodes_h_l3287_c41_073e_return_output;
     -- gth2[uxn_opcodes_h_l3288_c41_73ce] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3288_c41_73ce_phase <= VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_phase;
     gth2_uxn_opcodes_h_l3288_c41_73ce_ins <= VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_ins;
     gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_return_output := gth2_uxn_opcodes_h_l3288_c41_73ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c7_eb64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3289_c1_481f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output;
     VAR_lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3289_c1_481f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue := VAR_gth2_uxn_opcodes_h_l3288_c41_73ce_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3290_c1_692d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output;

     -- lth[uxn_opcodes_h_l3289_c41_1b11] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3289_c41_1b11_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3289_c41_1b11_phase <= VAR_lth_uxn_opcodes_h_l3289_c41_1b11_phase;
     lth_uxn_opcodes_h_l3289_c41_1b11_ins <= VAR_lth_uxn_opcodes_h_l3289_c41_1b11_ins;
     lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3289_c41_1b11_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3289_c41_1b11_return_output := lth_uxn_opcodes_h_l3289_c41_1b11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c7_5618] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c7_5618_return_output;
     VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3290_c1_692d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue := VAR_lth_uxn_opcodes_h_l3289_c41_1b11_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3291_c1_7b6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output;

     -- lth2[uxn_opcodes_h_l3290_c41_e9f1] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3290_c41_e9f1_phase <= VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_phase;
     lth2_uxn_opcodes_h_l3290_c41_e9f1_ins <= VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_ins;
     lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output := lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c7_0aba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output;
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3291_c1_7b6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue := VAR_lth2_uxn_opcodes_h_l3290_c41_e9f1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3292_c1_16c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c7_361b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output;

     -- jmp[uxn_opcodes_h_l3291_c41_c300] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3291_c41_c300_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3291_c41_c300_phase <= VAR_jmp_uxn_opcodes_h_l3291_c41_c300_phase;
     jmp_uxn_opcodes_h_l3291_c41_c300_ins <= VAR_jmp_uxn_opcodes_h_l3291_c41_c300_ins;
     jmp_uxn_opcodes_h_l3291_c41_c300_pc <= VAR_jmp_uxn_opcodes_h_l3291_c41_c300_pc;
     jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3291_c41_c300_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3291_c41_c300_return_output := jmp_uxn_opcodes_h_l3291_c41_c300_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c7_361b_return_output;
     VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3292_c1_16c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue := VAR_jmp_uxn_opcodes_h_l3291_c41_c300_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3293_c1_a25d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output;

     -- jmp2[uxn_opcodes_h_l3292_c41_9bc9] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase <= VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_phase;
     jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins <= VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_ins;
     jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output := jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c7_ed87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output;
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3293_c1_a25d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue := VAR_jmp2_uxn_opcodes_h_l3292_c41_9bc9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3294_c1_258e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c7_8d07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output;

     -- jcn[uxn_opcodes_h_l3293_c41_8f3e] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3293_c41_8f3e_phase <= VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_phase;
     jcn_uxn_opcodes_h_l3293_c41_8f3e_ins <= VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_ins;
     jcn_uxn_opcodes_h_l3293_c41_8f3e_pc <= VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_pc;
     jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output := jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output;
     VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3294_c1_258e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue := VAR_jcn_uxn_opcodes_h_l3293_c41_8f3e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3295_c1_e73c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output;

     -- jcn2[uxn_opcodes_h_l3294_c41_127d] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3294_c41_127d_phase <= VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_phase;
     jcn2_uxn_opcodes_h_l3294_c41_127d_ins <= VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_ins;
     jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_return_output := jcn2_uxn_opcodes_h_l3294_c41_127d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c7_b38f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output;
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3295_c1_e73c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue := VAR_jcn2_uxn_opcodes_h_l3294_c41_127d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c7_b928] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output;

     -- jsr[uxn_opcodes_h_l3295_c41_b42d] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3295_c41_b42d_phase <= VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_phase;
     jsr_uxn_opcodes_h_l3295_c41_b42d_ins <= VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_ins;
     jsr_uxn_opcodes_h_l3295_c41_b42d_pc <= VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_pc;
     jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_return_output := jsr_uxn_opcodes_h_l3295_c41_b42d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3296_c1_4ee1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c7_b928_return_output;
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3296_c1_4ee1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue := VAR_jsr_uxn_opcodes_h_l3295_c41_b42d_return_output;
     -- jsr2[uxn_opcodes_h_l3296_c41_e79b] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3296_c41_e79b_phase <= VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_phase;
     jsr2_uxn_opcodes_h_l3296_c41_e79b_ins <= VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_ins;
     jsr2_uxn_opcodes_h_l3296_c41_e79b_pc <= VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_pc;
     jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output := jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c7_300c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3297_c1_14c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c7_300c_return_output;
     VAR_sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3297_c1_14c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue := VAR_jsr2_uxn_opcodes_h_l3296_c41_e79b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c7_56b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3298_c1_9913] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output;

     -- sth[uxn_opcodes_h_l3297_c41_acb2] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3297_c41_acb2_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3297_c41_acb2_phase <= VAR_sth_uxn_opcodes_h_l3297_c41_acb2_phase;
     sth_uxn_opcodes_h_l3297_c41_acb2_ins <= VAR_sth_uxn_opcodes_h_l3297_c41_acb2_ins;
     sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3297_c41_acb2_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3297_c41_acb2_return_output := sth_uxn_opcodes_h_l3297_c41_acb2_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output;
     VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3298_c1_9913_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue := VAR_sth_uxn_opcodes_h_l3297_c41_acb2_return_output;
     -- sth2[uxn_opcodes_h_l3298_c41_d59a] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3298_c41_d59a_phase <= VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_phase;
     sth2_uxn_opcodes_h_l3298_c41_d59a_ins <= VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_ins;
     sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_return_output := sth2_uxn_opcodes_h_l3298_c41_d59a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3299_c1_fdf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c7_3a78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output;
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3299_c1_fdf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue := VAR_sth2_uxn_opcodes_h_l3298_c41_d59a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c7_a23a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output;

     -- ldz[uxn_opcodes_h_l3299_c41_bfde] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3299_c41_bfde_phase <= VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_phase;
     ldz_uxn_opcodes_h_l3299_c41_bfde_ins <= VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_ins;
     ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_stack_read;
     ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_return_output := ldz_uxn_opcodes_h_l3299_c41_bfde_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3300_c1_853f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output;
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3300_c1_853f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue := VAR_ldz_uxn_opcodes_h_l3299_c41_bfde_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c7_21d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output;

     -- ldz2[uxn_opcodes_h_l3300_c41_a914] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3300_c41_a914_phase <= VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_phase;
     ldz2_uxn_opcodes_h_l3300_c41_a914_ins <= VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_ins;
     ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_stack_read;
     ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_return_output := ldz2_uxn_opcodes_h_l3300_c41_a914_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3301_c1_a20c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output;
     VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3301_c1_a20c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue := VAR_ldz2_uxn_opcodes_h_l3300_c41_a914_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3302_c1_6668] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c7_4786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output;

     -- stz[uxn_opcodes_h_l3301_c41_7c5d] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3301_c41_7c5d_phase <= VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_phase;
     stz_uxn_opcodes_h_l3301_c41_7c5d_ins <= VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_ins;
     stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_return_output := stz_uxn_opcodes_h_l3301_c41_7c5d_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c7_4786_return_output;
     VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3302_c1_6668_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue := VAR_stz_uxn_opcodes_h_l3301_c41_7c5d_return_output;
     -- stz2[uxn_opcodes_h_l3302_c41_ee38] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3302_c41_ee38_phase <= VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_phase;
     stz2_uxn_opcodes_h_l3302_c41_ee38_ins <= VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_ins;
     stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_return_output := stz2_uxn_opcodes_h_l3302_c41_ee38_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c7_b45b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3303_c1_ed68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output;
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3303_c1_ed68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue := VAR_stz2_uxn_opcodes_h_l3302_c41_ee38_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3304_c1_0de2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output;

     -- ldr[uxn_opcodes_h_l3303_c41_46eb] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3303_c41_46eb_phase <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_phase;
     ldr_uxn_opcodes_h_l3303_c41_46eb_ins <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_ins;
     ldr_uxn_opcodes_h_l3303_c41_46eb_pc <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_pc;
     ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_stack_read;
     ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_return_output := ldr_uxn_opcodes_h_l3303_c41_46eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c7_de1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output;
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3304_c1_0de2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue := VAR_ldr_uxn_opcodes_h_l3303_c41_46eb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c7_e9cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3305_c1_e824] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output;

     -- ldr2[uxn_opcodes_h_l3304_c41_932e] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3304_c41_932e_phase <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_phase;
     ldr2_uxn_opcodes_h_l3304_c41_932e_ins <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_ins;
     ldr2_uxn_opcodes_h_l3304_c41_932e_pc <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_pc;
     ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_stack_read;
     ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_return_output := ldr2_uxn_opcodes_h_l3304_c41_932e_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output;
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3305_c1_e824_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue := VAR_ldr2_uxn_opcodes_h_l3304_c41_932e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c7_d253] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3306_c1_256e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output;

     -- str1[uxn_opcodes_h_l3305_c41_ac5e] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3305_c41_ac5e_phase <= VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_phase;
     str1_uxn_opcodes_h_l3305_c41_ac5e_ins <= VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_ins;
     str1_uxn_opcodes_h_l3305_c41_ac5e_pc <= VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_pc;
     str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_return_output := str1_uxn_opcodes_h_l3305_c41_ac5e_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c7_d253_return_output;
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3306_c1_256e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue := VAR_str1_uxn_opcodes_h_l3305_c41_ac5e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3307_c1_67de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output;

     -- str2[uxn_opcodes_h_l3306_c41_daf9] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3306_c41_daf9_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3306_c41_daf9_phase <= VAR_str2_uxn_opcodes_h_l3306_c41_daf9_phase;
     str2_uxn_opcodes_h_l3306_c41_daf9_ins <= VAR_str2_uxn_opcodes_h_l3306_c41_daf9_ins;
     str2_uxn_opcodes_h_l3306_c41_daf9_pc <= VAR_str2_uxn_opcodes_h_l3306_c41_daf9_pc;
     str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3306_c41_daf9_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3306_c41_daf9_return_output := str2_uxn_opcodes_h_l3306_c41_daf9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c7_c42f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output;
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3307_c1_67de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue := VAR_str2_uxn_opcodes_h_l3306_c41_daf9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c7_27d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3308_c1_9f75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output;

     -- lda[uxn_opcodes_h_l3307_c41_0e46] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3307_c41_0e46_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3307_c41_0e46_phase <= VAR_lda_uxn_opcodes_h_l3307_c41_0e46_phase;
     lda_uxn_opcodes_h_l3307_c41_0e46_ins <= VAR_lda_uxn_opcodes_h_l3307_c41_0e46_ins;
     lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_stack_read;
     lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3307_c41_0e46_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3307_c41_0e46_return_output := lda_uxn_opcodes_h_l3307_c41_0e46_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output;
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3308_c1_9f75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue := VAR_lda_uxn_opcodes_h_l3307_c41_0e46_return_output;
     -- lda2[uxn_opcodes_h_l3308_c41_5cef] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3308_c41_5cef_phase <= VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_phase;
     lda2_uxn_opcodes_h_l3308_c41_5cef_ins <= VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_ins;
     lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_stack_read;
     lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_return_output := lda2_uxn_opcodes_h_l3308_c41_5cef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c7_35f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3309_c1_8ccd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output;
     VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3309_c1_8ccd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue := VAR_lda2_uxn_opcodes_h_l3308_c41_5cef_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c7_c49f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output;

     -- sta[uxn_opcodes_h_l3309_c41_0b3b] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3309_c41_0b3b_phase <= VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_phase;
     sta_uxn_opcodes_h_l3309_c41_0b3b_ins <= VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_ins;
     sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_return_output := sta_uxn_opcodes_h_l3309_c41_0b3b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3310_c1_2a93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output;
     VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3310_c1_2a93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue := VAR_sta_uxn_opcodes_h_l3309_c41_0b3b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c7_4ec2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output;

     -- sta2[uxn_opcodes_h_l3310_c41_5bf6] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3310_c41_5bf6_phase <= VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_phase;
     sta2_uxn_opcodes_h_l3310_c41_5bf6_ins <= VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_ins;
     sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output := sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3311_c1_4c6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output;
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3311_c1_4c6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue := VAR_sta2_uxn_opcodes_h_l3310_c41_5bf6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3312_c1_856f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c7_e804] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output;

     -- dei[uxn_opcodes_h_l3311_c41_bced] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3311_c41_bced_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3311_c41_bced_phase <= VAR_dei_uxn_opcodes_h_l3311_c41_bced_phase;
     dei_uxn_opcodes_h_l3311_c41_bced_ins <= VAR_dei_uxn_opcodes_h_l3311_c41_bced_ins;
     dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_stack_read;
     dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3311_c41_bced_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3311_c41_bced_return_output := dei_uxn_opcodes_h_l3311_c41_bced_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c7_e804_return_output;
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3312_c1_856f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue := VAR_dei_uxn_opcodes_h_l3311_c41_bced_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3313_c1_b232] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c7_3801] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output;

     -- dei2[uxn_opcodes_h_l3312_c41_4a0b] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3312_c41_4a0b_phase <= VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_phase;
     dei2_uxn_opcodes_h_l3312_c41_4a0b_ins <= VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_ins;
     dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_stack_read;
     dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output := dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c7_3801_return_output;
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3313_c1_b232_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue := VAR_dei2_uxn_opcodes_h_l3312_c41_4a0b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c7_258a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output;

     -- deo[uxn_opcodes_h_l3313_c41_946c] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3313_c41_946c_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3313_c41_946c_phase <= VAR_deo_uxn_opcodes_h_l3313_c41_946c_phase;
     deo_uxn_opcodes_h_l3313_c41_946c_ins <= VAR_deo_uxn_opcodes_h_l3313_c41_946c_ins;
     deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_stack_read;
     deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3313_c41_946c_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3313_c41_946c_return_output := deo_uxn_opcodes_h_l3313_c41_946c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3314_c1_f641] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c7_258a_return_output;
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3314_c1_f641_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue := VAR_deo_uxn_opcodes_h_l3313_c41_946c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c7_b7eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3315_c1_d530] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output;

     -- deo2[uxn_opcodes_h_l3314_c41_cc19] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3314_c41_cc19_phase <= VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_phase;
     deo2_uxn_opcodes_h_l3314_c41_cc19_ins <= VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_ins;
     deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_stack_read;
     deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_return_output := deo2_uxn_opcodes_h_l3314_c41_cc19_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output;
     VAR_add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3315_c1_d530_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue := VAR_deo2_uxn_opcodes_h_l3314_c41_cc19_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c7_62b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output;

     -- add[uxn_opcodes_h_l3315_c41_58fa] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3315_c41_58fa_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3315_c41_58fa_phase <= VAR_add_uxn_opcodes_h_l3315_c41_58fa_phase;
     add_uxn_opcodes_h_l3315_c41_58fa_ins <= VAR_add_uxn_opcodes_h_l3315_c41_58fa_ins;
     add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read <= VAR_add_uxn_opcodes_h_l3315_c41_58fa_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3315_c41_58fa_return_output := add_uxn_opcodes_h_l3315_c41_58fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3316_c1_b817] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output;
     VAR_add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3316_c1_b817_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue := VAR_add_uxn_opcodes_h_l3315_c41_58fa_return_output;
     -- add2[uxn_opcodes_h_l3316_c41_a87d] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3316_c41_a87d_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3316_c41_a87d_phase <= VAR_add2_uxn_opcodes_h_l3316_c41_a87d_phase;
     add2_uxn_opcodes_h_l3316_c41_a87d_ins <= VAR_add2_uxn_opcodes_h_l3316_c41_a87d_ins;
     add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3316_c41_a87d_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3316_c41_a87d_return_output := add2_uxn_opcodes_h_l3316_c41_a87d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3317_c1_29e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c7_187f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c7_187f_return_output;
     VAR_sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3317_c1_29e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue := VAR_add2_uxn_opcodes_h_l3316_c41_a87d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3318_c1_f702] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output;

     -- sub[uxn_opcodes_h_l3317_c41_9537] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3317_c41_9537_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3317_c41_9537_phase <= VAR_sub_uxn_opcodes_h_l3317_c41_9537_phase;
     sub_uxn_opcodes_h_l3317_c41_9537_ins <= VAR_sub_uxn_opcodes_h_l3317_c41_9537_ins;
     sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3317_c41_9537_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3317_c41_9537_return_output := sub_uxn_opcodes_h_l3317_c41_9537_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c7_1ac2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output;
     VAR_sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3318_c1_f702_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue := VAR_sub_uxn_opcodes_h_l3317_c41_9537_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3319_c1_b831] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c7_3078] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output;

     -- sub2[uxn_opcodes_h_l3318_c41_0939] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3318_c41_0939_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3318_c41_0939_phase <= VAR_sub2_uxn_opcodes_h_l3318_c41_0939_phase;
     sub2_uxn_opcodes_h_l3318_c41_0939_ins <= VAR_sub2_uxn_opcodes_h_l3318_c41_0939_ins;
     sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3318_c41_0939_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3318_c41_0939_return_output := sub2_uxn_opcodes_h_l3318_c41_0939_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c7_3078_return_output;
     VAR_mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3319_c1_b831_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue := VAR_sub2_uxn_opcodes_h_l3318_c41_0939_return_output;
     -- mul[uxn_opcodes_h_l3319_c41_13a0] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3319_c41_13a0_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3319_c41_13a0_phase <= VAR_mul_uxn_opcodes_h_l3319_c41_13a0_phase;
     mul_uxn_opcodes_h_l3319_c41_13a0_ins <= VAR_mul_uxn_opcodes_h_l3319_c41_13a0_ins;
     mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3319_c41_13a0_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3319_c41_13a0_return_output := mul_uxn_opcodes_h_l3319_c41_13a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3320_c1_7a08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c7_315a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c7_315a_return_output;
     VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3320_c1_7a08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue := VAR_mul_uxn_opcodes_h_l3319_c41_13a0_return_output;
     -- mul2[uxn_opcodes_h_l3320_c41_d0f6] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3320_c41_d0f6_phase <= VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_phase;
     mul2_uxn_opcodes_h_l3320_c41_d0f6_ins <= VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_ins;
     mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output := mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c7_183d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3321_c1_c388] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c7_183d_return_output;
     VAR_div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3321_c1_c388_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue := VAR_mul2_uxn_opcodes_h_l3320_c41_d0f6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3322_c1_6dd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c7_77de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output;

     -- div[uxn_opcodes_h_l3321_c41_79bf] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3321_c41_79bf_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3321_c41_79bf_phase <= VAR_div_uxn_opcodes_h_l3321_c41_79bf_phase;
     div_uxn_opcodes_h_l3321_c41_79bf_ins <= VAR_div_uxn_opcodes_h_l3321_c41_79bf_ins;
     div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read <= VAR_div_uxn_opcodes_h_l3321_c41_79bf_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3321_c41_79bf_return_output := div_uxn_opcodes_h_l3321_c41_79bf_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c7_77de_return_output;
     VAR_div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3322_c1_6dd3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue := VAR_div_uxn_opcodes_h_l3321_c41_79bf_return_output;
     -- div2[uxn_opcodes_h_l3322_c41_bb38] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3322_c41_bb38_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3322_c41_bb38_phase <= VAR_div2_uxn_opcodes_h_l3322_c41_bb38_phase;
     div2_uxn_opcodes_h_l3322_c41_bb38_ins <= VAR_div2_uxn_opcodes_h_l3322_c41_bb38_ins;
     div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3322_c41_bb38_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3322_c41_bb38_return_output := div2_uxn_opcodes_h_l3322_c41_bb38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3323_c1_a0f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c7_9a7c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output;
     VAR_and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3323_c1_a0f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue := VAR_div2_uxn_opcodes_h_l3322_c41_bb38_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c7_a585] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3324_c1_cf93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output;

     -- and[uxn_opcodes_h_l3323_c41_c0ef] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3323_c41_c0ef_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3323_c41_c0ef_phase <= VAR_and_uxn_opcodes_h_l3323_c41_c0ef_phase;
     and_uxn_opcodes_h_l3323_c41_c0ef_ins <= VAR_and_uxn_opcodes_h_l3323_c41_c0ef_ins;
     and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read <= VAR_and_uxn_opcodes_h_l3323_c41_c0ef_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3323_c41_c0ef_return_output := and_uxn_opcodes_h_l3323_c41_c0ef_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c7_a585_return_output;
     VAR_and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3324_c1_cf93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue := VAR_and_uxn_opcodes_h_l3323_c41_c0ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3325_c1_cc8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output;

     -- and2[uxn_opcodes_h_l3324_c41_0be2] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3324_c41_0be2_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3324_c41_0be2_phase <= VAR_and2_uxn_opcodes_h_l3324_c41_0be2_phase;
     and2_uxn_opcodes_h_l3324_c41_0be2_ins <= VAR_and2_uxn_opcodes_h_l3324_c41_0be2_ins;
     and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3324_c41_0be2_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3324_c41_0be2_return_output := and2_uxn_opcodes_h_l3324_c41_0be2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c7_51b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output;
     VAR_ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3325_c1_cc8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue := VAR_and2_uxn_opcodes_h_l3324_c41_0be2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c7_4354] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3326_c1_90ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output;

     -- ora[uxn_opcodes_h_l3325_c41_242b] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3325_c41_242b_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3325_c41_242b_phase <= VAR_ora_uxn_opcodes_h_l3325_c41_242b_phase;
     ora_uxn_opcodes_h_l3325_c41_242b_ins <= VAR_ora_uxn_opcodes_h_l3325_c41_242b_ins;
     ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3325_c41_242b_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3325_c41_242b_return_output := ora_uxn_opcodes_h_l3325_c41_242b_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c7_4354_return_output;
     VAR_ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3326_c1_90ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue := VAR_ora_uxn_opcodes_h_l3325_c41_242b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3327_c1_f54d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c7_47fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output;

     -- ora2[uxn_opcodes_h_l3326_c41_762a] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3326_c41_762a_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3326_c41_762a_phase <= VAR_ora2_uxn_opcodes_h_l3326_c41_762a_phase;
     ora2_uxn_opcodes_h_l3326_c41_762a_ins <= VAR_ora2_uxn_opcodes_h_l3326_c41_762a_ins;
     ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3326_c41_762a_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3326_c41_762a_return_output := ora2_uxn_opcodes_h_l3326_c41_762a_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output;
     VAR_eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3327_c1_f54d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue := VAR_ora2_uxn_opcodes_h_l3326_c41_762a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3328_c1_2c27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c7_7e77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output;

     -- eor[uxn_opcodes_h_l3327_c41_82c9] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3327_c41_82c9_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3327_c41_82c9_phase <= VAR_eor_uxn_opcodes_h_l3327_c41_82c9_phase;
     eor_uxn_opcodes_h_l3327_c41_82c9_ins <= VAR_eor_uxn_opcodes_h_l3327_c41_82c9_ins;
     eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3327_c41_82c9_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3327_c41_82c9_return_output := eor_uxn_opcodes_h_l3327_c41_82c9_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output;
     VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3328_c1_2c27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue := VAR_eor_uxn_opcodes_h_l3327_c41_82c9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c7_ad09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3329_c1_c816] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output;

     -- eor2[uxn_opcodes_h_l3328_c41_e62c] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3328_c41_e62c_phase <= VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_phase;
     eor2_uxn_opcodes_h_l3328_c41_e62c_ins <= VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_ins;
     eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_return_output := eor2_uxn_opcodes_h_l3328_c41_e62c_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output;
     VAR_sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3329_c1_c816_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue := VAR_eor2_uxn_opcodes_h_l3328_c41_e62c_return_output;
     -- sft[uxn_opcodes_h_l3329_c41_0430] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3329_c41_0430_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3329_c41_0430_phase <= VAR_sft_uxn_opcodes_h_l3329_c41_0430_phase;
     sft_uxn_opcodes_h_l3329_c41_0430_ins <= VAR_sft_uxn_opcodes_h_l3329_c41_0430_ins;
     sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3329_c41_0430_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3329_c41_0430_return_output := sft_uxn_opcodes_h_l3329_c41_0430_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3331_c1_c949] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3330_c1_2462] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3331_c1_c949_return_output;
     VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3330_c1_2462_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue := VAR_sft_uxn_opcodes_h_l3329_c41_0430_return_output;
     -- sft2[uxn_opcodes_h_l3330_c41_cd68] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3330_c41_cd68_phase <= VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_phase;
     sft2_uxn_opcodes_h_l3330_c41_cd68_ins <= VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_ins;
     sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_return_output := sft2_uxn_opcodes_h_l3330_c41_cd68_return_output;

     -- printf_uxn_opcodes_h_l3331_c9_e54a[uxn_opcodes_h_l3331_c9_e54a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0 <= VAR_printf_uxn_opcodes_h_l3331_c9_e54a_uxn_opcodes_h_l3331_c9_e54a_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue := VAR_sft2_uxn_opcodes_h_l3330_c41_cd68_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3330_c7_ad09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_cond;
     opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output := opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3330_c7_ad09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3329_c7_7e77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_cond;
     opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output := opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3329_c7_7e77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3328_c7_47fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_cond;
     opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output := opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3328_c7_47fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3327_c7_4354] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_cond;
     opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output := opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3327_c7_4354_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3326_c7_51b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_cond;
     opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output := opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3326_c7_51b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3325_c7_a585] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_cond;
     opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output := opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3325_c7_a585_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3324_c7_9a7c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_cond;
     opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output := opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3324_c7_9a7c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3323_c7_77de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_cond;
     opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output := opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3323_c7_77de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3322_c7_183d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_cond;
     opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output := opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3322_c7_183d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3321_c7_315a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_cond;
     opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output := opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3321_c7_315a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3320_c7_3078] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_cond;
     opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output := opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3320_c7_3078_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3319_c7_1ac2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_cond;
     opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output := opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3319_c7_1ac2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3318_c7_187f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_cond;
     opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output := opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3318_c7_187f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3317_c7_62b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_cond;
     opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output := opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3317_c7_62b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3316_c7_b7eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_cond;
     opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output := opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3316_c7_b7eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3315_c7_258a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_cond;
     opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output := opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3315_c7_258a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3314_c7_3801] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_cond;
     opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output := opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3314_c7_3801_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3313_c7_e804] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_cond;
     opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output := opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3313_c7_e804_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3312_c7_4ec2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_cond;
     opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output := opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3312_c7_4ec2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3311_c7_c49f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_cond;
     opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output := opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3311_c7_c49f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3310_c7_35f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_cond;
     opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output := opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3310_c7_35f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3309_c7_27d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_cond;
     opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output := opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3309_c7_27d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3308_c7_c42f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_cond;
     opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output := opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3308_c7_c42f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3307_c7_d253] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_cond;
     opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output := opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3307_c7_d253_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3306_c7_e9cb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_cond;
     opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output := opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3306_c7_e9cb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3305_c7_de1e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_cond;
     opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output := opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3305_c7_de1e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3304_c7_b45b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_cond;
     opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output := opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3304_c7_b45b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3303_c7_4786] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_cond;
     opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output := opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3303_c7_4786_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3302_c7_21d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_cond;
     opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output := opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3302_c7_21d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3301_c7_a23a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_cond;
     opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output := opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3301_c7_a23a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3300_c7_3a78] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_cond;
     opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output := opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3300_c7_3a78_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3299_c7_56b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_cond;
     opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output := opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3299_c7_56b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3298_c7_300c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_cond;
     opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output := opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3298_c7_300c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3297_c7_b928] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_cond;
     opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output := opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3297_c7_b928_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3296_c7_b38f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_cond;
     opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output := opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3296_c7_b38f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3295_c7_8d07] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_cond;
     opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output := opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3295_c7_8d07_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3294_c7_ed87] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_cond;
     opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output := opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3294_c7_ed87_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3293_c7_361b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_cond;
     opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output := opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3293_c7_361b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3292_c7_0aba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_cond;
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output := opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3292_c7_0aba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3291_c7_5618] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_cond;
     opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output := opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3291_c7_5618_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3290_c7_eb64] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_cond;
     opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output := opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3290_c7_eb64_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3289_c7_96f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_cond;
     opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output := opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3289_c7_96f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3288_c7_aadc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_cond;
     opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output := opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3288_c7_aadc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3287_c7_51a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_cond;
     opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output := opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3287_c7_51a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3286_c7_16e5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_cond;
     opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output := opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3286_c7_16e5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3285_c7_c993] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_cond;
     opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output := opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3285_c7_c993_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3284_c7_19b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_cond;
     opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output := opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3284_c7_19b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3283_c7_fa22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_cond;
     opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output := opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3283_c7_fa22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3282_c7_3756] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_cond;
     opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output := opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3282_c7_3756_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3281_c7_985a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_cond;
     opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output := opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3281_c7_985a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3280_c7_e03f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_cond;
     opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output := opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3280_c7_e03f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3279_c7_13b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_cond;
     opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output := opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3279_c7_13b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3278_c7_187a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_cond;
     opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output := opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3278_c7_187a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3277_c7_16bc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_cond;
     opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output := opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3277_c7_16bc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3276_c7_b9c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_cond;
     opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output := opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3276_c7_b9c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3275_c7_bc1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_cond;
     opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output := opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3275_c7_bc1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3274_c7_c23f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_cond;
     opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output := opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3274_c7_c23f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3273_c7_d998] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_cond;
     opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output := opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3273_c7_d998_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3272_c7_3322] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_cond;
     opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output := opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3272_c7_3322_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3271_c7_2510] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_cond;
     opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output := opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3271_c7_2510_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3270_c7_d5d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_cond;
     opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output := opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3270_c7_d5d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3269_c7_6e71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_cond;
     opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output := opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3269_c7_6e71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3268_c7_bde2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_cond;
     opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output := opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3268_c7_bde2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3267_c7_bf49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_cond;
     opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output := opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3267_c7_bf49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3266_c7_b3ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_cond;
     opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output := opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3266_c7_b3ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3265_c7_0fbc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_cond;
     opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output := opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3265_c7_0fbc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3264_c7_dc8c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_cond;
     opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output := opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3264_c7_dc8c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3263_c7_0fe4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_cond;
     opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output := opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3263_c7_0fe4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3262_c7_d851] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_cond;
     opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output := opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3262_c7_d851_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3261_c2_b503] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_cond;
     opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output := opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3373_c32_b299] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3373_c32_b299_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3343_l3347_l3334_DUPLICATE_fe3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3343_l3347_l3334_DUPLICATE_fe3a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3371_c33_c8a6] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3371_c33_c8a6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.vram_address;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3372_c31_e945] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3372_c31_e945_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3359_c3_93d7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3359_c3_93d7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3366_c23_5f54] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3366_c23_5f54_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.pc;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3368_c29_18cd] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3368_c29_18cd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3358_c3_2f8c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3358_c3_2f8c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3367_c33_6c5a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3367_c33_6c5a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3333_c6_2112] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3333_c6_2112_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3370_c34_592f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3370_c34_592f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l3341_c18_3b47] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3341_c18_3b47_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3344_c22_40ce] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3344_c22_40ce_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3343_c82_d572] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3343_c82_d572_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3365_c34_1720] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3365_c34_1720_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_pc_updated;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3337_l3335_DUPLICATE_a47b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3337_l3335_DUPLICATE_a47b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3369_c30_15b9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3369_c30_15b9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3361_l3357_DUPLICATE_5b6c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3361_l3357_DUPLICATE_5b6c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l3362_c3_5e13] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3362_c3_5e13_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3342_c19_f1da] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3342_c19_f1da_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3261_c2_b503_return_output.is_stack_write;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3337_l3335_DUPLICATE_a47b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3337_l3335_DUPLICATE_a47b_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l3362_c3_5e13_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3359_c3_93d7_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3333_c6_2112_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3333_c6_2112_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3343_l3347_l3334_DUPLICATE_fe3a_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3341_c18_3b47_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3341_c18_3b47_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3342_c19_f1da_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3342_c19_f1da_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3361_l3357_DUPLICATE_5b6c_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3361_l3357_DUPLICATE_5b6c_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3358_c3_2f8c_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3343_c82_d572_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3344_c22_40ce_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3344_c22_40ce_return_output;
     -- device_ram_update[uxn_opcodes_h_l3356_c26_6c84] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0 <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address0;
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_value;
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_write0_enable;
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read0_enable;
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1 <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_address1;
     device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output := device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3335_c4_f448] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3375_l3239_DUPLICATE_95cf LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3375_l3239_DUPLICATE_95cf_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3365_c34_1720_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3366_c23_5f54_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3367_c33_6c5a_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3368_c29_18cd_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3369_c30_15b9_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3370_c34_592f_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3371_c33_c8a6_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3372_c31_e945_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3373_c32_b299_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l3337_c4_b88c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3335_c4_f12e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3335_c4_f448_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3337_c4_decd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3337_c4_b88c_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l3343_c19_468c_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output;
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3347_l3334_l3343_DUPLICATE_54cc_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3375_l3239_DUPLICATE_95cf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9aee_uxn_opcodes_h_l3375_l3239_DUPLICATE_95cf_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l3356_c2_a659 := resize(VAR_device_ram_update_uxn_opcodes_h_l3356_c26_6c84_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l3356_c2_a659;
     VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse := VAR_sp0_uxn_opcodes_h_l3337_c4_decd;
     VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue := VAR_sp1_uxn_opcodes_h_l3335_c4_f12e;
     -- sp0_MUX[uxn_opcodes_h_l3334_c3_91f3] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_cond;
     sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue;
     sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output := sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output;

     -- UNARY_OP_NOT[uxn_opcodes_h_l3347_c5_a8ae] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output := UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3334_c3_91f3] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_cond;
     sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iftrue;
     sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output := sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output;

     -- Submodule level 148
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index := VAR_UNARY_OP_NOT_uxn_opcodes_h_l3347_c5_a8ae_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3334_c3_91f3_return_output;
     -- sp1_MUX[uxn_opcodes_h_l3333_c2_b6a7] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond;
     sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue;
     sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output := sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3333_c2_b6a7] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_cond;
     sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iftrue;
     sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output := sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;
     VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3333_c2_b6a7_return_output;
     -- MUX[uxn_opcodes_h_l3343_c19_468c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3343_c19_468c_cond <= VAR_MUX_uxn_opcodes_h_l3343_c19_468c_cond;
     MUX_uxn_opcodes_h_l3343_c19_468c_iftrue <= VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iftrue;
     MUX_uxn_opcodes_h_l3343_c19_468c_iffalse <= VAR_MUX_uxn_opcodes_h_l3343_c19_468c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3343_c19_468c_return_output := MUX_uxn_opcodes_h_l3343_c19_468c_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left := VAR_MUX_uxn_opcodes_h_l3343_c19_468c_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3343_c19_0937] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3343_c2_291a := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3343_c19_0937_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3343_c2_291a;
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0 := resize(VAR_stack_address_uxn_opcodes_h_l3343_c2_291a, 8);
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1 := resize(VAR_stack_address_uxn_opcodes_h_l3343_c2_291a, 8);
     -- stack_ram_update[uxn_opcodes_h_l3346_c21_4399] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_stack_index;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0 <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address0;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_value;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_write0_enable;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read0_enable;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1 <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_address1;
     stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_read1_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output := stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l3346_c2_c9e2 := resize(VAR_stack_ram_update_uxn_opcodes_h_l3346_c21_4399_return_output, 8);
     REG_VAR_stack_read_value := VAR_stack_read_value_uxn_opcodes_h_l3346_c2_c9e2;
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
