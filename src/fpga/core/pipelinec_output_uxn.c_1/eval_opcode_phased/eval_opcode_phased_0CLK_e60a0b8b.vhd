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
-- Submodules: 375
entity eval_opcode_phased_0CLK_e60a0b8b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_e60a0b8b;
architecture arch of eval_opcode_phased_0CLK_e60a0b8b is
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
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 8),
stack_value => to_unsigned(0, 8),
is_ram_write => to_unsigned(0, 1),
ram_addr => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
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
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(11 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_stack_write : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(15 downto 0);
signal REG_COMB_stack_write_value : unsigned(7 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l3131_c10_04f7]
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3131_c10_4ce6]
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3131_c41_e6c0]
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3131_c57_4c87]
signal CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3131_c10_4926]
signal MUX_uxn_opcodes_h_l3131_c10_4926_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_4926_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_4926_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_4926_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3132_c18_c314]
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3132_c18_9d16]
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3132_c18_3ab0]
signal MUX_uxn_opcodes_h_l3132_c18_3ab0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3134_c2_fcd3[uxn_opcodes_h_l3134_c2_fcd3]
signal printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3136_c6_23ab]
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_0dfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3136_c2_3048]
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_912d]
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_6d1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_553b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3137_c7_0dfc]
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3137_c41_f934]
signal jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_f934_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_f934_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_f934_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_0b2b]
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_b434]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_c36d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3138_c7_553b]
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3138_c41_9b12]
signal jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_9b12_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_9b12_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_9b12_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_4069]
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_b934]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_52eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3139_c7_c36d]
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3139_c41_6030]
signal jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_6030_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_6030_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_6030_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_9a82]
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_684c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_712e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3140_c7_52eb]
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3140_c41_2a90]
signal lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_2a90_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_2a90_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_2a90_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_fccc]
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_2eaf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_6bda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3141_c7_712e]
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3141_c41_41e6]
signal lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_41e6_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_41e6_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_41e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_73cf]
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_cff4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_65f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3142_c7_6bda]
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3142_c41_233d]
signal lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_233d_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_233d_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_233d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_6166]
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_0334]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_f35a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3143_c7_65f3]
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3143_c41_fd7a]
signal lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_fd7a_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_fd7a_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_bc43]
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_d294]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_41ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3144_c7_f35a]
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3144_c41_89ae]
signal inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_89ae_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_89ae_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_89ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_6bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_5f7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_4c97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3145_c7_41ee]
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3145_c41_5e8d]
signal inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_5e8d_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_5e8d_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_8b9b]
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_703b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_4eb3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3146_c7_4c97]
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3146_c41_05f1]
signal pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_05f1_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_05f1_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_05f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_0575]
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_b5fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_ac26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3147_c7_4eb3]
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3147_c41_7136]
signal pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_7136_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_7136_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_7136_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_0ddd]
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_7762]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_0d75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3148_c7_ac26]
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3148_c41_348a]
signal nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_348a_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_348a_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_348a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_8c09]
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_c313]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_4ec7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3149_c7_0d75]
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3149_c41_7b9b]
signal nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_7b9b_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_7b9b_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_a46b]
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_416e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_8d06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3150_c7_4ec7]
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3150_c41_cee9]
signal swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_cee9_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_cee9_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_cee9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_d52b]
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_1b0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_36b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3151_c7_8d06]
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3151_c41_e341]
signal swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_e341_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_e341_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_e341_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_5fc2]
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_4a82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_de35]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3152_c7_36b8]
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3152_c41_5c44]
signal rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_5c44_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_5c44_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_5c44_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_437e]
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_d3eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_0e82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3153_c7_de35]
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3153_c41_6d40]
signal rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_6d40_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_6d40_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_6d40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_7464]
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_9982]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_88f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3154_c7_0e82]
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3154_c41_59e1]
signal dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_59e1_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_59e1_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_59e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_1558]
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_8fa2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_6747]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3155_c7_88f5]
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3155_c41_7734]
signal dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_7734_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_7734_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_7734_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_9e25]
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_ec04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_28ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3156_c7_6747]
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3156_c41_8e50]
signal ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_8e50_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_8e50_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_8e50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_1013]
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_ad76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_9734]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3157_c7_28ab]
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3157_c41_beec]
signal ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_beec_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_beec_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_beec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_132f]
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_c6e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_6e7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3158_c7_9734]
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3158_c41_4e70]
signal equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_4e70_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_4e70_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_4e70_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_c8ab]
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_6e5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_10d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3159_c7_6e7d]
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3159_c41_8610]
signal equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_8610_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_8610_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_8610_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_0845]
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_a936]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_b514]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3160_c7_10d1]
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3160_c41_d41d]
signal neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_d41d_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_d41d_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_d41d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_e035]
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_1808]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_8dc4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3161_c7_b514]
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3161_c41_befb]
signal neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_befb_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_befb_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_befb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_4ee2]
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_df7b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_6155]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3162_c7_8dc4]
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3162_c41_d216]
signal gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_d216_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_d216_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_d216_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_f8c1]
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_a876]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_f64b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3163_c7_6155]
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3163_c41_21c2]
signal gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_21c2_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_21c2_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_21c2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_4761]
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_e89b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_b1ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3164_c7_f64b]
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3164_c41_b541]
signal lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_b541_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_b541_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_b541_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_0ac8]
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_d7ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_ac7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3165_c7_b1ed]
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3165_c41_60bd]
signal lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_60bd_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_60bd_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_60bd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_941e]
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_309f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_4cd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3166_c7_ac7a]
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3166_c41_432b]
signal jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_432b_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_432b_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_432b_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_432b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_38df]
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_de51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_7ec7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3167_c7_4cd0]
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3167_c41_4c39]
signal jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4c39_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4c39_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_e6d5]
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_c0fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_0817]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3168_c7_7ec7]
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3168_c41_1aa7]
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_8558]
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_580b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_2c4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3169_c7_0817]
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3169_c41_0674]
signal jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_0674_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_0674_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_0674_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_60ce]
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_8864]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_acfd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3170_c7_2c4f]
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3170_c41_8077]
signal jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_8077_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_8077_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_8077_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_8077_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_5309]
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_291d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_af9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3171_c7_acfd]
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3171_c41_0260]
signal jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_0260_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_0260_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_0260_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_0260_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_d80b]
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_6b03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_d9fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3172_c7_af9d]
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3172_c41_27a8]
signal sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_27a8_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_27a8_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_27a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_b230]
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_df0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_fbae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3173_c7_d9fe]
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3173_c41_1fae]
signal sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_1fae_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_1fae_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_1fae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_de38]
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_c6ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_587b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3174_c7_fbae]
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3174_c41_0347]
signal ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_0347_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_0347_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_0347_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_56bb]
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_c464]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_2c62]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3175_c7_587b]
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3175_c41_9421]
signal ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_9421_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_9421_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_9421_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_69cb]
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_715e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_edca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3176_c7_2c62]
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3176_c41_e601]
signal stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_e601_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_e601_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_e601_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_c420]
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_0d9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_7f56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3177_c7_edca]
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3177_c41_2d38]
signal stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_2d38_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_2d38_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_2d38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_796e]
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_787c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_edd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3178_c7_7f56]
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3178_c41_4867]
signal ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_4867_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_aaa0]
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_c64c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_fb0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3179_c7_edd0]
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3179_c41_11ef]
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_00ec]
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_2bcb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_c3af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3180_c7_fb0e]
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3180_c41_4341]
signal str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_4341_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_4341_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_4341_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_4341_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_9249]
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_fd0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_346c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3181_c7_c3af]
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3181_c41_e78c]
signal str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_e78c_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_e78c_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_e78c_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_e78c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_4b08]
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_ea73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_9cb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3182_c7_346c]
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3182_c41_13cc]
signal lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_13cc_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_13cc_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_13cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_dad9]
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_1f59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_7d18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3183_c7_9cb1]
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3183_c41_6318]
signal lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_6318_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_6318_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_6318_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_d6be]
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_0279]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_7a52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3184_c7_7d18]
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3184_c41_c1d7]
signal sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_c1d7_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_c1d7_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_c1d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_dbfc]
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_c61d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_cfae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3185_c7_7a52]
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3185_c41_05be]
signal sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_05be_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_05be_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_05be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_eedf]
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_5c5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_545c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3186_c7_cfae]
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3186_c41_29b6]
signal dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_29b6_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_29b6_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_29b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_4b1c]
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_74e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_7126]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3187_c7_545c]
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3187_c41_27e8]
signal dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_27e8_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_27e8_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_27e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_8c60]
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_f3c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_3e5c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3188_c7_7126]
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3188_c41_20c6]
signal deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_20c6_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_20c6_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_20c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_2c7b]
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_d218]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_96cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3189_c7_3e5c]
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3189_c41_1f8a]
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_168c]
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_2a81]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_ce7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3190_c7_96cd]
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3190_c41_5e7c]
signal add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3190_c41_5e7c_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_5e7c_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_5e7c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_a87e]
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_d304]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_f033]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3191_c7_ce7f]
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3191_c41_12ae]
signal add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_12ae_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_12ae_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_12ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_fe0e]
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_3c41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_d945]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3192_c7_f033]
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3192_c41_a33b]
signal sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_a33b_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_a33b_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_a33b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_5877]
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_468d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_c499]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3193_c7_d945]
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3193_c41_bbca]
signal sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_bbca_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_bbca_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_bbca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_7ed5]
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_05c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_cbb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3194_c7_c499]
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3194_c41_0a70]
signal mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_0a70_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_0a70_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_0a70_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_656e]
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_1ba3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_2fa6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3195_c7_cbb1]
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3195_c41_6ebf]
signal mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_6ebf_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_6ebf_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_b9b1]
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_7f5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_b47d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3196_c7_2fa6]
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3196_c41_5ae9]
signal div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3196_c41_5ae9_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_5ae9_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_5ae9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_26a9]
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_2c4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_859e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3197_c7_b47d]
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3197_c41_90a2]
signal div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_90a2_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_90a2_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_90a2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_51de]
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_002f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_5e33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3198_c7_859e]
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3198_c41_954d]
signal and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3198_c41_954d_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_954d_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_954d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_c442]
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_1116]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_0745]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3199_c7_5e33]
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3199_c41_f60d]
signal and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_f60d_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_f60d_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_f60d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_094b]
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_d954]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_471a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3200_c7_0745]
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3200_c41_0fe6]
signal ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_0fe6_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_0fe6_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_0fe6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_63a2]
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_83c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c7_d06a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3201_c7_471a]
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3201_c41_dfcc]
signal ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_dfcc_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_dfcc_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3202_c11_6d96]
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_9415]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c7_c8f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3202_c7_d06a]
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3202_c41_a806]
signal eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_a806_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_a806_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_a806_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3203_c11_639e]
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c1_a1d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c7_99a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3203_c7_c8f3]
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3203_c41_8c79]
signal eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_8c79_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_8c79_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_8c79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_b997]
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c1_857f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c7_c89b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3204_c7_99a0]
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3204_c41_7d49]
signal sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_7d49_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_7d49_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_7d49_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_626a]
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c1_2c23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3206_c1_17ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3205_c7_c89b]
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3205_c41_4dea]
signal sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_4dea_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_4dea_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_4dea_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3206_c9_693c[uxn_opcodes_h_l3206_c9_693c]
signal printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0 : unsigned(31 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3208_c2_34fe]
signal sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3208_c2_34fe]
signal sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3209_c3_3c0d]
signal sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3209_c3_3c0d]
signal sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3210_c4_b77f]
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3212_c4_b581]
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3217_c19_88c9]
signal MUX_uxn_opcodes_h_l3217_c19_88c9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_88c9_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3217_c19_311f]
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l3218_c20_54cd]
signal MUX_uxn_opcodes_h_l3218_c20_54cd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_54cd_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3218_c2_c879]
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output : unsigned(16 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3221_c21_0aea]
signal stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address : unsigned(15 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l3227_c26_f15c]
signal device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71( ref_toks_0 : unsigned;
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
      base.is_ram_write := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.vram_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7
BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left,
BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right,
BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6
BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left,
BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right,
BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0
BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left,
BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right,
BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87
CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x,
CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output);

-- MUX_uxn_opcodes_h_l3131_c10_4926
MUX_uxn_opcodes_h_l3131_c10_4926 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3131_c10_4926_cond,
MUX_uxn_opcodes_h_l3131_c10_4926_iftrue,
MUX_uxn_opcodes_h_l3131_c10_4926_iffalse,
MUX_uxn_opcodes_h_l3131_c10_4926_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314
BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left,
BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right,
BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16
BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left,
BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right,
BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output);

-- MUX_uxn_opcodes_h_l3132_c18_3ab0
MUX_uxn_opcodes_h_l3132_c18_3ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3132_c18_3ab0_cond,
MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue,
MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse,
MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output);

-- printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3
printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3 : entity work.printf_uxn_opcodes_h_l3134_c2_fcd3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0,
printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1,
printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left,
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right,
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3136_c2_3048
opc_result_MUX_uxn_opcodes_h_l3136_c2_3048 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond,
opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue,
opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse,
opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc
opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond,
opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output);

-- jci_uxn_opcodes_h_l3137_c41_f934
jci_uxn_opcodes_h_l3137_c41_f934 : entity work.jci_0CLK_5110df32 port map (
clk,
jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3137_c41_f934_phase,
jci_uxn_opcodes_h_l3137_c41_f934_pc,
jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read,
jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read,
jci_uxn_opcodes_h_l3137_c41_f934_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3138_c7_553b
opc_result_MUX_uxn_opcodes_h_l3138_c7_553b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond,
opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output);

-- jmi_uxn_opcodes_h_l3138_c41_9b12
jmi_uxn_opcodes_h_l3138_c41_9b12 : entity work.jmi_0CLK_3045e391 port map (
clk,
jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3138_c41_9b12_phase,
jmi_uxn_opcodes_h_l3138_c41_9b12_pc,
jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read,
jmi_uxn_opcodes_h_l3138_c41_9b12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d
opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond,
opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output);

-- jsi_uxn_opcodes_h_l3139_c41_6030
jsi_uxn_opcodes_h_l3139_c41_6030 : entity work.jsi_0CLK_cf70ec0f port map (
clk,
jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3139_c41_6030_phase,
jsi_uxn_opcodes_h_l3139_c41_6030_pc,
jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read,
jsi_uxn_opcodes_h_l3139_c41_6030_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb
opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond,
opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output);

-- lit_uxn_opcodes_h_l3140_c41_2a90
lit_uxn_opcodes_h_l3140_c41_2a90 : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3140_c41_2a90_phase,
lit_uxn_opcodes_h_l3140_c41_2a90_pc,
lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read,
lit_uxn_opcodes_h_l3140_c41_2a90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3141_c7_712e
opc_result_MUX_uxn_opcodes_h_l3141_c7_712e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond,
opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output);

-- lit2_uxn_opcodes_h_l3141_c41_41e6
lit2_uxn_opcodes_h_l3141_c41_41e6 : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3141_c41_41e6_phase,
lit2_uxn_opcodes_h_l3141_c41_41e6_pc,
lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read,
lit2_uxn_opcodes_h_l3141_c41_41e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda
opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond,
opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue,
opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse,
opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output);

-- lit_uxn_opcodes_h_l3142_c41_233d
lit_uxn_opcodes_h_l3142_c41_233d : entity work.lit_0CLK_e573058b port map (
clk,
lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3142_c41_233d_phase,
lit_uxn_opcodes_h_l3142_c41_233d_pc,
lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read,
lit_uxn_opcodes_h_l3142_c41_233d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3
opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond,
opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output);

-- lit2_uxn_opcodes_h_l3143_c41_fd7a
lit2_uxn_opcodes_h_l3143_c41_fd7a : entity work.lit2_0CLK_a45e5d62 port map (
clk,
lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3143_c41_fd7a_phase,
lit2_uxn_opcodes_h_l3143_c41_fd7a_pc,
lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read,
lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a
opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond,
opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output);

-- inc_uxn_opcodes_h_l3144_c41_89ae
inc_uxn_opcodes_h_l3144_c41_89ae : entity work.inc_0CLK_3045e391 port map (
clk,
inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3144_c41_89ae_phase,
inc_uxn_opcodes_h_l3144_c41_89ae_ins,
inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read,
inc_uxn_opcodes_h_l3144_c41_89ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee
opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond,
opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output);

-- inc2_uxn_opcodes_h_l3145_c41_5e8d
inc2_uxn_opcodes_h_l3145_c41_5e8d : entity work.inc2_0CLK_50a1b8d0 port map (
clk,
inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3145_c41_5e8d_phase,
inc2_uxn_opcodes_h_l3145_c41_5e8d_ins,
inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read,
inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97
opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond,
opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue,
opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse,
opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output);

-- pop_uxn_opcodes_h_l3146_c41_05f1
pop_uxn_opcodes_h_l3146_c41_05f1 : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3146_c41_05f1_phase,
pop_uxn_opcodes_h_l3146_c41_05f1_ins,
pop_uxn_opcodes_h_l3146_c41_05f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3
opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond,
opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output);

-- pop2_uxn_opcodes_h_l3147_c41_7136
pop2_uxn_opcodes_h_l3147_c41_7136 : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3147_c41_7136_phase,
pop2_uxn_opcodes_h_l3147_c41_7136_ins,
pop2_uxn_opcodes_h_l3147_c41_7136_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26
opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond,
opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue,
opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse,
opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output);

-- nip_uxn_opcodes_h_l3148_c41_348a
nip_uxn_opcodes_h_l3148_c41_348a : entity work.nip_0CLK_46011230 port map (
clk,
nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3148_c41_348a_phase,
nip_uxn_opcodes_h_l3148_c41_348a_ins,
nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read,
nip_uxn_opcodes_h_l3148_c41_348a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75
opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond,
opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue,
opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse,
opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output);

-- nip2_uxn_opcodes_h_l3149_c41_7b9b
nip2_uxn_opcodes_h_l3149_c41_7b9b : entity work.nip2_0CLK_7c2e709f port map (
clk,
nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3149_c41_7b9b_phase,
nip2_uxn_opcodes_h_l3149_c41_7b9b_ins,
nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read,
nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7
opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond,
opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output);

-- swp_uxn_opcodes_h_l3150_c41_cee9
swp_uxn_opcodes_h_l3150_c41_cee9 : entity work.swp_0CLK_9ff5fd8d port map (
clk,
swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3150_c41_cee9_phase,
swp_uxn_opcodes_h_l3150_c41_cee9_ins,
swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read,
swp_uxn_opcodes_h_l3150_c41_cee9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06
opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond,
opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue,
opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse,
opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output);

-- swp2_uxn_opcodes_h_l3151_c41_e341
swp2_uxn_opcodes_h_l3151_c41_e341 : entity work.swp2_0CLK_37dbf2f3 port map (
clk,
swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3151_c41_e341_phase,
swp2_uxn_opcodes_h_l3151_c41_e341_ins,
swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read,
swp2_uxn_opcodes_h_l3151_c41_e341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8
opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond,
opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output);

-- rot_uxn_opcodes_h_l3152_c41_5c44
rot_uxn_opcodes_h_l3152_c41_5c44 : entity work.rot_0CLK_bbbe252c port map (
clk,
rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3152_c41_5c44_phase,
rot_uxn_opcodes_h_l3152_c41_5c44_ins,
rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read,
rot_uxn_opcodes_h_l3152_c41_5c44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3153_c7_de35
opc_result_MUX_uxn_opcodes_h_l3153_c7_de35 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond,
opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue,
opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse,
opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output);

-- rot2_uxn_opcodes_h_l3153_c41_6d40
rot2_uxn_opcodes_h_l3153_c41_6d40 : entity work.rot2_0CLK_37f20a85 port map (
clk,
rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3153_c41_6d40_phase,
rot2_uxn_opcodes_h_l3153_c41_6d40_ins,
rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read,
rot2_uxn_opcodes_h_l3153_c41_6d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82
opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond,
opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue,
opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse,
opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output);

-- dup_uxn_opcodes_h_l3154_c41_59e1
dup_uxn_opcodes_h_l3154_c41_59e1 : entity work.dup_0CLK_66ba3dc0 port map (
clk,
dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3154_c41_59e1_phase,
dup_uxn_opcodes_h_l3154_c41_59e1_ins,
dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read,
dup_uxn_opcodes_h_l3154_c41_59e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5
opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond,
opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output);

-- dup2_uxn_opcodes_h_l3155_c41_7734
dup2_uxn_opcodes_h_l3155_c41_7734 : entity work.dup2_0CLK_ad7496ca port map (
clk,
dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3155_c41_7734_phase,
dup2_uxn_opcodes_h_l3155_c41_7734_ins,
dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read,
dup2_uxn_opcodes_h_l3155_c41_7734_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3156_c7_6747
opc_result_MUX_uxn_opcodes_h_l3156_c7_6747 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond,
opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue,
opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse,
opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output);

-- ovr_uxn_opcodes_h_l3156_c41_8e50
ovr_uxn_opcodes_h_l3156_c41_8e50 : entity work.ovr_0CLK_67fe881f port map (
clk,
ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3156_c41_8e50_phase,
ovr_uxn_opcodes_h_l3156_c41_8e50_ins,
ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read,
ovr_uxn_opcodes_h_l3156_c41_8e50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab
opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond,
opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output);

-- ovr2_uxn_opcodes_h_l3157_c41_beec
ovr2_uxn_opcodes_h_l3157_c41_beec : entity work.ovr2_0CLK_9fd731de port map (
clk,
ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3157_c41_beec_phase,
ovr2_uxn_opcodes_h_l3157_c41_beec_ins,
ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read,
ovr2_uxn_opcodes_h_l3157_c41_beec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3158_c7_9734
opc_result_MUX_uxn_opcodes_h_l3158_c7_9734 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond,
opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue,
opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse,
opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output);

-- equ_uxn_opcodes_h_l3158_c41_4e70
equ_uxn_opcodes_h_l3158_c41_4e70 : entity work.equ_0CLK_1c7b7172 port map (
clk,
equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3158_c41_4e70_phase,
equ_uxn_opcodes_h_l3158_c41_4e70_ins,
equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read,
equ_uxn_opcodes_h_l3158_c41_4e70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d
opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond,
opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output);

-- equ2_uxn_opcodes_h_l3159_c41_8610
equ2_uxn_opcodes_h_l3159_c41_8610 : entity work.equ2_0CLK_5ccafc54 port map (
clk,
equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3159_c41_8610_phase,
equ2_uxn_opcodes_h_l3159_c41_8610_ins,
equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read,
equ2_uxn_opcodes_h_l3159_c41_8610_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1
opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond,
opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output);

-- neq_uxn_opcodes_h_l3160_c41_d41d
neq_uxn_opcodes_h_l3160_c41_d41d : entity work.neq_0CLK_1c7b7172 port map (
clk,
neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3160_c41_d41d_phase,
neq_uxn_opcodes_h_l3160_c41_d41d_ins,
neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read,
neq_uxn_opcodes_h_l3160_c41_d41d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3161_c7_b514
opc_result_MUX_uxn_opcodes_h_l3161_c7_b514 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond,
opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue,
opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse,
opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output);

-- neq2_uxn_opcodes_h_l3161_c41_befb
neq2_uxn_opcodes_h_l3161_c41_befb : entity work.neq2_0CLK_5ccafc54 port map (
clk,
neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3161_c41_befb_phase,
neq2_uxn_opcodes_h_l3161_c41_befb_ins,
neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read,
neq2_uxn_opcodes_h_l3161_c41_befb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4
opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond,
opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output);

-- gth_uxn_opcodes_h_l3162_c41_d216
gth_uxn_opcodes_h_l3162_c41_d216 : entity work.gth_0CLK_1c7b7172 port map (
clk,
gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3162_c41_d216_phase,
gth_uxn_opcodes_h_l3162_c41_d216_ins,
gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read,
gth_uxn_opcodes_h_l3162_c41_d216_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3163_c7_6155
opc_result_MUX_uxn_opcodes_h_l3163_c7_6155 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond,
opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue,
opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse,
opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output);

-- gth2_uxn_opcodes_h_l3163_c41_21c2
gth2_uxn_opcodes_h_l3163_c41_21c2 : entity work.gth2_0CLK_5ccafc54 port map (
clk,
gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3163_c41_21c2_phase,
gth2_uxn_opcodes_h_l3163_c41_21c2_ins,
gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read,
gth2_uxn_opcodes_h_l3163_c41_21c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b
opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond,
opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output);

-- lth_uxn_opcodes_h_l3164_c41_b541
lth_uxn_opcodes_h_l3164_c41_b541 : entity work.lth_0CLK_1c7b7172 port map (
clk,
lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3164_c41_b541_phase,
lth_uxn_opcodes_h_l3164_c41_b541_ins,
lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read,
lth_uxn_opcodes_h_l3164_c41_b541_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed
opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond,
opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue,
opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse,
opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output);

-- lth2_uxn_opcodes_h_l3165_c41_60bd
lth2_uxn_opcodes_h_l3165_c41_60bd : entity work.lth2_0CLK_5ccafc54 port map (
clk,
lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3165_c41_60bd_phase,
lth2_uxn_opcodes_h_l3165_c41_60bd_ins,
lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read,
lth2_uxn_opcodes_h_l3165_c41_60bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a
opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond,
opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output);

-- jmp_uxn_opcodes_h_l3166_c41_432b
jmp_uxn_opcodes_h_l3166_c41_432b : entity work.jmp_0CLK_e573058b port map (
clk,
jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3166_c41_432b_phase,
jmp_uxn_opcodes_h_l3166_c41_432b_ins,
jmp_uxn_opcodes_h_l3166_c41_432b_pc,
jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read,
jmp_uxn_opcodes_h_l3166_c41_432b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0
opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output);

-- jmp2_uxn_opcodes_h_l3167_c41_4c39
jmp2_uxn_opcodes_h_l3167_c41_4c39 : entity work.jmp2_0CLK_9101a1df port map (
clk,
jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3167_c41_4c39_phase,
jmp2_uxn_opcodes_h_l3167_c41_4c39_ins,
jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read,
jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7
opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond,
opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output);

-- jcn_uxn_opcodes_h_l3168_c41_1aa7
jcn_uxn_opcodes_h_l3168_c41_1aa7 : entity work.jcn_0CLK_df07acae port map (
clk,
jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3168_c41_1aa7_phase,
jcn_uxn_opcodes_h_l3168_c41_1aa7_ins,
jcn_uxn_opcodes_h_l3168_c41_1aa7_pc,
jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read,
jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3169_c7_0817
opc_result_MUX_uxn_opcodes_h_l3169_c7_0817 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond,
opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue,
opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse,
opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output);

-- jcn2_uxn_opcodes_h_l3169_c41_0674
jcn2_uxn_opcodes_h_l3169_c41_0674 : entity work.jcn2_0CLK_c26dda62 port map (
clk,
jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3169_c41_0674_phase,
jcn2_uxn_opcodes_h_l3169_c41_0674_ins,
jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read,
jcn2_uxn_opcodes_h_l3169_c41_0674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f
opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond,
opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output);

-- jsr_uxn_opcodes_h_l3170_c41_8077
jsr_uxn_opcodes_h_l3170_c41_8077 : entity work.jsr_0CLK_6c9b19c4 port map (
clk,
jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3170_c41_8077_phase,
jsr_uxn_opcodes_h_l3170_c41_8077_ins,
jsr_uxn_opcodes_h_l3170_c41_8077_pc,
jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read,
jsr_uxn_opcodes_h_l3170_c41_8077_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd
opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond,
opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output);

-- jsr2_uxn_opcodes_h_l3171_c41_0260
jsr2_uxn_opcodes_h_l3171_c41_0260 : entity work.jsr2_0CLK_e5fcbde3 port map (
clk,
jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3171_c41_0260_phase,
jsr2_uxn_opcodes_h_l3171_c41_0260_ins,
jsr2_uxn_opcodes_h_l3171_c41_0260_pc,
jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read,
jsr2_uxn_opcodes_h_l3171_c41_0260_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d
opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond,
opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output);

-- sth_uxn_opcodes_h_l3172_c41_27a8
sth_uxn_opcodes_h_l3172_c41_27a8 : entity work.sth_0CLK_d6c995e8 port map (
clk,
sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3172_c41_27a8_phase,
sth_uxn_opcodes_h_l3172_c41_27a8_ins,
sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read,
sth_uxn_opcodes_h_l3172_c41_27a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe
opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond,
opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue,
opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse,
opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output);

-- sth2_uxn_opcodes_h_l3173_c41_1fae
sth2_uxn_opcodes_h_l3173_c41_1fae : entity work.sth2_0CLK_f1c92b33 port map (
clk,
sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3173_c41_1fae_phase,
sth2_uxn_opcodes_h_l3173_c41_1fae_ins,
sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read,
sth2_uxn_opcodes_h_l3173_c41_1fae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae
opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond,
opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue,
opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse,
opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output);

-- ldz_uxn_opcodes_h_l3174_c41_0347
ldz_uxn_opcodes_h_l3174_c41_0347 : entity work.ldz_0CLK_df07acae port map (
clk,
ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3174_c41_0347_phase,
ldz_uxn_opcodes_h_l3174_c41_0347_ins,
ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read,
ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read,
ldz_uxn_opcodes_h_l3174_c41_0347_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3175_c7_587b
opc_result_MUX_uxn_opcodes_h_l3175_c7_587b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond,
opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output);

-- ldz2_uxn_opcodes_h_l3175_c41_9421
ldz2_uxn_opcodes_h_l3175_c41_9421 : entity work.ldz2_0CLK_77d0ca3d port map (
clk,
ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3175_c41_9421_phase,
ldz2_uxn_opcodes_h_l3175_c41_9421_ins,
ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read,
ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read,
ldz2_uxn_opcodes_h_l3175_c41_9421_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62
opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse,
opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output);

-- stz_uxn_opcodes_h_l3176_c41_e601
stz_uxn_opcodes_h_l3176_c41_e601 : entity work.stz_0CLK_3220bbf1 port map (
clk,
stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3176_c41_e601_phase,
stz_uxn_opcodes_h_l3176_c41_e601_ins,
stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read,
stz_uxn_opcodes_h_l3176_c41_e601_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3177_c7_edca
opc_result_MUX_uxn_opcodes_h_l3177_c7_edca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond,
opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue,
opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse,
opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output);

-- stz2_uxn_opcodes_h_l3177_c41_2d38
stz2_uxn_opcodes_h_l3177_c41_2d38 : entity work.stz2_0CLK_e6256695 port map (
clk,
stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3177_c41_2d38_phase,
stz2_uxn_opcodes_h_l3177_c41_2d38_ins,
stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read,
stz2_uxn_opcodes_h_l3177_c41_2d38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56
opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond,
opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue,
opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse,
opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output);

-- ldr_uxn_opcodes_h_l3178_c41_4867
ldr_uxn_opcodes_h_l3178_c41_4867 : entity work.ldr_0CLK_3d5a5eea port map (
clk,
ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3178_c41_4867_phase,
ldr_uxn_opcodes_h_l3178_c41_4867_ins,
ldr_uxn_opcodes_h_l3178_c41_4867_pc,
ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read,
ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read,
ldr_uxn_opcodes_h_l3178_c41_4867_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0
opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond,
opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output);

-- ldr2_uxn_opcodes_h_l3179_c41_11ef
ldr2_uxn_opcodes_h_l3179_c41_11ef : entity work.ldr2_0CLK_77d0ca3d port map (
clk,
ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3179_c41_11ef_phase,
ldr2_uxn_opcodes_h_l3179_c41_11ef_ins,
ldr2_uxn_opcodes_h_l3179_c41_11ef_pc,
ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read,
ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read,
ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e
opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond,
opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output);

-- str1_uxn_opcodes_h_l3180_c41_4341
str1_uxn_opcodes_h_l3180_c41_4341 : entity work.str1_0CLK_1c7b7172 port map (
clk,
str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3180_c41_4341_phase,
str1_uxn_opcodes_h_l3180_c41_4341_ins,
str1_uxn_opcodes_h_l3180_c41_4341_pc,
str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read,
str1_uxn_opcodes_h_l3180_c41_4341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af
opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond,
opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue,
opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse,
opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output);

-- str2_uxn_opcodes_h_l3181_c41_e78c
str2_uxn_opcodes_h_l3181_c41_e78c : entity work.str2_0CLK_e6256695 port map (
clk,
str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3181_c41_e78c_phase,
str2_uxn_opcodes_h_l3181_c41_e78c_ins,
str2_uxn_opcodes_h_l3181_c41_e78c_pc,
str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read,
str2_uxn_opcodes_h_l3181_c41_e78c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3182_c7_346c
opc_result_MUX_uxn_opcodes_h_l3182_c7_346c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond,
opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output);

-- lda_uxn_opcodes_h_l3182_c41_13cc
lda_uxn_opcodes_h_l3182_c41_13cc : entity work.lda_0CLK_c26dda62 port map (
clk,
lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3182_c41_13cc_phase,
lda_uxn_opcodes_h_l3182_c41_13cc_ins,
lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read,
lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read,
lda_uxn_opcodes_h_l3182_c41_13cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1
opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond,
opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output);

-- lda2_uxn_opcodes_h_l3183_c41_6318
lda2_uxn_opcodes_h_l3183_c41_6318 : entity work.lda2_0CLK_2b0015ee port map (
clk,
lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3183_c41_6318_phase,
lda2_uxn_opcodes_h_l3183_c41_6318_ins,
lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read,
lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read,
lda2_uxn_opcodes_h_l3183_c41_6318_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18
opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond,
opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue,
opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse,
opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output);

-- sta_uxn_opcodes_h_l3184_c41_c1d7
sta_uxn_opcodes_h_l3184_c41_c1d7 : entity work.sta_0CLK_f1f3c8fd port map (
clk,
sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3184_c41_c1d7_phase,
sta_uxn_opcodes_h_l3184_c41_c1d7_ins,
sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read,
sta_uxn_opcodes_h_l3184_c41_c1d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52
opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond,
opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue,
opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse,
opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output);

-- sta2_uxn_opcodes_h_l3185_c41_05be
sta2_uxn_opcodes_h_l3185_c41_05be : entity work.sta2_0CLK_83f22136 port map (
clk,
sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3185_c41_05be_phase,
sta2_uxn_opcodes_h_l3185_c41_05be_ins,
sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read,
sta2_uxn_opcodes_h_l3185_c41_05be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae
opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond,
opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue,
opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse,
opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output);

-- dei_uxn_opcodes_h_l3186_c41_29b6
dei_uxn_opcodes_h_l3186_c41_29b6 : entity work.dei_0CLK_97c0477d port map (
clk,
dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3186_c41_29b6_phase,
dei_uxn_opcodes_h_l3186_c41_29b6_ins,
dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read,
dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read,
dei_uxn_opcodes_h_l3186_c41_29b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3187_c7_545c
opc_result_MUX_uxn_opcodes_h_l3187_c7_545c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond,
opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output);

-- dei2_uxn_opcodes_h_l3187_c41_27e8
dei2_uxn_opcodes_h_l3187_c41_27e8 : entity work.dei2_0CLK_b333a2e2 port map (
clk,
dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3187_c41_27e8_phase,
dei2_uxn_opcodes_h_l3187_c41_27e8_ins,
dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read,
dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read,
dei2_uxn_opcodes_h_l3187_c41_27e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3188_c7_7126
opc_result_MUX_uxn_opcodes_h_l3188_c7_7126 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond,
opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue,
opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse,
opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output);

-- deo_uxn_opcodes_h_l3188_c41_20c6
deo_uxn_opcodes_h_l3188_c41_20c6 : entity work.deo_0CLK_da0d4bc5 port map (
clk,
deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3188_c41_20c6_phase,
deo_uxn_opcodes_h_l3188_c41_20c6_ins,
deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read,
deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read,
deo_uxn_opcodes_h_l3188_c41_20c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c
opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond,
opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output);

-- deo2_uxn_opcodes_h_l3189_c41_1f8a
deo2_uxn_opcodes_h_l3189_c41_1f8a : entity work.deo2_0CLK_bb5893d2 port map (
clk,
deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3189_c41_1f8a_phase,
deo2_uxn_opcodes_h_l3189_c41_1f8a_ins,
deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read,
deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read,
deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd
opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond,
opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output);

-- add_uxn_opcodes_h_l3190_c41_5e7c
add_uxn_opcodes_h_l3190_c41_5e7c : entity work.add_0CLK_3220bbf1 port map (
clk,
add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE,
add_uxn_opcodes_h_l3190_c41_5e7c_phase,
add_uxn_opcodes_h_l3190_c41_5e7c_ins,
add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read,
add_uxn_opcodes_h_l3190_c41_5e7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f
opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond,
opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output);

-- add2_uxn_opcodes_h_l3191_c41_12ae
add2_uxn_opcodes_h_l3191_c41_12ae : entity work.add2_0CLK_df1f1450 port map (
clk,
add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3191_c41_12ae_phase,
add2_uxn_opcodes_h_l3191_c41_12ae_ins,
add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read,
add2_uxn_opcodes_h_l3191_c41_12ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3192_c7_f033
opc_result_MUX_uxn_opcodes_h_l3192_c7_f033 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond,
opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue,
opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse,
opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output);

-- sub_uxn_opcodes_h_l3192_c41_a33b
sub_uxn_opcodes_h_l3192_c41_a33b : entity work.sub_0CLK_3220bbf1 port map (
clk,
sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3192_c41_a33b_phase,
sub_uxn_opcodes_h_l3192_c41_a33b_ins,
sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read,
sub_uxn_opcodes_h_l3192_c41_a33b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3193_c7_d945
opc_result_MUX_uxn_opcodes_h_l3193_c7_d945 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond,
opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue,
opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse,
opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output);

-- sub2_uxn_opcodes_h_l3193_c41_bbca
sub2_uxn_opcodes_h_l3193_c41_bbca : entity work.sub2_0CLK_df1f1450 port map (
clk,
sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3193_c41_bbca_phase,
sub2_uxn_opcodes_h_l3193_c41_bbca_ins,
sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read,
sub2_uxn_opcodes_h_l3193_c41_bbca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3194_c7_c499
opc_result_MUX_uxn_opcodes_h_l3194_c7_c499 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond,
opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue,
opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse,
opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output);

-- mul_uxn_opcodes_h_l3194_c41_0a70
mul_uxn_opcodes_h_l3194_c41_0a70 : entity work.mul_0CLK_3220bbf1 port map (
clk,
mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3194_c41_0a70_phase,
mul_uxn_opcodes_h_l3194_c41_0a70_ins,
mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read,
mul_uxn_opcodes_h_l3194_c41_0a70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1
opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond,
opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output);

-- mul2_uxn_opcodes_h_l3195_c41_6ebf
mul2_uxn_opcodes_h_l3195_c41_6ebf : entity work.mul2_0CLK_df1f1450 port map (
clk,
mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3195_c41_6ebf_phase,
mul2_uxn_opcodes_h_l3195_c41_6ebf_ins,
mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read,
mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6
opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond,
opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output);

-- div_uxn_opcodes_h_l3196_c41_5ae9
div_uxn_opcodes_h_l3196_c41_5ae9 : entity work.div_0CLK_d8848769 port map (
clk,
div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE,
div_uxn_opcodes_h_l3196_c41_5ae9_phase,
div_uxn_opcodes_h_l3196_c41_5ae9_ins,
div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read,
div_uxn_opcodes_h_l3196_c41_5ae9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d
opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond,
opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output);

-- div2_uxn_opcodes_h_l3197_c41_90a2
div2_uxn_opcodes_h_l3197_c41_90a2 : entity work.div2_0CLK_392dd546 port map (
clk,
div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3197_c41_90a2_phase,
div2_uxn_opcodes_h_l3197_c41_90a2_ins,
div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read,
div2_uxn_opcodes_h_l3197_c41_90a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3198_c7_859e
opc_result_MUX_uxn_opcodes_h_l3198_c7_859e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond,
opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output);

-- and_uxn_opcodes_h_l3198_c41_954d
and_uxn_opcodes_h_l3198_c41_954d : entity work.and_0CLK_3220bbf1 port map (
clk,
and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE,
and_uxn_opcodes_h_l3198_c41_954d_phase,
and_uxn_opcodes_h_l3198_c41_954d_ins,
and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read,
and_uxn_opcodes_h_l3198_c41_954d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33
opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond,
opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue,
opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse,
opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output);

-- and2_uxn_opcodes_h_l3199_c41_f60d
and2_uxn_opcodes_h_l3199_c41_f60d : entity work.and2_0CLK_df1f1450 port map (
clk,
and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3199_c41_f60d_phase,
and2_uxn_opcodes_h_l3199_c41_f60d_ins,
and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read,
and2_uxn_opcodes_h_l3199_c41_f60d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3200_c7_0745
opc_result_MUX_uxn_opcodes_h_l3200_c7_0745 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond,
opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue,
opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse,
opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output);

-- ora_uxn_opcodes_h_l3200_c41_0fe6
ora_uxn_opcodes_h_l3200_c41_0fe6 : entity work.ora_0CLK_3220bbf1 port map (
clk,
ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3200_c41_0fe6_phase,
ora_uxn_opcodes_h_l3200_c41_0fe6_ins,
ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read,
ora_uxn_opcodes_h_l3200_c41_0fe6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3201_c7_471a
opc_result_MUX_uxn_opcodes_h_l3201_c7_471a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond,
opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output);

-- ora2_uxn_opcodes_h_l3201_c41_dfcc
ora2_uxn_opcodes_h_l3201_c41_dfcc : entity work.ora2_0CLK_df1f1450 port map (
clk,
ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3201_c41_dfcc_phase,
ora2_uxn_opcodes_h_l3201_c41_dfcc_ins,
ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read,
ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left,
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right,
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a
opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond,
opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output);

-- eor_uxn_opcodes_h_l3202_c41_a806
eor_uxn_opcodes_h_l3202_c41_a806 : entity work.eor_0CLK_3220bbf1 port map (
clk,
eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3202_c41_a806_phase,
eor_uxn_opcodes_h_l3202_c41_a806_ins,
eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read,
eor_uxn_opcodes_h_l3202_c41_a806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left,
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right,
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3
opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond,
opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output);

-- eor2_uxn_opcodes_h_l3203_c41_8c79
eor2_uxn_opcodes_h_l3203_c41_8c79 : entity work.eor2_0CLK_df1f1450 port map (
clk,
eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3203_c41_8c79_phase,
eor2_uxn_opcodes_h_l3203_c41_8c79_ins,
eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read,
eor2_uxn_opcodes_h_l3203_c41_8c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0
opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond,
opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output);

-- sft_uxn_opcodes_h_l3204_c41_7d49
sft_uxn_opcodes_h_l3204_c41_7d49 : entity work.sft_0CLK_71bf0c33 port map (
clk,
sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3204_c41_7d49_phase,
sft_uxn_opcodes_h_l3204_c41_7d49_ins,
sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read,
sft_uxn_opcodes_h_l3204_c41_7d49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b
opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond,
opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output);

-- sft2_uxn_opcodes_h_l3205_c41_4dea
sft2_uxn_opcodes_h_l3205_c41_4dea : entity work.sft2_0CLK_cb029fa9 port map (
clk,
sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3205_c41_4dea_phase,
sft2_uxn_opcodes_h_l3205_c41_4dea_ins,
sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read,
sft2_uxn_opcodes_h_l3205_c41_4dea_return_output);

-- printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c
printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c : entity work.printf_uxn_opcodes_h_l3206_c9_693c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0);

-- sp1_MUX_uxn_opcodes_h_l3208_c2_34fe
sp1_MUX_uxn_opcodes_h_l3208_c2_34fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond,
sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue,
sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse,
sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output);

-- sp0_MUX_uxn_opcodes_h_l3208_c2_34fe
sp0_MUX_uxn_opcodes_h_l3208_c2_34fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond,
sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue,
sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse,
sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output);

-- sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d
sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond,
sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue,
sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse,
sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output);

-- sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d
sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond,
sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue,
sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse,
sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left,
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right,
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left,
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right,
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output);

-- MUX_uxn_opcodes_h_l3217_c19_88c9
MUX_uxn_opcodes_h_l3217_c19_88c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3217_c19_88c9_cond,
MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue,
MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse,
MUX_uxn_opcodes_h_l3217_c19_88c9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left,
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right,
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output);

-- MUX_uxn_opcodes_h_l3218_c20_54cd
MUX_uxn_opcodes_h_l3218_c20_54cd : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3218_c20_54cd_cond,
MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue,
MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse,
MUX_uxn_opcodes_h_l3218_c20_54cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879 : entity work.BIN_OP_PLUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left,
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right,
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output);

-- stack_ram_update_uxn_opcodes_h_l3221_c21_0aea
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address,
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value,
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable,
stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output);

-- device_ram_update_uxn_opcodes_h_l3227_c26_f15c
device_ram_update_uxn_opcodes_h_l3227_c26_f15c : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address,
device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value,
device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable,
device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output);



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
 is_stack_write,
 stack_address,
 stack_write_value,
 stack_read_value,
 device_ram_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output,
 CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output,
 MUX_uxn_opcodes_h_l3131_c10_4926_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output,
 MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output,
 jci_uxn_opcodes_h_l3137_c41_f934_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output,
 jmi_uxn_opcodes_h_l3138_c41_9b12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output,
 jsi_uxn_opcodes_h_l3139_c41_6030_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output,
 lit_uxn_opcodes_h_l3140_c41_2a90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output,
 opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output,
 lit2_uxn_opcodes_h_l3141_c41_41e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output,
 lit_uxn_opcodes_h_l3142_c41_233d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output,
 lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output,
 inc_uxn_opcodes_h_l3144_c41_89ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output,
 opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output,
 inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output,
 pop_uxn_opcodes_h_l3146_c41_05f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output,
 opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output,
 pop2_uxn_opcodes_h_l3147_c41_7136_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output,
 opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output,
 nip_uxn_opcodes_h_l3148_c41_348a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output,
 nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output,
 opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output,
 swp_uxn_opcodes_h_l3150_c41_cee9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output,
 swp2_uxn_opcodes_h_l3151_c41_e341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output,
 opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output,
 rot_uxn_opcodes_h_l3152_c41_5c44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output,
 opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output,
 rot2_uxn_opcodes_h_l3153_c41_6d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output,
 dup_uxn_opcodes_h_l3154_c41_59e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output,
 opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output,
 dup2_uxn_opcodes_h_l3155_c41_7734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output,
 ovr_uxn_opcodes_h_l3156_c41_8e50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output,
 opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output,
 ovr2_uxn_opcodes_h_l3157_c41_beec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output,
 equ_uxn_opcodes_h_l3158_c41_4e70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output,
 equ2_uxn_opcodes_h_l3159_c41_8610_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output,
 opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output,
 neq_uxn_opcodes_h_l3160_c41_d41d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output,
 neq2_uxn_opcodes_h_l3161_c41_befb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output,
 opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output,
 gth_uxn_opcodes_h_l3162_c41_d216_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output,
 gth2_uxn_opcodes_h_l3163_c41_21c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output,
 opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output,
 lth_uxn_opcodes_h_l3164_c41_b541_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output,
 lth2_uxn_opcodes_h_l3165_c41_60bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output,
 jmp_uxn_opcodes_h_l3166_c41_432b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output,
 jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output,
 opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output,
 jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output,
 jcn2_uxn_opcodes_h_l3169_c41_0674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output,
 jsr_uxn_opcodes_h_l3170_c41_8077_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output,
 jsr2_uxn_opcodes_h_l3171_c41_0260_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output,
 opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output,
 sth_uxn_opcodes_h_l3172_c41_27a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output,
 opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output,
 sth2_uxn_opcodes_h_l3173_c41_1fae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output,
 ldz_uxn_opcodes_h_l3174_c41_0347_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output,
 opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output,
 ldz2_uxn_opcodes_h_l3175_c41_9421_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output,
 opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output,
 stz_uxn_opcodes_h_l3176_c41_e601_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output,
 opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output,
 stz2_uxn_opcodes_h_l3177_c41_2d38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output,
 ldr_uxn_opcodes_h_l3178_c41_4867_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output,
 ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output,
 opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output,
 str1_uxn_opcodes_h_l3180_c41_4341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output,
 str2_uxn_opcodes_h_l3181_c41_e78c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output,
 lda_uxn_opcodes_h_l3182_c41_13cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output,
 opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output,
 lda2_uxn_opcodes_h_l3183_c41_6318_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output,
 opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output,
 sta_uxn_opcodes_h_l3184_c41_c1d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output,
 opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output,
 sta2_uxn_opcodes_h_l3185_c41_05be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output,
 dei_uxn_opcodes_h_l3186_c41_29b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output,
 opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output,
 dei2_uxn_opcodes_h_l3187_c41_27e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output,
 deo_uxn_opcodes_h_l3188_c41_20c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output,
 deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output,
 add_uxn_opcodes_h_l3190_c41_5e7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output,
 opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output,
 add2_uxn_opcodes_h_l3191_c41_12ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output,
 opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output,
 sub_uxn_opcodes_h_l3192_c41_a33b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output,
 opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output,
 sub2_uxn_opcodes_h_l3193_c41_bbca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output,
 mul_uxn_opcodes_h_l3194_c41_0a70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output,
 mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output,
 div_uxn_opcodes_h_l3196_c41_5ae9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output,
 div2_uxn_opcodes_h_l3197_c41_90a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output,
 opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output,
 and_uxn_opcodes_h_l3198_c41_954d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output,
 opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output,
 and2_uxn_opcodes_h_l3199_c41_f60d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output,
 ora_uxn_opcodes_h_l3200_c41_0fe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output,
 ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output,
 eor_uxn_opcodes_h_l3202_c41_a806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output,
 eor2_uxn_opcodes_h_l3203_c41_8c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output,
 sft_uxn_opcodes_h_l3204_c41_7d49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output,
 sft2_uxn_opcodes_h_l3205_c41_4dea_return_output,
 sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output,
 sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output,
 sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output,
 sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output,
 MUX_uxn_opcodes_h_l3217_c19_88c9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output,
 MUX_uxn_opcodes_h_l3218_c20_54cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output,
 stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output,
 device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3131_c2_3698 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_4926_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_57cb_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_6658_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_4926_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_3048_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_f934_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_6030_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_6030_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_6030_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_2a90_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_2a90_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_2a90_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_233d_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_233d_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_233d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_89ae_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_89ae_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_89ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_05f1_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_05f1_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_05f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_7136_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_7136_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_7136_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_348a_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_348a_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_348a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_cee9_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_cee9_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_cee9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_e341_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_e341_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_e341_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_5c44_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_5c44_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_5c44_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_59e1_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_59e1_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_59e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_7734_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_7734_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_7734_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_4e70_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_4e70_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_4e70_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_8610_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_8610_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_8610_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_d41d_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_d41d_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_d41d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_befb_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_befb_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_befb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_d216_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_d216_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_d216_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_b541_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_b541_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_b541_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_432b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_8077_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_27a8_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_27a8_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_27a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_0347_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_e601_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_e601_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_e601_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_4867_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_4341_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_e78c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_13cc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_6318_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_05be_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_05be_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_05be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_29b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_20c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_5e7c_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_5e7c_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_5e7c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_12ae_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_12ae_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_12ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_a33b_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_a33b_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_a33b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_0a70_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_0a70_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_0a70_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_5ae9_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_5ae9_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_5ae9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_90a2_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_90a2_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_90a2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_954d_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_954d_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_954d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_f60d_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_f60d_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_f60d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_a806_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_a806_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_a806_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_7d49_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_7d49_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_7d49_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_066e_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3210_c4_913f : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3212_c4_8cef : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_0a88_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3217_c2_50f7 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_e2ca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output : unsigned(7 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3218_c2_511d : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_2aa0_return_output : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address : unsigned(15 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_0d87_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_87d4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_ac32_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_ece5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_623a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_4f30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_7cfb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_bebb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_bd36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_112d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_9be3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_50c7_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_f23d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_176e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3212_l3210_DUPLICATE_fdf0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_6e31_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
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
  REG_VAR_is_stack_write := is_stack_write;
  REG_VAR_stack_address := stack_address;
  REG_VAR_stack_write_value := stack_write_value;
  REG_VAR_stack_read_value := stack_read_value;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right := to_unsigned(38, 6);
     VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right := to_unsigned(1536, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right := to_unsigned(47, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right := to_unsigned(54, 6);
     VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right := to_unsigned(44, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right := to_unsigned(58, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right := to_unsigned(24, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right := to_unsigned(62, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3191_c41_12ae_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3190_c41_5e7c_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3199_c41_f60d_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3198_c41_954d_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3197_c41_90a2_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3196_c41_5ae9_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3155_c41_7734_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3154_c41_59e1_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3202_c41_a806_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3159_c41_8610_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3158_c41_4e70_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3162_c41_d216_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3144_c41_89ae_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3164_c41_b541_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3194_c41_0a70_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3161_c41_befb_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3160_c41_d41d_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3148_c41_348a_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3147_c41_7136_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3146_c41_05f1_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3152_c41_5c44_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3204_c41_7d49_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3185_c41_05be_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3172_c41_27a8_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3176_c41_e601_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3192_c41_a33b_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3151_c41_e341_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3150_c41_cee9_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3139_c41_6030_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3140_c41_2a90_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3142_c41_233d_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3191_c41_12ae_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3190_c41_5e7c_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3199_c41_f60d_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3198_c41_954d_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3197_c41_90a2_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3196_c41_5ae9_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3155_c41_7734_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3154_c41_59e1_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3202_c41_a806_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3159_c41_8610_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3158_c41_4e70_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3162_c41_d216_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3144_c41_89ae_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3139_c41_6030_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3140_c41_2a90_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3142_c41_233d_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3164_c41_b541_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3194_c41_0a70_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3161_c41_befb_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3160_c41_d41d_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3148_c41_348a_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3147_c41_7136_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3146_c41_05f1_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3152_c41_5c44_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3204_c41_7d49_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3185_c41_05be_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3172_c41_27a8_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3176_c41_e601_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3192_c41_a33b_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3151_c41_e341_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3150_c41_cee9_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3131_c57_6658] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_6658_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3132_c18_c314] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_left;
     BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output := BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3136_c2_3048] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_3048_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l3131_c41_e6c0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_left;
     BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output := BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3131_c10_04f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_left;
     BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output := BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_04f7_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_c314_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_6658_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_3048_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3131_c30_57cb] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_57cb_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_e6c0_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l3131_c57_4c87] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output := CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3132_c18_9d16] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_left;
     BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output := BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3131_c10_4ce6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_left;
     BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output := BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3131_c10_4926_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_4ce6_return_output;
     VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_9d16_return_output;
     VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_57cb_return_output;
     VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_4c87_return_output;
     -- MUX[uxn_opcodes_h_l3132_c18_3ab0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3132_c18_3ab0_cond <= VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_cond;
     MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue <= VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iftrue;
     MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse <= VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output := MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output;

     -- MUX[uxn_opcodes_h_l3131_c10_4926] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3131_c10_4926_cond <= VAR_MUX_uxn_opcodes_h_l3131_c10_4926_cond;
     MUX_uxn_opcodes_h_l3131_c10_4926_iftrue <= VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iftrue;
     MUX_uxn_opcodes_h_l3131_c10_4926_iffalse <= VAR_MUX_uxn_opcodes_h_l3131_c10_4926_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3131_c10_4926_return_output := MUX_uxn_opcodes_h_l3131_c10_4926_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3131_c2_3698 := VAR_MUX_uxn_opcodes_h_l3131_c10_4926_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left := VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3132_c18_3ab0_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3131_c2_3698;
     VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1 := resize(VAR_opc_uxn_opcodes_h_l3131_c2_3698, 32);
     VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0 := resize(VAR_opc_uxn_opcodes_h_l3131_c2_3698, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_9249] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_left;
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output := BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_73cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_b230] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_left;
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output := BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_2c7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3203_c11_639e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_9a82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_left;
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output := BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_437e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_56bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_0b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_fe0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_094b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_7464] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_left;
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output := BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_9e25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_left;
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output := BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_1013] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_left;
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output := BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_e6d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_0575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_left;
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output := BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_dbfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_6bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_d6be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_left;
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output := BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_4ee2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_fccc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_51de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_left;
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output := BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_132f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_e035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_left;
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output := BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_8b9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3136_c6_23ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_38df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_left;
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output := BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_7ed5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_d52b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_0845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_left;
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output := BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_8c60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_left;
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output := BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_c8ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_168c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_b997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_left;
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output := BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_796e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output;

     -- printf_uxn_opcodes_h_l3134_c2_fcd3[uxn_opcodes_h_l3134_c2_fcd3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0 <= VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg0;
     printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1 <= VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg1;
     printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2 <= VAR_printf_uxn_opcodes_h_l3134_c2_fcd3_uxn_opcodes_h_l3134_c2_fcd3_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_8c09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_left;
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output := BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_b9b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_912d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_8558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_left;
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output := BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_c442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_left;
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output := BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_941e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_4b08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_left;
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output := BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_de38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_left;
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output := BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_4761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_left;
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output := BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_f8c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_6166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_left;
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output := BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_d80b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_bc43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_left;
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output := BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_a46b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_a87e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_626a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_5877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_left;
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output := BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_4b1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_dad9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_0ac8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_00ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_aaa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_69cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_63a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_c420] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_left;
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output := BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_5309] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_left;
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output := BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_4069] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_left;
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output := BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_5fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_656e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_1558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_left;
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output := BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_eedf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_26a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3202_c11_6d96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_left;
     BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output := BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_0ddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_60ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_23ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_912d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0b2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_4069_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_9a82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_fccc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_73cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6166_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_bc43_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_6bd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_8b9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_0575_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_0ddd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_8c09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_a46b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_d52b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_5fc2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_437e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_7464_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_1558_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_9e25_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1013_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_132f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_c8ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_0845_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_e035_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_4ee2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_f8c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_4761_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_0ac8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_941e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_38df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_e6d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_8558_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_60ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_5309_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_d80b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_b230_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_de38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_56bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_69cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_c420_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_796e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_aaa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_00ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_9249_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_4b08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_dad9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_d6be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_dbfc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_eedf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_4b1c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_8c60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2c7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_168c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_a87e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_fe0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_5877_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_7ed5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_656e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_b9b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_26a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_51de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_c442_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_094b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_63a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_6d96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_639e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_b997_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_626a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_0dfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_6d1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_553b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_553b_return_output;
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_6d1a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_b434] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_c36d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output;

     -- jci[uxn_opcodes_h_l3137_c41_f934] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3137_c41_f934_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3137_c41_f934_phase <= VAR_jci_uxn_opcodes_h_l3137_c41_f934_phase;
     jci_uxn_opcodes_h_l3137_c41_f934_pc <= VAR_jci_uxn_opcodes_h_l3137_c41_f934_pc;
     jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_stack_read;
     jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3137_c41_f934_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3137_c41_f934_return_output := jci_uxn_opcodes_h_l3137_c41_f934_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output;
     VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_b434_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue := VAR_jci_uxn_opcodes_h_l3137_c41_f934_return_output;
     -- jmi[uxn_opcodes_h_l3138_c41_9b12] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3138_c41_9b12_phase <= VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_phase;
     jmi_uxn_opcodes_h_l3138_c41_9b12_pc <= VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_pc;
     jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_return_output := jmi_uxn_opcodes_h_l3138_c41_9b12_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_b934] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_52eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output;
     VAR_jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_b934_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue := VAR_jmi_uxn_opcodes_h_l3138_c41_9b12_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_684c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output;

     -- jsi[uxn_opcodes_h_l3139_c41_6030] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3139_c41_6030_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3139_c41_6030_phase <= VAR_jsi_uxn_opcodes_h_l3139_c41_6030_phase;
     jsi_uxn_opcodes_h_l3139_c41_6030_pc <= VAR_jsi_uxn_opcodes_h_l3139_c41_6030_pc;
     jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3139_c41_6030_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3139_c41_6030_return_output := jsi_uxn_opcodes_h_l3139_c41_6030_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_712e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_712e_return_output;
     VAR_lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_684c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue := VAR_jsi_uxn_opcodes_h_l3139_c41_6030_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_6bda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_2eaf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output;

     -- lit[uxn_opcodes_h_l3140_c41_2a90] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3140_c41_2a90_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3140_c41_2a90_phase <= VAR_lit_uxn_opcodes_h_l3140_c41_2a90_phase;
     lit_uxn_opcodes_h_l3140_c41_2a90_pc <= VAR_lit_uxn_opcodes_h_l3140_c41_2a90_pc;
     lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3140_c41_2a90_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3140_c41_2a90_return_output := lit_uxn_opcodes_h_l3140_c41_2a90_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output;
     VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_2eaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue := VAR_lit_uxn_opcodes_h_l3140_c41_2a90_return_output;
     -- lit2[uxn_opcodes_h_l3141_c41_41e6] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3141_c41_41e6_phase <= VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_phase;
     lit2_uxn_opcodes_h_l3141_c41_41e6_pc <= VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_pc;
     lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_return_output := lit2_uxn_opcodes_h_l3141_c41_41e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_65f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_cff4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output;
     VAR_lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_cff4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue := VAR_lit2_uxn_opcodes_h_l3141_c41_41e6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_0334] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output;

     -- lit[uxn_opcodes_h_l3142_c41_233d] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3142_c41_233d_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3142_c41_233d_phase <= VAR_lit_uxn_opcodes_h_l3142_c41_233d_phase;
     lit_uxn_opcodes_h_l3142_c41_233d_pc <= VAR_lit_uxn_opcodes_h_l3142_c41_233d_pc;
     lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3142_c41_233d_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3142_c41_233d_return_output := lit_uxn_opcodes_h_l3142_c41_233d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_f35a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output;
     VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_0334_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue := VAR_lit_uxn_opcodes_h_l3142_c41_233d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_41ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_d294] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output;

     -- lit2[uxn_opcodes_h_l3143_c41_fd7a] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3143_c41_fd7a_phase <= VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_phase;
     lit2_uxn_opcodes_h_l3143_c41_fd7a_pc <= VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_pc;
     lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output := lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output;
     VAR_inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_d294_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue := VAR_lit2_uxn_opcodes_h_l3143_c41_fd7a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_5f7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_4c97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output;

     -- inc[uxn_opcodes_h_l3144_c41_89ae] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3144_c41_89ae_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3144_c41_89ae_phase <= VAR_inc_uxn_opcodes_h_l3144_c41_89ae_phase;
     inc_uxn_opcodes_h_l3144_c41_89ae_ins <= VAR_inc_uxn_opcodes_h_l3144_c41_89ae_ins;
     inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3144_c41_89ae_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3144_c41_89ae_return_output := inc_uxn_opcodes_h_l3144_c41_89ae_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output;
     VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_5f7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue := VAR_inc_uxn_opcodes_h_l3144_c41_89ae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_4eb3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_703b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output;

     -- inc2[uxn_opcodes_h_l3145_c41_5e8d] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3145_c41_5e8d_phase <= VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_phase;
     inc2_uxn_opcodes_h_l3145_c41_5e8d_ins <= VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_ins;
     inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output := inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output;
     VAR_pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_703b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue := VAR_inc2_uxn_opcodes_h_l3145_c41_5e8d_return_output;
     -- pop[uxn_opcodes_h_l3146_c41_05f1] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3146_c41_05f1_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3146_c41_05f1_phase <= VAR_pop_uxn_opcodes_h_l3146_c41_05f1_phase;
     pop_uxn_opcodes_h_l3146_c41_05f1_ins <= VAR_pop_uxn_opcodes_h_l3146_c41_05f1_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3146_c41_05f1_return_output := pop_uxn_opcodes_h_l3146_c41_05f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_b5fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_ac26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output;
     VAR_pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_b5fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue := VAR_pop_uxn_opcodes_h_l3146_c41_05f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_0d75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output;

     -- pop2[uxn_opcodes_h_l3147_c41_7136] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3147_c41_7136_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3147_c41_7136_phase <= VAR_pop2_uxn_opcodes_h_l3147_c41_7136_phase;
     pop2_uxn_opcodes_h_l3147_c41_7136_ins <= VAR_pop2_uxn_opcodes_h_l3147_c41_7136_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3147_c41_7136_return_output := pop2_uxn_opcodes_h_l3147_c41_7136_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_7762] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output;
     VAR_nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_7762_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue := VAR_pop2_uxn_opcodes_h_l3147_c41_7136_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_4ec7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_c313] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output;

     -- nip[uxn_opcodes_h_l3148_c41_348a] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3148_c41_348a_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3148_c41_348a_phase <= VAR_nip_uxn_opcodes_h_l3148_c41_348a_phase;
     nip_uxn_opcodes_h_l3148_c41_348a_ins <= VAR_nip_uxn_opcodes_h_l3148_c41_348a_ins;
     nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3148_c41_348a_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3148_c41_348a_return_output := nip_uxn_opcodes_h_l3148_c41_348a_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output;
     VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_c313_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue := VAR_nip_uxn_opcodes_h_l3148_c41_348a_return_output;
     -- nip2[uxn_opcodes_h_l3149_c41_7b9b] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3149_c41_7b9b_phase <= VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_phase;
     nip2_uxn_opcodes_h_l3149_c41_7b9b_ins <= VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_ins;
     nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output := nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_416e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_8d06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output;
     VAR_swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_416e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue := VAR_nip2_uxn_opcodes_h_l3149_c41_7b9b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_36b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_1b0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output;

     -- swp[uxn_opcodes_h_l3150_c41_cee9] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3150_c41_cee9_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3150_c41_cee9_phase <= VAR_swp_uxn_opcodes_h_l3150_c41_cee9_phase;
     swp_uxn_opcodes_h_l3150_c41_cee9_ins <= VAR_swp_uxn_opcodes_h_l3150_c41_cee9_ins;
     swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3150_c41_cee9_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3150_c41_cee9_return_output := swp_uxn_opcodes_h_l3150_c41_cee9_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output;
     VAR_swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_1b0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue := VAR_swp_uxn_opcodes_h_l3150_c41_cee9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_4a82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_de35] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output;

     -- swp2[uxn_opcodes_h_l3151_c41_e341] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3151_c41_e341_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3151_c41_e341_phase <= VAR_swp2_uxn_opcodes_h_l3151_c41_e341_phase;
     swp2_uxn_opcodes_h_l3151_c41_e341_ins <= VAR_swp2_uxn_opcodes_h_l3151_c41_e341_ins;
     swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3151_c41_e341_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3151_c41_e341_return_output := swp2_uxn_opcodes_h_l3151_c41_e341_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_de35_return_output;
     VAR_rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4a82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue := VAR_swp2_uxn_opcodes_h_l3151_c41_e341_return_output;
     -- rot[uxn_opcodes_h_l3152_c41_5c44] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3152_c41_5c44_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3152_c41_5c44_phase <= VAR_rot_uxn_opcodes_h_l3152_c41_5c44_phase;
     rot_uxn_opcodes_h_l3152_c41_5c44_ins <= VAR_rot_uxn_opcodes_h_l3152_c41_5c44_ins;
     rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3152_c41_5c44_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3152_c41_5c44_return_output := rot_uxn_opcodes_h_l3152_c41_5c44_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_d3eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_0e82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output;
     VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_d3eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue := VAR_rot_uxn_opcodes_h_l3152_c41_5c44_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_88f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_9982] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output;

     -- rot2[uxn_opcodes_h_l3153_c41_6d40] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3153_c41_6d40_phase <= VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_phase;
     rot2_uxn_opcodes_h_l3153_c41_6d40_ins <= VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_ins;
     rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_return_output := rot2_uxn_opcodes_h_l3153_c41_6d40_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output;
     VAR_dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_9982_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue := VAR_rot2_uxn_opcodes_h_l3153_c41_6d40_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_6747] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_8fa2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output;

     -- dup[uxn_opcodes_h_l3154_c41_59e1] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3154_c41_59e1_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3154_c41_59e1_phase <= VAR_dup_uxn_opcodes_h_l3154_c41_59e1_phase;
     dup_uxn_opcodes_h_l3154_c41_59e1_ins <= VAR_dup_uxn_opcodes_h_l3154_c41_59e1_ins;
     dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3154_c41_59e1_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3154_c41_59e1_return_output := dup_uxn_opcodes_h_l3154_c41_59e1_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_6747_return_output;
     VAR_dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_8fa2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue := VAR_dup_uxn_opcodes_h_l3154_c41_59e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_ec04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output;

     -- dup2[uxn_opcodes_h_l3155_c41_7734] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3155_c41_7734_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3155_c41_7734_phase <= VAR_dup2_uxn_opcodes_h_l3155_c41_7734_phase;
     dup2_uxn_opcodes_h_l3155_c41_7734_ins <= VAR_dup2_uxn_opcodes_h_l3155_c41_7734_ins;
     dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3155_c41_7734_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3155_c41_7734_return_output := dup2_uxn_opcodes_h_l3155_c41_7734_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_28ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output;
     VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_ec04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue := VAR_dup2_uxn_opcodes_h_l3155_c41_7734_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_9734] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_ad76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output;

     -- ovr[uxn_opcodes_h_l3156_c41_8e50] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3156_c41_8e50_phase <= VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_phase;
     ovr_uxn_opcodes_h_l3156_c41_8e50_ins <= VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_ins;
     ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_return_output := ovr_uxn_opcodes_h_l3156_c41_8e50_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_9734_return_output;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_ad76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue := VAR_ovr_uxn_opcodes_h_l3156_c41_8e50_return_output;
     -- ovr2[uxn_opcodes_h_l3157_c41_beec] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3157_c41_beec_phase <= VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_phase;
     ovr2_uxn_opcodes_h_l3157_c41_beec_ins <= VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_ins;
     ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_return_output := ovr2_uxn_opcodes_h_l3157_c41_beec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_c6e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_6e7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output;
     VAR_equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_c6e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue := VAR_ovr2_uxn_opcodes_h_l3157_c41_beec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_10d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output;

     -- equ[uxn_opcodes_h_l3158_c41_4e70] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3158_c41_4e70_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3158_c41_4e70_phase <= VAR_equ_uxn_opcodes_h_l3158_c41_4e70_phase;
     equ_uxn_opcodes_h_l3158_c41_4e70_ins <= VAR_equ_uxn_opcodes_h_l3158_c41_4e70_ins;
     equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3158_c41_4e70_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3158_c41_4e70_return_output := equ_uxn_opcodes_h_l3158_c41_4e70_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_6e5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output;
     VAR_equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_6e5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue := VAR_equ_uxn_opcodes_h_l3158_c41_4e70_return_output;
     -- equ2[uxn_opcodes_h_l3159_c41_8610] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3159_c41_8610_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3159_c41_8610_phase <= VAR_equ2_uxn_opcodes_h_l3159_c41_8610_phase;
     equ2_uxn_opcodes_h_l3159_c41_8610_ins <= VAR_equ2_uxn_opcodes_h_l3159_c41_8610_ins;
     equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3159_c41_8610_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3159_c41_8610_return_output := equ2_uxn_opcodes_h_l3159_c41_8610_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_a936] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_b514] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_b514_return_output;
     VAR_neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_a936_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue := VAR_equ2_uxn_opcodes_h_l3159_c41_8610_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_8dc4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output;

     -- neq[uxn_opcodes_h_l3160_c41_d41d] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3160_c41_d41d_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3160_c41_d41d_phase <= VAR_neq_uxn_opcodes_h_l3160_c41_d41d_phase;
     neq_uxn_opcodes_h_l3160_c41_d41d_ins <= VAR_neq_uxn_opcodes_h_l3160_c41_d41d_ins;
     neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3160_c41_d41d_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3160_c41_d41d_return_output := neq_uxn_opcodes_h_l3160_c41_d41d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_1808] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output;
     VAR_neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_1808_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue := VAR_neq_uxn_opcodes_h_l3160_c41_d41d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_6155] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output;

     -- neq2[uxn_opcodes_h_l3161_c41_befb] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3161_c41_befb_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3161_c41_befb_phase <= VAR_neq2_uxn_opcodes_h_l3161_c41_befb_phase;
     neq2_uxn_opcodes_h_l3161_c41_befb_ins <= VAR_neq2_uxn_opcodes_h_l3161_c41_befb_ins;
     neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3161_c41_befb_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3161_c41_befb_return_output := neq2_uxn_opcodes_h_l3161_c41_befb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_df7b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_6155_return_output;
     VAR_gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_df7b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue := VAR_neq2_uxn_opcodes_h_l3161_c41_befb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_a876] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output;

     -- gth[uxn_opcodes_h_l3162_c41_d216] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3162_c41_d216_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3162_c41_d216_phase <= VAR_gth_uxn_opcodes_h_l3162_c41_d216_phase;
     gth_uxn_opcodes_h_l3162_c41_d216_ins <= VAR_gth_uxn_opcodes_h_l3162_c41_d216_ins;
     gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3162_c41_d216_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3162_c41_d216_return_output := gth_uxn_opcodes_h_l3162_c41_d216_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_f64b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output;
     VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_a876_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue := VAR_gth_uxn_opcodes_h_l3162_c41_d216_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_e89b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_b1ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output;

     -- gth2[uxn_opcodes_h_l3163_c41_21c2] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3163_c41_21c2_phase <= VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_phase;
     gth2_uxn_opcodes_h_l3163_c41_21c2_ins <= VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_ins;
     gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_return_output := gth2_uxn_opcodes_h_l3163_c41_21c2_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output;
     VAR_lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_e89b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue := VAR_gth2_uxn_opcodes_h_l3163_c41_21c2_return_output;
     -- lth[uxn_opcodes_h_l3164_c41_b541] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3164_c41_b541_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3164_c41_b541_phase <= VAR_lth_uxn_opcodes_h_l3164_c41_b541_phase;
     lth_uxn_opcodes_h_l3164_c41_b541_ins <= VAR_lth_uxn_opcodes_h_l3164_c41_b541_ins;
     lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3164_c41_b541_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3164_c41_b541_return_output := lth_uxn_opcodes_h_l3164_c41_b541_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_d7ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_ac7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output;
     VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_d7ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue := VAR_lth_uxn_opcodes_h_l3164_c41_b541_return_output;
     -- lth2[uxn_opcodes_h_l3165_c41_60bd] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3165_c41_60bd_phase <= VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_phase;
     lth2_uxn_opcodes_h_l3165_c41_60bd_ins <= VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_ins;
     lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_return_output := lth2_uxn_opcodes_h_l3165_c41_60bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_309f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_4cd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output;
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_309f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue := VAR_lth2_uxn_opcodes_h_l3165_c41_60bd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_de51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_7ec7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output;

     -- jmp[uxn_opcodes_h_l3166_c41_432b] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3166_c41_432b_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3166_c41_432b_phase <= VAR_jmp_uxn_opcodes_h_l3166_c41_432b_phase;
     jmp_uxn_opcodes_h_l3166_c41_432b_ins <= VAR_jmp_uxn_opcodes_h_l3166_c41_432b_ins;
     jmp_uxn_opcodes_h_l3166_c41_432b_pc <= VAR_jmp_uxn_opcodes_h_l3166_c41_432b_pc;
     jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3166_c41_432b_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3166_c41_432b_return_output := jmp_uxn_opcodes_h_l3166_c41_432b_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_de51_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue := VAR_jmp_uxn_opcodes_h_l3166_c41_432b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_c0fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output;

     -- jmp2[uxn_opcodes_h_l3167_c41_4c39] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3167_c41_4c39_phase <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_phase;
     jmp2_uxn_opcodes_h_l3167_c41_4c39_ins <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_ins;
     jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output := jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_0817] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_0817_return_output;
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_c0fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue := VAR_jmp2_uxn_opcodes_h_l3167_c41_4c39_return_output;
     -- jcn[uxn_opcodes_h_l3168_c41_1aa7] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3168_c41_1aa7_phase <= VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_phase;
     jcn_uxn_opcodes_h_l3168_c41_1aa7_ins <= VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_ins;
     jcn_uxn_opcodes_h_l3168_c41_1aa7_pc <= VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_pc;
     jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output := jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_580b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_2c4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_580b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue := VAR_jcn_uxn_opcodes_h_l3168_c41_1aa7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_8864] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_acfd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output;

     -- jcn2[uxn_opcodes_h_l3169_c41_0674] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3169_c41_0674_phase <= VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_phase;
     jcn2_uxn_opcodes_h_l3169_c41_0674_ins <= VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_ins;
     jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_return_output := jcn2_uxn_opcodes_h_l3169_c41_0674_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output;
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_8864_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue := VAR_jcn2_uxn_opcodes_h_l3169_c41_0674_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_291d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_af9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output;

     -- jsr[uxn_opcodes_h_l3170_c41_8077] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3170_c41_8077_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3170_c41_8077_phase <= VAR_jsr_uxn_opcodes_h_l3170_c41_8077_phase;
     jsr_uxn_opcodes_h_l3170_c41_8077_ins <= VAR_jsr_uxn_opcodes_h_l3170_c41_8077_ins;
     jsr_uxn_opcodes_h_l3170_c41_8077_pc <= VAR_jsr_uxn_opcodes_h_l3170_c41_8077_pc;
     jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3170_c41_8077_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3170_c41_8077_return_output := jsr_uxn_opcodes_h_l3170_c41_8077_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_291d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue := VAR_jsr_uxn_opcodes_h_l3170_c41_8077_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_6b03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_d9fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output;

     -- jsr2[uxn_opcodes_h_l3171_c41_0260] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3171_c41_0260_phase <= VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_phase;
     jsr2_uxn_opcodes_h_l3171_c41_0260_ins <= VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_ins;
     jsr2_uxn_opcodes_h_l3171_c41_0260_pc <= VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_pc;
     jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_return_output := jsr2_uxn_opcodes_h_l3171_c41_0260_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output;
     VAR_sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_6b03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue := VAR_jsr2_uxn_opcodes_h_l3171_c41_0260_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_fbae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_df0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output;

     -- sth[uxn_opcodes_h_l3172_c41_27a8] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3172_c41_27a8_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3172_c41_27a8_phase <= VAR_sth_uxn_opcodes_h_l3172_c41_27a8_phase;
     sth_uxn_opcodes_h_l3172_c41_27a8_ins <= VAR_sth_uxn_opcodes_h_l3172_c41_27a8_ins;
     sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3172_c41_27a8_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3172_c41_27a8_return_output := sth_uxn_opcodes_h_l3172_c41_27a8_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output;
     VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_df0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue := VAR_sth_uxn_opcodes_h_l3172_c41_27a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_587b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output;

     -- sth2[uxn_opcodes_h_l3173_c41_1fae] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3173_c41_1fae_phase <= VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_phase;
     sth2_uxn_opcodes_h_l3173_c41_1fae_ins <= VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_ins;
     sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_return_output := sth2_uxn_opcodes_h_l3173_c41_1fae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_c6ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_587b_return_output;
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_c6ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue := VAR_sth2_uxn_opcodes_h_l3173_c41_1fae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_2c62] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output;

     -- ldz[uxn_opcodes_h_l3174_c41_0347] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3174_c41_0347_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3174_c41_0347_phase <= VAR_ldz_uxn_opcodes_h_l3174_c41_0347_phase;
     ldz_uxn_opcodes_h_l3174_c41_0347_ins <= VAR_ldz_uxn_opcodes_h_l3174_c41_0347_ins;
     ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_stack_read;
     ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3174_c41_0347_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3174_c41_0347_return_output := ldz_uxn_opcodes_h_l3174_c41_0347_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_c464] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_c464_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue := VAR_ldz_uxn_opcodes_h_l3174_c41_0347_return_output;
     -- ldz2[uxn_opcodes_h_l3175_c41_9421] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3175_c41_9421_phase <= VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_phase;
     ldz2_uxn_opcodes_h_l3175_c41_9421_ins <= VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_ins;
     ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_stack_read;
     ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_return_output := ldz2_uxn_opcodes_h_l3175_c41_9421_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_edca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_715e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_edca_return_output;
     VAR_stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_715e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue := VAR_ldz2_uxn_opcodes_h_l3175_c41_9421_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_0d9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output;

     -- stz[uxn_opcodes_h_l3176_c41_e601] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3176_c41_e601_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3176_c41_e601_phase <= VAR_stz_uxn_opcodes_h_l3176_c41_e601_phase;
     stz_uxn_opcodes_h_l3176_c41_e601_ins <= VAR_stz_uxn_opcodes_h_l3176_c41_e601_ins;
     stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3176_c41_e601_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3176_c41_e601_return_output := stz_uxn_opcodes_h_l3176_c41_e601_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_7f56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output;
     VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_0d9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue := VAR_stz_uxn_opcodes_h_l3176_c41_e601_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_787c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_edd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output;

     -- stz2[uxn_opcodes_h_l3177_c41_2d38] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3177_c41_2d38_phase <= VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_phase;
     stz2_uxn_opcodes_h_l3177_c41_2d38_ins <= VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_ins;
     stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_return_output := stz2_uxn_opcodes_h_l3177_c41_2d38_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output;
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_787c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue := VAR_stz2_uxn_opcodes_h_l3177_c41_2d38_return_output;
     -- ldr[uxn_opcodes_h_l3178_c41_4867] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3178_c41_4867_phase <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_phase;
     ldr_uxn_opcodes_h_l3178_c41_4867_ins <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_ins;
     ldr_uxn_opcodes_h_l3178_c41_4867_pc <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_pc;
     ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_stack_read;
     ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3178_c41_4867_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3178_c41_4867_return_output := ldr_uxn_opcodes_h_l3178_c41_4867_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_fb0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_c64c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_c64c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue := VAR_ldr_uxn_opcodes_h_l3178_c41_4867_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_c3af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output;

     -- ldr2[uxn_opcodes_h_l3179_c41_11ef] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3179_c41_11ef_phase <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_phase;
     ldr2_uxn_opcodes_h_l3179_c41_11ef_ins <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_ins;
     ldr2_uxn_opcodes_h_l3179_c41_11ef_pc <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_pc;
     ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_stack_read;
     ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output := ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_2bcb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output;
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_2bcb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue := VAR_ldr2_uxn_opcodes_h_l3179_c41_11ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_fd0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output;

     -- str1[uxn_opcodes_h_l3180_c41_4341] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3180_c41_4341_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3180_c41_4341_phase <= VAR_str1_uxn_opcodes_h_l3180_c41_4341_phase;
     str1_uxn_opcodes_h_l3180_c41_4341_ins <= VAR_str1_uxn_opcodes_h_l3180_c41_4341_ins;
     str1_uxn_opcodes_h_l3180_c41_4341_pc <= VAR_str1_uxn_opcodes_h_l3180_c41_4341_pc;
     str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3180_c41_4341_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3180_c41_4341_return_output := str1_uxn_opcodes_h_l3180_c41_4341_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_346c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_346c_return_output;
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_fd0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue := VAR_str1_uxn_opcodes_h_l3180_c41_4341_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_ea73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output;

     -- str2[uxn_opcodes_h_l3181_c41_e78c] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3181_c41_e78c_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3181_c41_e78c_phase <= VAR_str2_uxn_opcodes_h_l3181_c41_e78c_phase;
     str2_uxn_opcodes_h_l3181_c41_e78c_ins <= VAR_str2_uxn_opcodes_h_l3181_c41_e78c_ins;
     str2_uxn_opcodes_h_l3181_c41_e78c_pc <= VAR_str2_uxn_opcodes_h_l3181_c41_e78c_pc;
     str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3181_c41_e78c_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3181_c41_e78c_return_output := str2_uxn_opcodes_h_l3181_c41_e78c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_9cb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output;
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_ea73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue := VAR_str2_uxn_opcodes_h_l3181_c41_e78c_return_output;
     -- lda[uxn_opcodes_h_l3182_c41_13cc] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3182_c41_13cc_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3182_c41_13cc_phase <= VAR_lda_uxn_opcodes_h_l3182_c41_13cc_phase;
     lda_uxn_opcodes_h_l3182_c41_13cc_ins <= VAR_lda_uxn_opcodes_h_l3182_c41_13cc_ins;
     lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_stack_read;
     lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3182_c41_13cc_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3182_c41_13cc_return_output := lda_uxn_opcodes_h_l3182_c41_13cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_1f59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_7d18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output;
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_1f59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue := VAR_lda_uxn_opcodes_h_l3182_c41_13cc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_0279] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output;

     -- lda2[uxn_opcodes_h_l3183_c41_6318] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3183_c41_6318_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3183_c41_6318_phase <= VAR_lda2_uxn_opcodes_h_l3183_c41_6318_phase;
     lda2_uxn_opcodes_h_l3183_c41_6318_ins <= VAR_lda2_uxn_opcodes_h_l3183_c41_6318_ins;
     lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_stack_read;
     lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3183_c41_6318_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3183_c41_6318_return_output := lda2_uxn_opcodes_h_l3183_c41_6318_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_7a52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output;
     VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_0279_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue := VAR_lda2_uxn_opcodes_h_l3183_c41_6318_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_c61d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output;

     -- sta[uxn_opcodes_h_l3184_c41_c1d7] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3184_c41_c1d7_phase <= VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_phase;
     sta_uxn_opcodes_h_l3184_c41_c1d7_ins <= VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_ins;
     sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_return_output := sta_uxn_opcodes_h_l3184_c41_c1d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_cfae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output;
     VAR_sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_c61d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue := VAR_sta_uxn_opcodes_h_l3184_c41_c1d7_return_output;
     -- sta2[uxn_opcodes_h_l3185_c41_05be] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3185_c41_05be_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3185_c41_05be_phase <= VAR_sta2_uxn_opcodes_h_l3185_c41_05be_phase;
     sta2_uxn_opcodes_h_l3185_c41_05be_ins <= VAR_sta2_uxn_opcodes_h_l3185_c41_05be_ins;
     sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3185_c41_05be_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3185_c41_05be_return_output := sta2_uxn_opcodes_h_l3185_c41_05be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_5c5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_545c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_545c_return_output;
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_5c5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue := VAR_sta2_uxn_opcodes_h_l3185_c41_05be_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_7126] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output;

     -- dei[uxn_opcodes_h_l3186_c41_29b6] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3186_c41_29b6_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3186_c41_29b6_phase <= VAR_dei_uxn_opcodes_h_l3186_c41_29b6_phase;
     dei_uxn_opcodes_h_l3186_c41_29b6_ins <= VAR_dei_uxn_opcodes_h_l3186_c41_29b6_ins;
     dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_stack_read;
     dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3186_c41_29b6_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3186_c41_29b6_return_output := dei_uxn_opcodes_h_l3186_c41_29b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_74e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_7126_return_output;
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_74e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue := VAR_dei_uxn_opcodes_h_l3186_c41_29b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_f3c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output;

     -- dei2[uxn_opcodes_h_l3187_c41_27e8] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3187_c41_27e8_phase <= VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_phase;
     dei2_uxn_opcodes_h_l3187_c41_27e8_ins <= VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_ins;
     dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_stack_read;
     dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_return_output := dei2_uxn_opcodes_h_l3187_c41_27e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_3e5c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output;
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_f3c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue := VAR_dei2_uxn_opcodes_h_l3187_c41_27e8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_d218] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_96cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output;

     -- deo[uxn_opcodes_h_l3188_c41_20c6] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3188_c41_20c6_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3188_c41_20c6_phase <= VAR_deo_uxn_opcodes_h_l3188_c41_20c6_phase;
     deo_uxn_opcodes_h_l3188_c41_20c6_ins <= VAR_deo_uxn_opcodes_h_l3188_c41_20c6_ins;
     deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_stack_read;
     deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3188_c41_20c6_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3188_c41_20c6_return_output := deo_uxn_opcodes_h_l3188_c41_20c6_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output;
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d218_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue := VAR_deo_uxn_opcodes_h_l3188_c41_20c6_return_output;
     -- deo2[uxn_opcodes_h_l3189_c41_1f8a] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3189_c41_1f8a_phase <= VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_phase;
     deo2_uxn_opcodes_h_l3189_c41_1f8a_ins <= VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_ins;
     deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_stack_read;
     deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output := deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_ce7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_2a81] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output;
     VAR_add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_2a81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue := VAR_deo2_uxn_opcodes_h_l3189_c41_1f8a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_d304] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output;

     -- add[uxn_opcodes_h_l3190_c41_5e7c] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3190_c41_5e7c_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3190_c41_5e7c_phase <= VAR_add_uxn_opcodes_h_l3190_c41_5e7c_phase;
     add_uxn_opcodes_h_l3190_c41_5e7c_ins <= VAR_add_uxn_opcodes_h_l3190_c41_5e7c_ins;
     add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read <= VAR_add_uxn_opcodes_h_l3190_c41_5e7c_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3190_c41_5e7c_return_output := add_uxn_opcodes_h_l3190_c41_5e7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_f033] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_f033_return_output;
     VAR_add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_d304_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue := VAR_add_uxn_opcodes_h_l3190_c41_5e7c_return_output;
     -- add2[uxn_opcodes_h_l3191_c41_12ae] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3191_c41_12ae_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3191_c41_12ae_phase <= VAR_add2_uxn_opcodes_h_l3191_c41_12ae_phase;
     add2_uxn_opcodes_h_l3191_c41_12ae_ins <= VAR_add2_uxn_opcodes_h_l3191_c41_12ae_ins;
     add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3191_c41_12ae_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3191_c41_12ae_return_output := add2_uxn_opcodes_h_l3191_c41_12ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_d945] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_3c41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_d945_return_output;
     VAR_sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_3c41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue := VAR_add2_uxn_opcodes_h_l3191_c41_12ae_return_output;
     -- sub[uxn_opcodes_h_l3192_c41_a33b] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3192_c41_a33b_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3192_c41_a33b_phase <= VAR_sub_uxn_opcodes_h_l3192_c41_a33b_phase;
     sub_uxn_opcodes_h_l3192_c41_a33b_ins <= VAR_sub_uxn_opcodes_h_l3192_c41_a33b_ins;
     sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3192_c41_a33b_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3192_c41_a33b_return_output := sub_uxn_opcodes_h_l3192_c41_a33b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_c499] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_468d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_c499_return_output;
     VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_468d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue := VAR_sub_uxn_opcodes_h_l3192_c41_a33b_return_output;
     -- sub2[uxn_opcodes_h_l3193_c41_bbca] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3193_c41_bbca_phase <= VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_phase;
     sub2_uxn_opcodes_h_l3193_c41_bbca_ins <= VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_ins;
     sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_return_output := sub2_uxn_opcodes_h_l3193_c41_bbca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_cbb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_05c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output;
     VAR_mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_05c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue := VAR_sub2_uxn_opcodes_h_l3193_c41_bbca_return_output;
     -- mul[uxn_opcodes_h_l3194_c41_0a70] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3194_c41_0a70_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3194_c41_0a70_phase <= VAR_mul_uxn_opcodes_h_l3194_c41_0a70_phase;
     mul_uxn_opcodes_h_l3194_c41_0a70_ins <= VAR_mul_uxn_opcodes_h_l3194_c41_0a70_ins;
     mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3194_c41_0a70_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3194_c41_0a70_return_output := mul_uxn_opcodes_h_l3194_c41_0a70_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_2fa6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_1ba3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output;
     VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_1ba3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue := VAR_mul_uxn_opcodes_h_l3194_c41_0a70_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_7f5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output;

     -- mul2[uxn_opcodes_h_l3195_c41_6ebf] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3195_c41_6ebf_phase <= VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_phase;
     mul2_uxn_opcodes_h_l3195_c41_6ebf_ins <= VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_ins;
     mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output := mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_b47d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output;
     VAR_div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_7f5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue := VAR_mul2_uxn_opcodes_h_l3195_c41_6ebf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_859e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_2c4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output;

     -- div[uxn_opcodes_h_l3196_c41_5ae9] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3196_c41_5ae9_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3196_c41_5ae9_phase <= VAR_div_uxn_opcodes_h_l3196_c41_5ae9_phase;
     div_uxn_opcodes_h_l3196_c41_5ae9_ins <= VAR_div_uxn_opcodes_h_l3196_c41_5ae9_ins;
     div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read <= VAR_div_uxn_opcodes_h_l3196_c41_5ae9_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3196_c41_5ae9_return_output := div_uxn_opcodes_h_l3196_c41_5ae9_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_859e_return_output;
     VAR_div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_2c4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue := VAR_div_uxn_opcodes_h_l3196_c41_5ae9_return_output;
     -- div2[uxn_opcodes_h_l3197_c41_90a2] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3197_c41_90a2_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3197_c41_90a2_phase <= VAR_div2_uxn_opcodes_h_l3197_c41_90a2_phase;
     div2_uxn_opcodes_h_l3197_c41_90a2_ins <= VAR_div2_uxn_opcodes_h_l3197_c41_90a2_ins;
     div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3197_c41_90a2_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3197_c41_90a2_return_output := div2_uxn_opcodes_h_l3197_c41_90a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_002f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_5e33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output;
     VAR_and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_002f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue := VAR_div2_uxn_opcodes_h_l3197_c41_90a2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_0745] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_1116] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output;

     -- and[uxn_opcodes_h_l3198_c41_954d] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3198_c41_954d_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3198_c41_954d_phase <= VAR_and_uxn_opcodes_h_l3198_c41_954d_phase;
     and_uxn_opcodes_h_l3198_c41_954d_ins <= VAR_and_uxn_opcodes_h_l3198_c41_954d_ins;
     and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read <= VAR_and_uxn_opcodes_h_l3198_c41_954d_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3198_c41_954d_return_output := and_uxn_opcodes_h_l3198_c41_954d_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_0745_return_output;
     VAR_and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_1116_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue := VAR_and_uxn_opcodes_h_l3198_c41_954d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_471a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output;

     -- and2[uxn_opcodes_h_l3199_c41_f60d] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3199_c41_f60d_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3199_c41_f60d_phase <= VAR_and2_uxn_opcodes_h_l3199_c41_f60d_phase;
     and2_uxn_opcodes_h_l3199_c41_f60d_ins <= VAR_and2_uxn_opcodes_h_l3199_c41_f60d_ins;
     and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3199_c41_f60d_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3199_c41_f60d_return_output := and2_uxn_opcodes_h_l3199_c41_f60d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_d954] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_471a_return_output;
     VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_d954_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue := VAR_and2_uxn_opcodes_h_l3199_c41_f60d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_83c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output;

     -- ora[uxn_opcodes_h_l3200_c41_0fe6] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3200_c41_0fe6_phase <= VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_phase;
     ora_uxn_opcodes_h_l3200_c41_0fe6_ins <= VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_ins;
     ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_return_output := ora_uxn_opcodes_h_l3200_c41_0fe6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c7_d06a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output;
     VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_83c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue := VAR_ora_uxn_opcodes_h_l3200_c41_0fe6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c7_c8f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_9415] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output;

     -- ora2[uxn_opcodes_h_l3201_c41_dfcc] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3201_c41_dfcc_phase <= VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_phase;
     ora2_uxn_opcodes_h_l3201_c41_dfcc_ins <= VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_ins;
     ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output := ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output;
     VAR_eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_9415_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue := VAR_ora2_uxn_opcodes_h_l3201_c41_dfcc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c1_a1d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output;

     -- eor[uxn_opcodes_h_l3202_c41_a806] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3202_c41_a806_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3202_c41_a806_phase <= VAR_eor_uxn_opcodes_h_l3202_c41_a806_phase;
     eor_uxn_opcodes_h_l3202_c41_a806_ins <= VAR_eor_uxn_opcodes_h_l3202_c41_a806_ins;
     eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3202_c41_a806_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3202_c41_a806_return_output := eor_uxn_opcodes_h_l3202_c41_a806_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c7_99a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output;
     VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_a1d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue := VAR_eor_uxn_opcodes_h_l3202_c41_a806_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c1_857f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c7_c89b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output;

     -- eor2[uxn_opcodes_h_l3203_c41_8c79] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3203_c41_8c79_phase <= VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_phase;
     eor2_uxn_opcodes_h_l3203_c41_8c79_ins <= VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_ins;
     eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_return_output := eor2_uxn_opcodes_h_l3203_c41_8c79_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output;
     VAR_sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_857f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue := VAR_eor2_uxn_opcodes_h_l3203_c41_8c79_return_output;
     -- sft[uxn_opcodes_h_l3204_c41_7d49] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3204_c41_7d49_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3204_c41_7d49_phase <= VAR_sft_uxn_opcodes_h_l3204_c41_7d49_phase;
     sft_uxn_opcodes_h_l3204_c41_7d49_ins <= VAR_sft_uxn_opcodes_h_l3204_c41_7d49_ins;
     sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3204_c41_7d49_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3204_c41_7d49_return_output := sft_uxn_opcodes_h_l3204_c41_7d49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c1_2c23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3206_c1_17ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_17ec_return_output;
     VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_2c23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue := VAR_sft_uxn_opcodes_h_l3204_c41_7d49_return_output;
     -- sft2[uxn_opcodes_h_l3205_c41_4dea] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3205_c41_4dea_phase <= VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_phase;
     sft2_uxn_opcodes_h_l3205_c41_4dea_ins <= VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_ins;
     sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_return_output := sft2_uxn_opcodes_h_l3205_c41_4dea_return_output;

     -- printf_uxn_opcodes_h_l3206_c9_693c[uxn_opcodes_h_l3206_c9_693c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0 <= VAR_printf_uxn_opcodes_h_l3206_c9_693c_uxn_opcodes_h_l3206_c9_693c_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue := VAR_sft2_uxn_opcodes_h_l3205_c41_4dea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3205_c7_c89b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_cond;
     opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output := opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_c89b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3204_c7_99a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_cond;
     opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output := opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_99a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3203_c7_c8f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_cond;
     opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output := opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_c8f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3202_c7_d06a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_cond;
     opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output := opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_d06a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3201_c7_471a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_cond;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output := opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_471a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3200_c7_0745] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_cond;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output := opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_0745_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3199_c7_5e33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_cond;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output := opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_5e33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3198_c7_859e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_cond;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output := opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_859e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3197_c7_b47d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_cond;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output := opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_b47d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3196_c7_2fa6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_cond;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output := opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_2fa6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3195_c7_cbb1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_cond;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output := opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_cbb1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3194_c7_c499] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_cond;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output := opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_c499_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3193_c7_d945] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_cond;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output := opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_d945_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3192_c7_f033] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_cond;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output := opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_f033_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3191_c7_ce7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_cond;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output := opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_ce7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3190_c7_96cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_cond;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output := opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_96cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3189_c7_3e5c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_cond;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output := opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_3e5c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3188_c7_7126] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_cond;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output := opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_7126_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3187_c7_545c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_cond;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output := opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_545c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3186_c7_cfae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_cond;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output := opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_cfae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3185_c7_7a52] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_cond;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output := opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_7a52_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3184_c7_7d18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_cond;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output := opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_7d18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3183_c7_9cb1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_cond;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output := opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_9cb1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3182_c7_346c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_cond;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output := opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_346c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3181_c7_c3af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_cond;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output := opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_c3af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3180_c7_fb0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_cond;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output := opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_fb0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3179_c7_edd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_cond;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output := opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_edd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3178_c7_7f56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_cond;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output := opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_7f56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3177_c7_edca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_cond;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output := opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_edca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3176_c7_2c62] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_cond;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output := opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_2c62_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3175_c7_587b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_cond;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output := opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_587b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3174_c7_fbae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_cond;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output := opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_fbae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3173_c7_d9fe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_cond;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output := opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_d9fe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3172_c7_af9d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_cond;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output := opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_af9d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3171_c7_acfd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_cond;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output := opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_acfd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3170_c7_2c4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_cond;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output := opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_2c4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3169_c7_0817] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_cond;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output := opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_0817_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3168_c7_7ec7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_cond;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output := opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_7ec7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3167_c7_4cd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_cond;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output := opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4cd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3166_c7_ac7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_cond;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output := opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_ac7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3165_c7_b1ed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_cond;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output := opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_b1ed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3164_c7_f64b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_cond;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output := opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_f64b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3163_c7_6155] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_cond;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output := opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_6155_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3162_c7_8dc4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_cond;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output := opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_8dc4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3161_c7_b514] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_cond;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output := opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_b514_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3160_c7_10d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_cond;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output := opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_10d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3159_c7_6e7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_cond;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output := opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_6e7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3158_c7_9734] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_cond;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output := opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_9734_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3157_c7_28ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_cond;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output := opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_28ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3156_c7_6747] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_cond;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output := opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_6747_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3155_c7_88f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_cond;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output := opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_88f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3154_c7_0e82] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_cond;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output := opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_0e82_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3153_c7_de35] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_cond;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output := opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_de35_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3152_c7_36b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_cond;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output := opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_36b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3151_c7_8d06] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_cond;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output := opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_8d06_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3150_c7_4ec7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_cond;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output := opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_4ec7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3149_c7_0d75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_cond;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output := opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_0d75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3148_c7_ac26] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_cond;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output := opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_ac26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3147_c7_4eb3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_cond;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output := opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_4eb3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3146_c7_4c97] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_cond;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output := opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_4c97_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3145_c7_41ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_cond;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output := opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_41ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3144_c7_f35a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_cond;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output := opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_f35a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3143_c7_65f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_cond;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output := opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_65f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3142_c7_6bda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_cond;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output := opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_6bda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3141_c7_712e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_cond;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output := opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_712e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3140_c7_52eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_cond;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output := opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_52eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3139_c7_c36d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_cond;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output := opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_c36d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3138_c7_553b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_cond;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output := opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_553b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3137_c7_0dfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_cond;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output := opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_0dfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3136_c2_3048] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_cond;
     opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output := opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3238_c34_bd36] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_bd36_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3219_c22_2aa0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_2aa0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3229_c3_87d4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_87d4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.device_ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3217_c82_e2ca] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_e2ca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3242_c32_f23d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_f23d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_176e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_176e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3235_c33_4f30] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_4f30_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3216_c19_0a88] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_0a88_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3236_c29_7cfb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_7cfb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3239_c37_112d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_112d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.vram_write_layer;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3241_c31_50c7] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_50c7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.vram_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3234_c23_623a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_623a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.pc;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3240_c33_9be3] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_9be3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.vram_address;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3212_l3210_DUPLICATE_fdf0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3212_l3210_DUPLICATE_fdf0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3230_c3_ac32] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_ac32_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3228_c3_0d87] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_0d87_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3237_c30_bebb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_bebb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3208_c6_066e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_066e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3233_c34_ece5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_ece5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_3048_return_output.is_pc_updated;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3212_l3210_DUPLICATE_fdf0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3212_l3210_DUPLICATE_fdf0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_ac32_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_066e_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_066e_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_176e_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_0a88_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_0a88_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_0d87_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_87d4_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_e2ca_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_2aa0_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_2aa0_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_6e31 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_6e31_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_ece5_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_623a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_4f30_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_7cfb_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_bebb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_bd36_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_112d_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_9be3_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_50c7_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_f23d_return_output);

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output;

     -- device_ram_update[uxn_opcodes_h_l3227_c26_f15c] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_device_address;
     device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_value;
     device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output := device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3210_c4_b77f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3212_c4_b581] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3210_c4_913f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_b77f_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3212_c4_8cef := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_b581_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output;
     VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_3a1e_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_6e31_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_6e31_return_output;
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_opcodes_h_l3227_c26_f15c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse := VAR_sp0_uxn_opcodes_h_l3212_c4_8cef;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue := VAR_sp1_uxn_opcodes_h_l3210_c4_913f;
     -- sp1_MUX[uxn_opcodes_h_l3209_c3_3c0d] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond;
     sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue;
     sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output := sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3209_c3_3c0d] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_cond;
     sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iftrue;
     sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output := sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output;

     -- MUX[uxn_opcodes_h_l3218_c20_54cd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3218_c20_54cd_cond <= VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_cond;
     MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue <= VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iftrue;
     MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse <= VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_return_output := MUX_uxn_opcodes_h_l3218_c20_54cd_return_output;

     -- Submodule level 148
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right := VAR_MUX_uxn_opcodes_h_l3218_c20_54cd_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_3c0d_return_output;
     -- sp0_MUX[uxn_opcodes_h_l3208_c2_34fe] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_cond;
     sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue;
     sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output := sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3208_c2_34fe] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_cond;
     sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iftrue;
     sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output := sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;
     VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_34fe_return_output;
     -- MUX[uxn_opcodes_h_l3217_c19_88c9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3217_c19_88c9_cond <= VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_cond;
     MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue <= VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iftrue;
     MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse <= VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_return_output := MUX_uxn_opcodes_h_l3217_c19_88c9_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left := VAR_MUX_uxn_opcodes_h_l3217_c19_88c9_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3217_c19_311f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3217_c2_50f7 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_311f_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left := VAR_stack_address_uxn_opcodes_h_l3217_c2_50f7;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3218_c2_c879] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output;

     -- Submodule level 152
     VAR_stack_address_uxn_opcodes_h_l3218_c2_511d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_c879_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3218_c2_511d;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address := VAR_stack_address_uxn_opcodes_h_l3218_c2_511d;
     -- stack_ram_update[uxn_opcodes_h_l3221_c21_0aea] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_stack_address;
     stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_value;
     stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output := stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_0aea_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
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
