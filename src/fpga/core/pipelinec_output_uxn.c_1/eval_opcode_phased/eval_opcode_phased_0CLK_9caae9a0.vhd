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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 374
entity eval_opcode_phased_0CLK_9caae9a0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_9caae9a0;
architecture arch of eval_opcode_phased_0CLK_9caae9a0 is
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
-- BIN_OP_AND[uxn_opcodes_h_l3131_c10_edfa]
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3131_c10_0300]
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3131_c41_0001]
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3131_c57_c061]
signal CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3131_c10_fdca]
signal MUX_uxn_opcodes_h_l3131_c10_fdca_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3131_c10_fdca_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3132_c18_38a4]
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3132_c18_442b]
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3132_c18_7177]
signal MUX_uxn_opcodes_h_l3132_c18_7177_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_7177_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_7177_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3132_c18_7177_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3136_c6_8205]
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_340c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3136_c2_5feb]
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_e99f]
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_e31c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_5c5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3137_c7_340c]
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3137_c41_3735]
signal jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_3735_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_3735_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3137_c41_3735_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_0327]
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_cc8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_aea5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3138_c7_5c5e]
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3138_c41_51be]
signal jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_51be_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_51be_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3138_c41_51be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_5a15]
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_5773]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_206e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3139_c7_aea5]
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3139_c41_f865]
signal jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_f865_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_f865_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3139_c41_f865_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e606]
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_ed20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_cbe7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3140_c7_206e]
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3140_c41_aff2]
signal lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_aff2_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_aff2_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3140_c41_aff2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_f967]
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_b6af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_cd56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3141_c7_cbe7]
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3141_c41_633e]
signal lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_633e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_633e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3141_c41_633e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_5d33]
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_6cf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_61cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3142_c7_cd56]
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3142_c41_a15e]
signal lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_a15e_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_a15e_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3142_c41_a15e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_6f52]
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_5868]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_6dfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3143_c7_61cd]
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3143_c41_690e]
signal lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_690e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_690e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3143_c41_690e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_6969]
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_3318]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_4353]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3144_c7_6dfe]
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3144_c41_4beb]
signal inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_4beb_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_4beb_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3144_c41_4beb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_d84f]
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_0911]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_2047]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3145_c7_4353]
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3145_c41_375c]
signal inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_375c_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_375c_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3145_c41_375c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_fa22]
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_409d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_cb8f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3146_c7_2047]
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3146_c41_d46b]
signal pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_d46b_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_d46b_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3146_c41_d46b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_cc29]
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_0422]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_d708]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3147_c7_cb8f]
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3147_c41_3d8a]
signal pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_3d8a_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_3d8a_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_62f0]
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_41f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_eaf3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3148_c7_d708]
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3148_c41_9c04]
signal nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_9c04_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_9c04_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3148_c41_9c04_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_fdb4]
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_d42c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_1ffd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3149_c7_eaf3]
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3149_c41_1bb7]
signal nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_1bb7_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_1bb7_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_dd8b]
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_75f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_10af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3150_c7_1ffd]
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3150_c41_e258]
signal swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_e258_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_e258_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3150_c41_e258_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_74bd]
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_9476]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_19aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3151_c7_10af]
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3151_c41_dce6]
signal swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_dce6_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_dce6_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3151_c41_dce6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_4877]
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_4c95]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_fe18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3152_c7_19aa]
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3152_c41_76e1]
signal rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_76e1_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_76e1_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3152_c41_76e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_8dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_0501]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_c9b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3153_c7_fe18]
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3153_c41_f09f]
signal rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_f09f_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_f09f_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3153_c41_f09f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_e292]
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_cbb1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_d1d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3154_c7_c9b6]
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3154_c41_06c8]
signal dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_06c8_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_06c8_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3154_c41_06c8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_0f62]
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_1d51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_61a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3155_c7_d1d6]
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3155_c41_4015]
signal dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_4015_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_4015_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3155_c41_4015_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_d780]
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_6534]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_4a8f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3156_c7_61a1]
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3156_c41_bee3]
signal ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_bee3_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_bee3_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3156_c41_bee3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_1e90]
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_63bb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_ce59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3157_c7_4a8f]
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3157_c41_66cf]
signal ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_66cf_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_66cf_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_005b]
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_1c7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_0fb3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3158_c7_ce59]
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3158_c41_41f8]
signal equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_41f8_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_41f8_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3158_c41_41f8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_727e]
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_2777]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_73d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3159_c7_0fb3]
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3159_c41_018b]
signal equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_018b_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_018b_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3159_c41_018b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_4f63]
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_bced]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_cc5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3160_c7_73d0]
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3160_c41_0fe2]
signal neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_0fe2_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_0fe2_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3160_c41_0fe2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_9469]
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_f15c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_f1c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3161_c7_cc5f]
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3161_c41_50d6]
signal neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_50d6_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_50d6_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3161_c41_50d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_25da]
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_25ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_ea64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3162_c7_f1c9]
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3162_c41_082a]
signal gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_082a_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_082a_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3162_c41_082a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_9c2d]
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_1a26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_15f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3163_c7_ea64]
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3163_c41_24d9]
signal gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_24d9_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_24d9_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3163_c41_24d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_8f51]
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_ada1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_3055]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3164_c7_15f8]
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3164_c41_5e8d]
signal lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_5e8d_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_5e8d_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3164_c41_5e8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_5cd9]
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_f859]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_3355]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3165_c7_3055]
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3165_c41_dfcc]
signal lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_dfcc_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_dfcc_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_e5c9]
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_1d6f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_4747]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3166_c7_3355]
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3166_c41_41aa]
signal jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_41aa_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_41aa_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_41aa_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3166_c41_41aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_a678]
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_250c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_0780]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3167_c7_4747]
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3167_c41_4598]
signal jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4598_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4598_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3167_c41_4598_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_13b8]
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_07ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_5439]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3168_c7_0780]
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3168_c41_a6e1]
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_99bf]
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_57cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_0bca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3169_c7_5439]
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3169_c41_f52b]
signal jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_f52b_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_f52b_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_66b8]
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_b97a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_db1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3170_c7_0bca]
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3170_c41_edfb]
signal jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_edfb_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_edfb_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_edfb_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3170_c41_edfb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_b61c]
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_937d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_09ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3171_c7_db1f]
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3171_c41_fcec]
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_66fe]
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_48df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_ecf2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3172_c7_09ab]
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3172_c41_69b4]
signal sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_69b4_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_69b4_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3172_c41_69b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_2326]
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_b0f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_d6ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3173_c7_ecf2]
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3173_c41_a325]
signal sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_a325_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_a325_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3173_c41_a325_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_b2c1]
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_9912]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_c491]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3174_c7_d6ea]
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3174_c41_1e8b]
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_5aa4]
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_70df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_b689]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3175_c7_c491]
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3175_c41_af7a]
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_a57d]
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_ffbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_d908]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3176_c7_b689]
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3176_c41_d876]
signal stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_d876_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_d876_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3176_c41_d876_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_22a0]
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_c204]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_50e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3177_c7_d908]
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3177_c41_5062]
signal stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_5062_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_5062_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3177_c41_5062_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_1a47]
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_edca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_2bc7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3178_c7_50e9]
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3178_c41_04f0]
signal ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3178_c41_04f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_8b37]
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_7d85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_c035]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3179_c7_2bc7]
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3179_c41_ae46]
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_c5ff]
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_91fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_0812]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3180_c7_c035]
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3180_c41_01ad]
signal str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_01ad_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_01ad_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_01ad_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3180_c41_01ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_3b87]
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_ccb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_9575]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3181_c7_0812]
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3181_c41_ca46]
signal str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_ca46_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_ca46_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_ca46_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3181_c41_ca46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_503a]
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_4407]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_688c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3182_c7_9575]
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3182_c41_8026]
signal lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_8026_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_8026_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3182_c41_8026_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_3981]
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_2e47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_3d61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3183_c7_688c]
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3183_c41_64a3]
signal lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_64a3_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_64a3_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3183_c41_64a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_2d8c]
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_41e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_8bc5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3184_c7_3d61]
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3184_c41_4d34]
signal sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_4d34_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_4d34_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3184_c41_4d34_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_cc56]
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_8e95]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_616d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3185_c7_8bc5]
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3185_c41_3834]
signal sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_3834_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_3834_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3185_c41_3834_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_731c]
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_b3e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_3479]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3186_c7_616d]
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3186_c41_c28a]
signal dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_c28a_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_c28a_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3186_c41_c28a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_225b]
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_134a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_4bbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3187_c7_3479]
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3187_c41_2cdb]
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_9e25]
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_cdd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_29e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3188_c7_4bbe]
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3188_c41_1652]
signal deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_1652_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_1652_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3188_c41_1652_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_2ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_d731]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_d675]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3189_c7_29e0]
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3189_c41_6e3c]
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_aeb7]
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_0e8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_7f18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3190_c7_d675]
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3190_c41_fa5e]
signal add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3190_c41_fa5e_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_fa5e_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3190_c41_fa5e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_37e2]
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_4491]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_16b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3191_c7_7f18]
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3191_c41_d40b]
signal add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_d40b_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_d40b_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3191_c41_d40b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_6db3]
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_1611]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_e72c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3192_c7_16b5]
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3192_c41_1cba]
signal sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_1cba_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_1cba_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3192_c41_1cba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_1281]
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_041b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_dfe5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3193_c7_e72c]
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3193_c41_0d91]
signal sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_0d91_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_0d91_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3193_c41_0d91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_db47]
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_d73b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_6b62]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3194_c7_dfe5]
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3194_c41_3be7]
signal mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_3be7_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_3be7_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3194_c41_3be7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_5b70]
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_7577]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_df04]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3195_c7_6b62]
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3195_c41_44a1]
signal mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_44a1_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_44a1_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3195_c41_44a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_af38]
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_52fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_beeb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3196_c7_df04]
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3196_c41_53b2]
signal div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3196_c41_53b2_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_53b2_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3196_c41_53b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_4236]
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_d07e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_fdaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3197_c7_beeb]
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3197_c41_16c6]
signal div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_16c6_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_16c6_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3197_c41_16c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_7817]
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_41e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_3184]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3198_c7_fdaa]
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3198_c41_d5ba]
signal and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3198_c41_d5ba_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_d5ba_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3198_c41_d5ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_8d07]
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_0cb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_7f99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3199_c7_3184]
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3199_c41_7d81]
signal and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_7d81_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_7d81_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3199_c41_7d81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_9064]
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_7bbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_bfc5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3200_c7_7f99]
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3200_c41_3882]
signal ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_3882_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_3882_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3200_c41_3882_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_58ca]
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_a90c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c7_f195]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3201_c7_bfc5]
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3201_c41_4150]
signal ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_4150_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_4150_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3201_c41_4150_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3202_c11_5091]
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_36ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c7_4f85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3202_c7_f195]
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3202_c41_0321]
signal eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_0321_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_0321_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3202_c41_0321_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3203_c11_b607]
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c1_38d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c7_5f74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3203_c7_4f85]
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3203_c41_e700]
signal eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_e700_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_e700_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3203_c41_e700_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_70d9]
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c1_75e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c7_18c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3204_c7_5f74]
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3204_c41_a9bb]
signal sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_a9bb_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_a9bb_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3204_c41_a9bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_0076]
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c1_fb14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3206_c1_4f7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3205_c7_18c1]
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3205_c41_52e8]
signal sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_52e8_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_52e8_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3205_c41_52e8_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3206_c9_0eab[uxn_opcodes_h_l3206_c9_0eab]
signal printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3208_c2_1e57]
signal sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3208_c2_1e57]
signal sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3209_c3_eb6a]
signal sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3209_c3_eb6a]
signal sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3210_c4_6704]
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3212_c4_f71d]
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3217_c19_2d7e]
signal MUX_uxn_opcodes_h_l3217_c19_2d7e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3217_c19_b530]
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l3218_c20_2efb]
signal MUX_uxn_opcodes_h_l3218_c20_2efb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3218_c20_2efb_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3218_c2_b044]
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output : unsigned(16 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3221_c21_465a]
signal stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address : unsigned(15 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l3227_c26_e341]
signal device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_e341_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa
BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left,
BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right,
BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300
BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left,
BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right,
BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001
BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left,
BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right,
BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3131_c57_c061
CONST_SL_4_uxn_opcodes_h_l3131_c57_c061 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x,
CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output);

-- MUX_uxn_opcodes_h_l3131_c10_fdca
MUX_uxn_opcodes_h_l3131_c10_fdca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3131_c10_fdca_cond,
MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue,
MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse,
MUX_uxn_opcodes_h_l3131_c10_fdca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4
BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left,
BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right,
BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b
BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left,
BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right,
BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output);

-- MUX_uxn_opcodes_h_l3132_c18_7177
MUX_uxn_opcodes_h_l3132_c18_7177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3132_c18_7177_cond,
MUX_uxn_opcodes_h_l3132_c18_7177_iftrue,
MUX_uxn_opcodes_h_l3132_c18_7177_iffalse,
MUX_uxn_opcodes_h_l3132_c18_7177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left,
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right,
BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb
opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond,
opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3137_c7_340c
opc_result_MUX_uxn_opcodes_h_l3137_c7_340c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond,
opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output);

-- jci_uxn_opcodes_h_l3137_c41_3735
jci_uxn_opcodes_h_l3137_c41_3735 : entity work.jci_0CLK_67fe881f port map (
clk,
jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3137_c41_3735_phase,
jci_uxn_opcodes_h_l3137_c41_3735_pc,
jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read,
jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read,
jci_uxn_opcodes_h_l3137_c41_3735_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right,
BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e
opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond,
opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output);

-- jmi_uxn_opcodes_h_l3138_c41_51be
jmi_uxn_opcodes_h_l3138_c41_51be : entity work.jmi_0CLK_17cc5023 port map (
clk,
jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3138_c41_51be_phase,
jmi_uxn_opcodes_h_l3138_c41_51be_pc,
jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read,
jmi_uxn_opcodes_h_l3138_c41_51be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5
opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond,
opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output);

-- jsi_uxn_opcodes_h_l3139_c41_f865
jsi_uxn_opcodes_h_l3139_c41_f865 : entity work.jsi_0CLK_50a1b8d0 port map (
clk,
jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3139_c41_f865_phase,
jsi_uxn_opcodes_h_l3139_c41_f865_pc,
jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read,
jsi_uxn_opcodes_h_l3139_c41_f865_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3140_c7_206e
opc_result_MUX_uxn_opcodes_h_l3140_c7_206e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond,
opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output);

-- lit_uxn_opcodes_h_l3140_c41_aff2
lit_uxn_opcodes_h_l3140_c41_aff2 : entity work.lit_0CLK_23e8fd15 port map (
clk,
lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3140_c41_aff2_phase,
lit_uxn_opcodes_h_l3140_c41_aff2_pc,
lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read,
lit_uxn_opcodes_h_l3140_c41_aff2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7
opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond,
opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output);

-- lit2_uxn_opcodes_h_l3141_c41_633e
lit2_uxn_opcodes_h_l3141_c41_633e : entity work.lit2_0CLK_90fc2573 port map (
clk,
lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3141_c41_633e_phase,
lit2_uxn_opcodes_h_l3141_c41_633e_pc,
lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read,
lit2_uxn_opcodes_h_l3141_c41_633e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right,
BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56
opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond,
opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue,
opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse,
opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output);

-- lit_uxn_opcodes_h_l3142_c41_a15e
lit_uxn_opcodes_h_l3142_c41_a15e : entity work.lit_0CLK_23e8fd15 port map (
clk,
lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3142_c41_a15e_phase,
lit_uxn_opcodes_h_l3142_c41_a15e_pc,
lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read,
lit_uxn_opcodes_h_l3142_c41_a15e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd
opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond,
opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output);

-- lit2_uxn_opcodes_h_l3143_c41_690e
lit2_uxn_opcodes_h_l3143_c41_690e : entity work.lit2_0CLK_90fc2573 port map (
clk,
lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3143_c41_690e_phase,
lit2_uxn_opcodes_h_l3143_c41_690e_pc,
lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read,
lit2_uxn_opcodes_h_l3143_c41_690e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right,
BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe
opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond,
opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue,
opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse,
opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output);

-- inc_uxn_opcodes_h_l3144_c41_4beb
inc_uxn_opcodes_h_l3144_c41_4beb : entity work.inc_0CLK_17cc5023 port map (
clk,
inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3144_c41_4beb_phase,
inc_uxn_opcodes_h_l3144_c41_4beb_ins,
inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read,
inc_uxn_opcodes_h_l3144_c41_4beb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3145_c7_4353
opc_result_MUX_uxn_opcodes_h_l3145_c7_4353 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond,
opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue,
opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse,
opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output);

-- inc2_uxn_opcodes_h_l3145_c41_375c
inc2_uxn_opcodes_h_l3145_c41_375c : entity work.inc2_0CLK_5110df32 port map (
clk,
inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3145_c41_375c_phase,
inc2_uxn_opcodes_h_l3145_c41_375c_ins,
inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read,
inc2_uxn_opcodes_h_l3145_c41_375c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right,
BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3146_c7_2047
opc_result_MUX_uxn_opcodes_h_l3146_c7_2047 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond,
opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue,
opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse,
opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output);

-- pop_uxn_opcodes_h_l3146_c41_d46b
pop_uxn_opcodes_h_l3146_c41_d46b : entity work.pop_0CLK_25f4cd11 port map (
clk,
pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3146_c41_d46b_phase,
pop_uxn_opcodes_h_l3146_c41_d46b_ins,
pop_uxn_opcodes_h_l3146_c41_d46b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right,
BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f
opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond,
opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output);

-- pop2_uxn_opcodes_h_l3147_c41_3d8a
pop2_uxn_opcodes_h_l3147_c41_3d8a : entity work.pop2_0CLK_25f4cd11 port map (
clk,
pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3147_c41_3d8a_phase,
pop2_uxn_opcodes_h_l3147_c41_3d8a_ins,
pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3148_c7_d708
opc_result_MUX_uxn_opcodes_h_l3148_c7_d708 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond,
opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue,
opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse,
opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output);

-- nip_uxn_opcodes_h_l3148_c41_9c04
nip_uxn_opcodes_h_l3148_c41_9c04 : entity work.nip_0CLK_d7ba9283 port map (
clk,
nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3148_c41_9c04_phase,
nip_uxn_opcodes_h_l3148_c41_9c04_ins,
nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read,
nip_uxn_opcodes_h_l3148_c41_9c04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3
opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond,
opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output);

-- nip2_uxn_opcodes_h_l3149_c41_1bb7
nip2_uxn_opcodes_h_l3149_c41_1bb7 : entity work.nip2_0CLK_68908aa0 port map (
clk,
nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3149_c41_1bb7_phase,
nip2_uxn_opcodes_h_l3149_c41_1bb7_ins,
nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read,
nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right,
BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd
opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output);

-- swp_uxn_opcodes_h_l3150_c41_e258
swp_uxn_opcodes_h_l3150_c41_e258 : entity work.swp_0CLK_af8c339b port map (
clk,
swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3150_c41_e258_phase,
swp_uxn_opcodes_h_l3150_c41_e258_ins,
swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read,
swp_uxn_opcodes_h_l3150_c41_e258_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3151_c7_10af
opc_result_MUX_uxn_opcodes_h_l3151_c7_10af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond,
opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue,
opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse,
opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output);

-- swp2_uxn_opcodes_h_l3151_c41_dce6
swp2_uxn_opcodes_h_l3151_c41_dce6 : entity work.swp2_0CLK_3917d858 port map (
clk,
swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3151_c41_dce6_phase,
swp2_uxn_opcodes_h_l3151_c41_dce6_ins,
swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read,
swp2_uxn_opcodes_h_l3151_c41_dce6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right,
BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa
opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond,
opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output);

-- rot_uxn_opcodes_h_l3152_c41_76e1
rot_uxn_opcodes_h_l3152_c41_76e1 : entity work.rot_0CLK_5c24fb49 port map (
clk,
rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3152_c41_76e1_phase,
rot_uxn_opcodes_h_l3152_c41_76e1_ins,
rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read,
rot_uxn_opcodes_h_l3152_c41_76e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18
opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond,
opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue,
opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse,
opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output);

-- rot2_uxn_opcodes_h_l3153_c41_f09f
rot2_uxn_opcodes_h_l3153_c41_f09f : entity work.rot2_0CLK_673e9af1 port map (
clk,
rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3153_c41_f09f_phase,
rot2_uxn_opcodes_h_l3153_c41_f09f_ins,
rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read,
rot2_uxn_opcodes_h_l3153_c41_f09f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right,
BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6
opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond,
opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output);

-- dup_uxn_opcodes_h_l3154_c41_06c8
dup_uxn_opcodes_h_l3154_c41_06c8 : entity work.dup_0CLK_6d5e0476 port map (
clk,
dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3154_c41_06c8_phase,
dup_uxn_opcodes_h_l3154_c41_06c8_ins,
dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read,
dup_uxn_opcodes_h_l3154_c41_06c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6
opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond,
opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output);

-- dup2_uxn_opcodes_h_l3155_c41_4015
dup2_uxn_opcodes_h_l3155_c41_4015 : entity work.dup2_0CLK_cf70ec0f port map (
clk,
dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3155_c41_4015_phase,
dup2_uxn_opcodes_h_l3155_c41_4015_ins,
dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read,
dup2_uxn_opcodes_h_l3155_c41_4015_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right,
BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1
opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond,
opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output);

-- ovr_uxn_opcodes_h_l3156_c41_bee3
ovr_uxn_opcodes_h_l3156_c41_bee3 : entity work.ovr_0CLK_7c2e709f port map (
clk,
ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3156_c41_bee3_phase,
ovr_uxn_opcodes_h_l3156_c41_bee3_ins,
ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read,
ovr_uxn_opcodes_h_l3156_c41_bee3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f
opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond,
opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output);

-- ovr2_uxn_opcodes_h_l3157_c41_66cf
ovr2_uxn_opcodes_h_l3157_c41_66cf : entity work.ovr2_0CLK_9bc49f6a port map (
clk,
ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3157_c41_66cf_phase,
ovr2_uxn_opcodes_h_l3157_c41_66cf_ins,
ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read,
ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59
opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond,
opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue,
opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse,
opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output);

-- equ_uxn_opcodes_h_l3158_c41_41f8
equ_uxn_opcodes_h_l3158_c41_41f8 : entity work.equ_0CLK_3d5a5eea port map (
clk,
equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3158_c41_41f8_phase,
equ_uxn_opcodes_h_l3158_c41_41f8_ins,
equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read,
equ_uxn_opcodes_h_l3158_c41_41f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right,
BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3
opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond,
opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output);

-- equ2_uxn_opcodes_h_l3159_c41_018b
equ2_uxn_opcodes_h_l3159_c41_018b : entity work.equ2_0CLK_c7083908 port map (
clk,
equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3159_c41_018b_phase,
equ2_uxn_opcodes_h_l3159_c41_018b_ins,
equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read,
equ2_uxn_opcodes_h_l3159_c41_018b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right,
BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0
opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond,
opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output);

-- neq_uxn_opcodes_h_l3160_c41_0fe2
neq_uxn_opcodes_h_l3160_c41_0fe2 : entity work.neq_0CLK_3d5a5eea port map (
clk,
neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3160_c41_0fe2_phase,
neq_uxn_opcodes_h_l3160_c41_0fe2_ins,
neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read,
neq_uxn_opcodes_h_l3160_c41_0fe2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f
opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output);

-- neq2_uxn_opcodes_h_l3161_c41_50d6
neq2_uxn_opcodes_h_l3161_c41_50d6 : entity work.neq2_0CLK_c7083908 port map (
clk,
neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3161_c41_50d6_phase,
neq2_uxn_opcodes_h_l3161_c41_50d6_ins,
neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read,
neq2_uxn_opcodes_h_l3161_c41_50d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right,
BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9
opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond,
opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output);

-- gth_uxn_opcodes_h_l3162_c41_082a
gth_uxn_opcodes_h_l3162_c41_082a : entity work.gth_0CLK_3d5a5eea port map (
clk,
gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3162_c41_082a_phase,
gth_uxn_opcodes_h_l3162_c41_082a_ins,
gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read,
gth_uxn_opcodes_h_l3162_c41_082a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64
opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond,
opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue,
opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse,
opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output);

-- gth2_uxn_opcodes_h_l3163_c41_24d9
gth2_uxn_opcodes_h_l3163_c41_24d9 : entity work.gth2_0CLK_c7083908 port map (
clk,
gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3163_c41_24d9_phase,
gth2_uxn_opcodes_h_l3163_c41_24d9_ins,
gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read,
gth2_uxn_opcodes_h_l3163_c41_24d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right,
BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8
opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond,
opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output);

-- lth_uxn_opcodes_h_l3164_c41_5e8d
lth_uxn_opcodes_h_l3164_c41_5e8d : entity work.lth_0CLK_3d5a5eea port map (
clk,
lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3164_c41_5e8d_phase,
lth_uxn_opcodes_h_l3164_c41_5e8d_ins,
lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read,
lth_uxn_opcodes_h_l3164_c41_5e8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3165_c7_3055
opc_result_MUX_uxn_opcodes_h_l3165_c7_3055 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse,
opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output);

-- lth2_uxn_opcodes_h_l3165_c41_dfcc
lth2_uxn_opcodes_h_l3165_c41_dfcc : entity work.lth2_0CLK_c7083908 port map (
clk,
lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3165_c41_dfcc_phase,
lth2_uxn_opcodes_h_l3165_c41_dfcc_ins,
lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read,
lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3166_c7_3355
opc_result_MUX_uxn_opcodes_h_l3166_c7_3355 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond,
opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue,
opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse,
opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output);

-- jmp_uxn_opcodes_h_l3166_c41_41aa
jmp_uxn_opcodes_h_l3166_c41_41aa : entity work.jmp_0CLK_23e8fd15 port map (
clk,
jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3166_c41_41aa_phase,
jmp_uxn_opcodes_h_l3166_c41_41aa_ins,
jmp_uxn_opcodes_h_l3166_c41_41aa_pc,
jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read,
jmp_uxn_opcodes_h_l3166_c41_41aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right,
BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3167_c7_4747
opc_result_MUX_uxn_opcodes_h_l3167_c7_4747 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse,
opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output);

-- jmp2_uxn_opcodes_h_l3167_c41_4598
jmp2_uxn_opcodes_h_l3167_c41_4598 : entity work.jmp2_0CLK_8b7cd1f2 port map (
clk,
jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3167_c41_4598_phase,
jmp2_uxn_opcodes_h_l3167_c41_4598_ins,
jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read,
jmp2_uxn_opcodes_h_l3167_c41_4598_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right,
BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3168_c7_0780
opc_result_MUX_uxn_opcodes_h_l3168_c7_0780 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond,
opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue,
opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse,
opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output);

-- jcn_uxn_opcodes_h_l3168_c41_a6e1
jcn_uxn_opcodes_h_l3168_c41_a6e1 : entity work.jcn_0CLK_81936ba3 port map (
clk,
jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3168_c41_a6e1_phase,
jcn_uxn_opcodes_h_l3168_c41_a6e1_ins,
jcn_uxn_opcodes_h_l3168_c41_a6e1_pc,
jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read,
jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right,
BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3169_c7_5439
opc_result_MUX_uxn_opcodes_h_l3169_c7_5439 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond,
opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue,
opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse,
opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output);

-- jcn2_uxn_opcodes_h_l3169_c41_f52b
jcn2_uxn_opcodes_h_l3169_c41_f52b : entity work.jcn2_0CLK_1b48da32 port map (
clk,
jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3169_c41_f52b_phase,
jcn2_uxn_opcodes_h_l3169_c41_f52b_ins,
jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read,
jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca
opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond,
opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue,
opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse,
opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output);

-- jsr_uxn_opcodes_h_l3170_c41_edfb
jsr_uxn_opcodes_h_l3170_c41_edfb : entity work.jsr_0CLK_c26dda62 port map (
clk,
jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3170_c41_edfb_phase,
jsr_uxn_opcodes_h_l3170_c41_edfb_ins,
jsr_uxn_opcodes_h_l3170_c41_edfb_pc,
jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read,
jsr_uxn_opcodes_h_l3170_c41_edfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right,
BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f
opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond,
opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output);

-- jsr2_uxn_opcodes_h_l3171_c41_fcec
jsr2_uxn_opcodes_h_l3171_c41_fcec : entity work.jsr2_0CLK_85c87c86 port map (
clk,
jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3171_c41_fcec_phase,
jsr2_uxn_opcodes_h_l3171_c41_fcec_ins,
jsr2_uxn_opcodes_h_l3171_c41_fcec_pc,
jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read,
jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right,
BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab
opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond,
opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output);

-- sth_uxn_opcodes_h_l3172_c41_69b4
sth_uxn_opcodes_h_l3172_c41_69b4 : entity work.sth_0CLK_26284888 port map (
clk,
sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3172_c41_69b4_phase,
sth_uxn_opcodes_h_l3172_c41_69b4_ins,
sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read,
sth_uxn_opcodes_h_l3172_c41_69b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2
opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond,
opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output);

-- sth2_uxn_opcodes_h_l3173_c41_a325
sth2_uxn_opcodes_h_l3173_c41_a325 : entity work.sth2_0CLK_f1f3c8fd port map (
clk,
sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3173_c41_a325_phase,
sth2_uxn_opcodes_h_l3173_c41_a325_ins,
sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read,
sth2_uxn_opcodes_h_l3173_c41_a325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right,
BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse,
opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output);

-- ldz_uxn_opcodes_h_l3174_c41_1e8b
ldz_uxn_opcodes_h_l3174_c41_1e8b : entity work.ldz_0CLK_81936ba3 port map (
clk,
ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3174_c41_1e8b_phase,
ldz_uxn_opcodes_h_l3174_c41_1e8b_ins,
ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read,
ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read,
ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right,
BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3175_c7_c491
opc_result_MUX_uxn_opcodes_h_l3175_c7_c491 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond,
opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue,
opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse,
opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output);

-- ldz2_uxn_opcodes_h_l3175_c41_af7a
ldz2_uxn_opcodes_h_l3175_c41_af7a : entity work.ldz2_0CLK_f1c92b33 port map (
clk,
ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3175_c41_af7a_phase,
ldz2_uxn_opcodes_h_l3175_c41_af7a_ins,
ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read,
ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read,
ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right,
BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3176_c7_b689
opc_result_MUX_uxn_opcodes_h_l3176_c7_b689 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond,
opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue,
opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse,
opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output);

-- stz_uxn_opcodes_h_l3176_c41_d876
stz_uxn_opcodes_h_l3176_c41_d876 : entity work.stz_0CLK_edc09f97 port map (
clk,
stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3176_c41_d876_phase,
stz_uxn_opcodes_h_l3176_c41_d876_ins,
stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read,
stz_uxn_opcodes_h_l3176_c41_d876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right,
BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3177_c7_d908
opc_result_MUX_uxn_opcodes_h_l3177_c7_d908 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond,
opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue,
opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse,
opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output);

-- stz2_uxn_opcodes_h_l3177_c41_5062
stz2_uxn_opcodes_h_l3177_c41_5062 : entity work.stz2_0CLK_86d21d89 port map (
clk,
stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3177_c41_5062_phase,
stz2_uxn_opcodes_h_l3177_c41_5062_ins,
stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read,
stz2_uxn_opcodes_h_l3177_c41_5062_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9
opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond,
opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output);

-- ldr_uxn_opcodes_h_l3178_c41_04f0
ldr_uxn_opcodes_h_l3178_c41_04f0 : entity work.ldr_0CLK_df07acae port map (
clk,
ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3178_c41_04f0_phase,
ldr_uxn_opcodes_h_l3178_c41_04f0_ins,
ldr_uxn_opcodes_h_l3178_c41_04f0_pc,
ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read,
ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read,
ldr_uxn_opcodes_h_l3178_c41_04f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right,
BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7
opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond,
opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output);

-- ldr2_uxn_opcodes_h_l3179_c41_ae46
ldr2_uxn_opcodes_h_l3179_c41_ae46 : entity work.ldr2_0CLK_f1c92b33 port map (
clk,
ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3179_c41_ae46_phase,
ldr2_uxn_opcodes_h_l3179_c41_ae46_ins,
ldr2_uxn_opcodes_h_l3179_c41_ae46_pc,
ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read,
ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read,
ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right,
BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3180_c7_c035
opc_result_MUX_uxn_opcodes_h_l3180_c7_c035 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond,
opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue,
opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse,
opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output);

-- str1_uxn_opcodes_h_l3180_c41_01ad
str1_uxn_opcodes_h_l3180_c41_01ad : entity work.str1_0CLK_3d5a5eea port map (
clk,
str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3180_c41_01ad_phase,
str1_uxn_opcodes_h_l3180_c41_01ad_ins,
str1_uxn_opcodes_h_l3180_c41_01ad_pc,
str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read,
str1_uxn_opcodes_h_l3180_c41_01ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3181_c7_0812
opc_result_MUX_uxn_opcodes_h_l3181_c7_0812 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond,
opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue,
opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse,
opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output);

-- str2_uxn_opcodes_h_l3181_c41_ca46
str2_uxn_opcodes_h_l3181_c41_ca46 : entity work.str2_0CLK_86d21d89 port map (
clk,
str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3181_c41_ca46_phase,
str2_uxn_opcodes_h_l3181_c41_ca46_ins,
str2_uxn_opcodes_h_l3181_c41_ca46_pc,
str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read,
str2_uxn_opcodes_h_l3181_c41_ca46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right,
BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3182_c7_9575
opc_result_MUX_uxn_opcodes_h_l3182_c7_9575 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond,
opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue,
opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse,
opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output);

-- lda_uxn_opcodes_h_l3182_c41_8026
lda_uxn_opcodes_h_l3182_c41_8026 : entity work.lda_0CLK_1b48da32 port map (
clk,
lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3182_c41_8026_phase,
lda_uxn_opcodes_h_l3182_c41_8026_ins,
lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read,
lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read,
lda_uxn_opcodes_h_l3182_c41_8026_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right,
BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3183_c7_688c
opc_result_MUX_uxn_opcodes_h_l3183_c7_688c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond,
opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output);

-- lda2_uxn_opcodes_h_l3183_c41_64a3
lda2_uxn_opcodes_h_l3183_c41_64a3 : entity work.lda2_0CLK_e5fcbde3 port map (
clk,
lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3183_c41_64a3_phase,
lda2_uxn_opcodes_h_l3183_c41_64a3_ins,
lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read,
lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read,
lda2_uxn_opcodes_h_l3183_c41_64a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right,
BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61
opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond,
opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue,
opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse,
opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output);

-- sta_uxn_opcodes_h_l3184_c41_4d34
sta_uxn_opcodes_h_l3184_c41_4d34 : entity work.sta_0CLK_6c9b19c4 port map (
clk,
sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3184_c41_4d34_phase,
sta_uxn_opcodes_h_l3184_c41_4d34_ins,
sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read,
sta_uxn_opcodes_h_l3184_c41_4d34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right,
BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5
opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output);

-- sta2_uxn_opcodes_h_l3185_c41_3834
sta2_uxn_opcodes_h_l3185_c41_3834 : entity work.sta2_0CLK_4067a010 port map (
clk,
sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3185_c41_3834_phase,
sta2_uxn_opcodes_h_l3185_c41_3834_ins,
sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read,
sta2_uxn_opcodes_h_l3185_c41_3834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right,
BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3186_c7_616d
opc_result_MUX_uxn_opcodes_h_l3186_c7_616d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond,
opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output);

-- dei_uxn_opcodes_h_l3186_c41_c28a
dei_uxn_opcodes_h_l3186_c41_c28a : entity work.dei_0CLK_d3ae3eee port map (
clk,
dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3186_c41_c28a_phase,
dei_uxn_opcodes_h_l3186_c41_c28a_ins,
dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read,
dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read,
dei_uxn_opcodes_h_l3186_c41_c28a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3187_c7_3479
opc_result_MUX_uxn_opcodes_h_l3187_c7_3479 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond,
opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue,
opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse,
opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output);

-- dei2_uxn_opcodes_h_l3187_c41_2cdb
dei2_uxn_opcodes_h_l3187_c41_2cdb : entity work.dei2_0CLK_555fb5fd port map (
clk,
dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3187_c41_2cdb_phase,
dei2_uxn_opcodes_h_l3187_c41_2cdb_ins,
dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read,
dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read,
dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right,
BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe
opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond,
opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue,
opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse,
opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output);

-- deo_uxn_opcodes_h_l3188_c41_1652
deo_uxn_opcodes_h_l3188_c41_1652 : entity work.deo_0CLK_fad737c5 port map (
clk,
deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3188_c41_1652_phase,
deo_uxn_opcodes_h_l3188_c41_1652_ins,
deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read,
deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read,
deo_uxn_opcodes_h_l3188_c41_1652_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0
opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond,
opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output);

-- deo2_uxn_opcodes_h_l3189_c41_6e3c
deo2_uxn_opcodes_h_l3189_c41_6e3c : entity work.deo2_0CLK_2a7cbe56 port map (
clk,
deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3189_c41_6e3c_phase,
deo2_uxn_opcodes_h_l3189_c41_6e3c_ins,
deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read,
deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read,
deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right,
BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3190_c7_d675
opc_result_MUX_uxn_opcodes_h_l3190_c7_d675 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond,
opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue,
opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse,
opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output);

-- add_uxn_opcodes_h_l3190_c41_fa5e
add_uxn_opcodes_h_l3190_c41_fa5e : entity work.add_0CLK_edc09f97 port map (
clk,
add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE,
add_uxn_opcodes_h_l3190_c41_fa5e_phase,
add_uxn_opcodes_h_l3190_c41_fa5e_ins,
add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read,
add_uxn_opcodes_h_l3190_c41_fa5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right,
BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18
opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond,
opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue,
opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse,
opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output);

-- add2_uxn_opcodes_h_l3191_c41_d40b
add2_uxn_opcodes_h_l3191_c41_d40b : entity work.add2_0CLK_c89b169c port map (
clk,
add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3191_c41_d40b_phase,
add2_uxn_opcodes_h_l3191_c41_d40b_ins,
add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read,
add2_uxn_opcodes_h_l3191_c41_d40b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right,
BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5
opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond,
opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output);

-- sub_uxn_opcodes_h_l3192_c41_1cba
sub_uxn_opcodes_h_l3192_c41_1cba : entity work.sub_0CLK_edc09f97 port map (
clk,
sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3192_c41_1cba_phase,
sub_uxn_opcodes_h_l3192_c41_1cba_ins,
sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read,
sub_uxn_opcodes_h_l3192_c41_1cba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c
opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond,
opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output);

-- sub2_uxn_opcodes_h_l3193_c41_0d91
sub2_uxn_opcodes_h_l3193_c41_0d91 : entity work.sub2_0CLK_c89b169c port map (
clk,
sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3193_c41_0d91_phase,
sub2_uxn_opcodes_h_l3193_c41_0d91_ins,
sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read,
sub2_uxn_opcodes_h_l3193_c41_0d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right,
BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5
opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond,
opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output);

-- mul_uxn_opcodes_h_l3194_c41_3be7
mul_uxn_opcodes_h_l3194_c41_3be7 : entity work.mul_0CLK_edc09f97 port map (
clk,
mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3194_c41_3be7_phase,
mul_uxn_opcodes_h_l3194_c41_3be7_ins,
mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read,
mul_uxn_opcodes_h_l3194_c41_3be7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right,
BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62
opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond,
opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue,
opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse,
opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output);

-- mul2_uxn_opcodes_h_l3195_c41_44a1
mul2_uxn_opcodes_h_l3195_c41_44a1 : entity work.mul2_0CLK_c89b169c port map (
clk,
mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3195_c41_44a1_phase,
mul2_uxn_opcodes_h_l3195_c41_44a1_ins,
mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read,
mul2_uxn_opcodes_h_l3195_c41_44a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right,
BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3196_c7_df04
opc_result_MUX_uxn_opcodes_h_l3196_c7_df04 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond,
opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue,
opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse,
opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output);

-- div_uxn_opcodes_h_l3196_c41_53b2
div_uxn_opcodes_h_l3196_c41_53b2 : entity work.div_0CLK_76610a9c port map (
clk,
div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE,
div_uxn_opcodes_h_l3196_c41_53b2_phase,
div_uxn_opcodes_h_l3196_c41_53b2_ins,
div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read,
div_uxn_opcodes_h_l3196_c41_53b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb
opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond,
opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output);

-- div2_uxn_opcodes_h_l3197_c41_16c6
div2_uxn_opcodes_h_l3197_c41_16c6 : entity work.div2_0CLK_33db19bd port map (
clk,
div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3197_c41_16c6_phase,
div2_uxn_opcodes_h_l3197_c41_16c6_ins,
div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read,
div2_uxn_opcodes_h_l3197_c41_16c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right,
BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa
opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond,
opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output);

-- and_uxn_opcodes_h_l3198_c41_d5ba
and_uxn_opcodes_h_l3198_c41_d5ba : entity work.and_0CLK_edc09f97 port map (
clk,
and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE,
and_uxn_opcodes_h_l3198_c41_d5ba_phase,
and_uxn_opcodes_h_l3198_c41_d5ba_ins,
and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read,
and_uxn_opcodes_h_l3198_c41_d5ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right,
BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3199_c7_3184
opc_result_MUX_uxn_opcodes_h_l3199_c7_3184 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond,
opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue,
opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse,
opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output);

-- and2_uxn_opcodes_h_l3199_c41_7d81
and2_uxn_opcodes_h_l3199_c41_7d81 : entity work.and2_0CLK_c89b169c port map (
clk,
and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3199_c41_7d81_phase,
and2_uxn_opcodes_h_l3199_c41_7d81_ins,
and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read,
and2_uxn_opcodes_h_l3199_c41_7d81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right,
BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99
opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond,
opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue,
opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse,
opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output);

-- ora_uxn_opcodes_h_l3200_c41_3882
ora_uxn_opcodes_h_l3200_c41_3882 : entity work.ora_0CLK_edc09f97 port map (
clk,
ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3200_c41_3882_phase,
ora_uxn_opcodes_h_l3200_c41_3882_ins,
ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read,
ora_uxn_opcodes_h_l3200_c41_3882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5
opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond,
opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output);

-- ora2_uxn_opcodes_h_l3201_c41_4150
ora2_uxn_opcodes_h_l3201_c41_4150 : entity work.ora2_0CLK_c89b169c port map (
clk,
ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3201_c41_4150_phase,
ora2_uxn_opcodes_h_l3201_c41_4150_ins,
ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read,
ora2_uxn_opcodes_h_l3201_c41_4150_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left,
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right,
BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3202_c7_f195
opc_result_MUX_uxn_opcodes_h_l3202_c7_f195 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond,
opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue,
opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse,
opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output);

-- eor_uxn_opcodes_h_l3202_c41_0321
eor_uxn_opcodes_h_l3202_c41_0321 : entity work.eor_0CLK_edc09f97 port map (
clk,
eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3202_c41_0321_phase,
eor_uxn_opcodes_h_l3202_c41_0321_ins,
eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read,
eor_uxn_opcodes_h_l3202_c41_0321_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left,
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right,
BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85
opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond,
opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue,
opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse,
opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output);

-- eor2_uxn_opcodes_h_l3203_c41_e700
eor2_uxn_opcodes_h_l3203_c41_e700 : entity work.eor2_0CLK_c89b169c port map (
clk,
eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3203_c41_e700_phase,
eor2_uxn_opcodes_h_l3203_c41_e700_ins,
eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read,
eor2_uxn_opcodes_h_l3203_c41_e700_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right,
BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74
opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond,
opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue,
opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse,
opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output);

-- sft_uxn_opcodes_h_l3204_c41_a9bb
sft_uxn_opcodes_h_l3204_c41_a9bb : entity work.sft_0CLK_c01cd3f8 port map (
clk,
sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3204_c41_a9bb_phase,
sft_uxn_opcodes_h_l3204_c41_a9bb_ins,
sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read,
sft_uxn_opcodes_h_l3204_c41_a9bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1
opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond,
opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output);

-- sft2_uxn_opcodes_h_l3205_c41_52e8
sft2_uxn_opcodes_h_l3205_c41_52e8 : entity work.sft2_0CLK_9a11c28f port map (
clk,
sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3205_c41_52e8_phase,
sft2_uxn_opcodes_h_l3205_c41_52e8_ins,
sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read,
sft2_uxn_opcodes_h_l3205_c41_52e8_return_output);

-- printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab
printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab : entity work.printf_uxn_opcodes_h_l3206_c9_0eab_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0);

-- sp0_MUX_uxn_opcodes_h_l3208_c2_1e57
sp0_MUX_uxn_opcodes_h_l3208_c2_1e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond,
sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue,
sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse,
sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output);

-- sp1_MUX_uxn_opcodes_h_l3208_c2_1e57
sp1_MUX_uxn_opcodes_h_l3208_c2_1e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond,
sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue,
sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse,
sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output);

-- sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a
sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond,
sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue,
sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse,
sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output);

-- sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a
sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond,
sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue,
sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse,
sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left,
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right,
BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left,
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right,
BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output);

-- MUX_uxn_opcodes_h_l3217_c19_2d7e
MUX_uxn_opcodes_h_l3217_c19_2d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3217_c19_2d7e_cond,
MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue,
MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse,
MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left,
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right,
BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output);

-- MUX_uxn_opcodes_h_l3218_c20_2efb
MUX_uxn_opcodes_h_l3218_c20_2efb : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3218_c20_2efb_cond,
MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue,
MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse,
MUX_uxn_opcodes_h_l3218_c20_2efb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044 : entity work.BIN_OP_PLUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left,
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right,
BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output);

-- stack_ram_update_uxn_opcodes_h_l3221_c21_465a
stack_ram_update_uxn_opcodes_h_l3221_c21_465a : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address,
stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value,
stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable,
stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output);

-- device_ram_update_uxn_opcodes_h_l3227_c26_e341
device_ram_update_uxn_opcodes_h_l3227_c26_e341 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address,
device_ram_update_uxn_opcodes_h_l3227_c26_e341_value,
device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable,
device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output,
 CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output,
 MUX_uxn_opcodes_h_l3131_c10_fdca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output,
 MUX_uxn_opcodes_h_l3132_c18_7177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output,
 jci_uxn_opcodes_h_l3137_c41_3735_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output,
 jmi_uxn_opcodes_h_l3138_c41_51be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output,
 jsi_uxn_opcodes_h_l3139_c41_f865_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output,
 lit_uxn_opcodes_h_l3140_c41_aff2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output,
 opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output,
 lit2_uxn_opcodes_h_l3141_c41_633e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output,
 lit_uxn_opcodes_h_l3142_c41_a15e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output,
 opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output,
 lit2_uxn_opcodes_h_l3143_c41_690e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output,
 opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output,
 inc_uxn_opcodes_h_l3144_c41_4beb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output,
 opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output,
 inc2_uxn_opcodes_h_l3145_c41_375c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output,
 pop_uxn_opcodes_h_l3146_c41_d46b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output,
 opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output,
 pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output,
 nip_uxn_opcodes_h_l3148_c41_9c04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output,
 nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output,
 opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output,
 swp_uxn_opcodes_h_l3150_c41_e258_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output,
 swp2_uxn_opcodes_h_l3151_c41_dce6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output,
 opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output,
 rot_uxn_opcodes_h_l3152_c41_76e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output,
 rot2_uxn_opcodes_h_l3153_c41_f09f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output,
 dup_uxn_opcodes_h_l3154_c41_06c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output,
 dup2_uxn_opcodes_h_l3155_c41_4015_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output,
 ovr_uxn_opcodes_h_l3156_c41_bee3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output,
 opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output,
 ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output,
 equ_uxn_opcodes_h_l3158_c41_41f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output,
 equ2_uxn_opcodes_h_l3159_c41_018b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output,
 neq_uxn_opcodes_h_l3160_c41_0fe2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output,
 neq2_uxn_opcodes_h_l3161_c41_50d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output,
 opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output,
 gth_uxn_opcodes_h_l3162_c41_082a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output,
 gth2_uxn_opcodes_h_l3163_c41_24d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output,
 opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output,
 lth_uxn_opcodes_h_l3164_c41_5e8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output,
 opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output,
 lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output,
 opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output,
 jmp_uxn_opcodes_h_l3166_c41_41aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output,
 opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output,
 jmp2_uxn_opcodes_h_l3167_c41_4598_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output,
 opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output,
 jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output,
 opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output,
 jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output,
 jsr_uxn_opcodes_h_l3170_c41_edfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output,
 jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output,
 sth_uxn_opcodes_h_l3172_c41_69b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output,
 opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output,
 sth2_uxn_opcodes_h_l3173_c41_a325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output,
 opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output,
 ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output,
 opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output,
 ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output,
 opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output,
 stz_uxn_opcodes_h_l3176_c41_d876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output,
 stz2_uxn_opcodes_h_l3177_c41_5062_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output,
 ldr_uxn_opcodes_h_l3178_c41_04f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output,
 opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output,
 ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output,
 opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output,
 str1_uxn_opcodes_h_l3180_c41_01ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output,
 opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output,
 str2_uxn_opcodes_h_l3181_c41_ca46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output,
 lda_uxn_opcodes_h_l3182_c41_8026_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output,
 opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output,
 lda2_uxn_opcodes_h_l3183_c41_64a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output,
 sta_uxn_opcodes_h_l3184_c41_4d34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output,
 sta2_uxn_opcodes_h_l3185_c41_3834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output,
 opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output,
 dei_uxn_opcodes_h_l3186_c41_c28a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output,
 opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output,
 dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output,
 deo_uxn_opcodes_h_l3188_c41_1652_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output,
 opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output,
 deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output,
 opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output,
 add_uxn_opcodes_h_l3190_c41_fa5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output,
 add2_uxn_opcodes_h_l3191_c41_d40b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output,
 sub_uxn_opcodes_h_l3192_c41_1cba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output,
 sub2_uxn_opcodes_h_l3193_c41_0d91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output,
 opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output,
 mul_uxn_opcodes_h_l3194_c41_3be7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output,
 opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output,
 mul2_uxn_opcodes_h_l3195_c41_44a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output,
 div_uxn_opcodes_h_l3196_c41_53b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output,
 div2_uxn_opcodes_h_l3197_c41_16c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output,
 opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output,
 and_uxn_opcodes_h_l3198_c41_d5ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output,
 opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output,
 and2_uxn_opcodes_h_l3199_c41_7d81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output,
 ora_uxn_opcodes_h_l3200_c41_3882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output,
 opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output,
 ora2_uxn_opcodes_h_l3201_c41_4150_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output,
 opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output,
 eor_uxn_opcodes_h_l3202_c41_0321_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output,
 opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output,
 eor2_uxn_opcodes_h_l3203_c41_e700_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output,
 sft_uxn_opcodes_h_l3204_c41_a9bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output,
 sft2_uxn_opcodes_h_l3205_c41_52e8_return_output,
 sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output,
 sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output,
 sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output,
 sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output,
 MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output,
 MUX_uxn_opcodes_h_l3218_c20_2efb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output,
 stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output,
 device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3131_c2_8b80 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_9ae8_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_a64c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_7177_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3132_c18_7177_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_5feb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3137_c41_3735_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_51be_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_51be_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3138_c41_51be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_f865_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_f865_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3139_c41_f865_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_aff2_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_aff2_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3140_c41_aff2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_633e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_633e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3141_c41_633e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_a15e_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_a15e_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3142_c41_a15e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_690e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_690e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3143_c41_690e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_4beb_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_4beb_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3144_c41_4beb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_375c_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_375c_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3145_c41_375c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_d46b_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_d46b_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3146_c41_d46b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_9c04_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_9c04_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3148_c41_9c04_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_e258_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_e258_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3150_c41_e258_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_76e1_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_76e1_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3152_c41_76e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_06c8_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_06c8_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3154_c41_06c8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_4015_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_4015_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3155_c41_4015_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_41f8_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_41f8_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3158_c41_41f8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_018b_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_018b_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3159_c41_018b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_082a_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_082a_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3162_c41_082a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_69b4_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_69b4_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3172_c41_69b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_a325_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_a325_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3173_c41_a325_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_d876_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_d876_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3176_c41_d876_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_5062_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_5062_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3177_c41_5062_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3180_c41_01ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3181_c41_ca46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3182_c41_8026_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_4d34_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_4d34_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3184_c41_4d34_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_3834_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_3834_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3185_c41_3834_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3186_c41_c28a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3188_c41_1652_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_fa5e_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_fa5e_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3190_c41_fa5e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_d40b_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_d40b_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3191_c41_d40b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_1cba_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_1cba_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3192_c41_1cba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_3be7_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_3be7_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3194_c41_3be7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_53b2_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_53b2_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3196_c41_53b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_16c6_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_16c6_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3197_c41_16c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_d5ba_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_d5ba_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3198_c41_d5ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_7d81_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_7d81_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3199_c41_7d81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_3882_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_3882_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3200_c41_3882_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_4150_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_4150_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3201_c41_4150_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_0321_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_0321_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3202_c41_0321_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_e700_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_e700_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3203_c41_e700_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_54f8_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3212_c4_03d5 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3210_c4_c464 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_24e7_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3217_c2_36dd : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_1d46_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output : unsigned(7 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3218_c2_ecdc : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_5b8e_return_output : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address : unsigned(15 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_51ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_82b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_0b78_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_0d2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_d90b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_8ace_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_2ef0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_7a8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_de6b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_61a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_2545_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_3382_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_6b2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_48ba_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3210_l3212_DUPLICATE_7f10_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_98a9_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right := to_unsigned(55, 6);
     VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right := to_unsigned(2048, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right := to_unsigned(512, 10);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right := to_unsigned(47, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right := to_unsigned(48, 6);
     VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue := to_unsigned(256, 9);
     VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right := to_unsigned(40, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right := to_unsigned(64, 7);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right := to_unsigned(34, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3191_c41_d40b_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3190_c41_fa5e_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3199_c41_7d81_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3198_c41_d5ba_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3197_c41_16c6_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3196_c41_53b2_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3155_c41_4015_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3154_c41_06c8_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3203_c41_e700_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3202_c41_0321_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3159_c41_018b_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3158_c41_41f8_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3162_c41_082a_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3145_c41_375c_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3144_c41_4beb_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3194_c41_3be7_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3148_c41_9c04_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3201_c41_4150_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3200_c41_3882_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3146_c41_d46b_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3152_c41_76e1_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3185_c41_3834_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3184_c41_4d34_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3173_c41_a325_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3172_c41_69b4_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3177_c41_5062_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3176_c41_d876_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3192_c41_1cba_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3150_c41_e258_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3138_c41_51be_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3139_c41_f865_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3141_c41_633e_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3143_c41_690e_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3140_c41_aff2_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3142_c41_a15e_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3191_c41_d40b_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3190_c41_fa5e_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3199_c41_7d81_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3198_c41_d5ba_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3197_c41_16c6_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3196_c41_53b2_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3155_c41_4015_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3154_c41_06c8_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3203_c41_e700_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3202_c41_0321_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3159_c41_018b_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3158_c41_41f8_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3162_c41_082a_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3145_c41_375c_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3144_c41_4beb_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3138_c41_51be_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3139_c41_f865_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3141_c41_633e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3143_c41_690e_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3140_c41_aff2_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3142_c41_a15e_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3194_c41_3be7_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3148_c41_9c04_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3201_c41_4150_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3200_c41_3882_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3146_c41_d46b_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3152_c41_76e1_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3185_c41_3834_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3184_c41_4d34_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3173_c41_a325_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3172_c41_69b4_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3177_c41_5062_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3176_c41_d876_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3192_c41_1cba_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3150_c41_e258_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3131_c57_a64c] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_a64c_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3131_c41_0001] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_left;
     BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output := BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3132_c18_38a4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_left;
     BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output := BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3136_c2_5feb] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_5feb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l3131_c10_edfa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_left;
     BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output := BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c10_edfa_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3132_c18_38a4_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c57_a64c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3136_c2_5feb_return_output;
     -- CONST_SL_4[uxn_opcodes_h_l3131_c57_c061] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output := CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3132_c18_442b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_left;
     BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output := BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3131_c10_0300] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_left;
     BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output := BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3131_c30_9ae8] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_9ae8_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3131_c41_0001_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3131_c10_0300_return_output;
     VAR_MUX_uxn_opcodes_h_l3132_c18_7177_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3132_c18_442b_return_output;
     VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3131_c30_9ae8_return_output;
     VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3131_c57_c061_return_output;
     -- MUX[uxn_opcodes_h_l3131_c10_fdca] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3131_c10_fdca_cond <= VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_cond;
     MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue <= VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iftrue;
     MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse <= VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_return_output := MUX_uxn_opcodes_h_l3131_c10_fdca_return_output;

     -- MUX[uxn_opcodes_h_l3132_c18_7177] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3132_c18_7177_cond <= VAR_MUX_uxn_opcodes_h_l3132_c18_7177_cond;
     MUX_uxn_opcodes_h_l3132_c18_7177_iftrue <= VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iftrue;
     MUX_uxn_opcodes_h_l3132_c18_7177_iffalse <= VAR_MUX_uxn_opcodes_h_l3132_c18_7177_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3132_c18_7177_return_output := MUX_uxn_opcodes_h_l3132_c18_7177_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3131_c2_8b80 := VAR_MUX_uxn_opcodes_h_l3131_c10_fdca_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left := VAR_MUX_uxn_opcodes_h_l3132_c18_7177_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l3132_c18_7177_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3131_c2_8b80;
     VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0 := resize(VAR_opc_uxn_opcodes_h_l3131_c2_8b80, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3194_c11_db47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_left;
     BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output := BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3175_c11_5aa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3142_c11_5d33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_left;
     BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output := BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_1a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_e99f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_74bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3138_c11_0327] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_left;
     BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output := BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3191_c11_37e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_3b87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_left;
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output := BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_f967] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_left;
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output := BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_fdb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_1e90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_left;
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output := BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_8dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3156_c11_d780] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_left;
     BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output := BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3198_c11_7817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_left;
     BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output := BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3186_c11_731c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_5cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_6f52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_left;
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output := BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3189_c11_2ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3154_c11_e292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_left;
     BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output := BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3168_c11_13b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3196_c11_af38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_left;
     BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output := BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3150_c11_dd8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3147_c11_cc29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_left;
     BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output := BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3199_c11_8d07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_left;
     BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output := BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3200_c11_9064] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_left;
     BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output := BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e606] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_left;
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output := BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3169_c11_99bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3190_c11_aeb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_0f62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_left;
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output := BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_4236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_left;
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output := BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3195_c11_5b70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_left;
     BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output := BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3167_c11_a678] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_left;
     BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output := BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_1281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_left;
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output := BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3179_c11_8b37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_left;
     BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output := BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_0076] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_left;
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output := BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3176_c11_a57d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3202_c11_5091] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_left;
     BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output := BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_225b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_9c2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3152_c11_4877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_left;
     BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output := BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_62f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3177_c11_22a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3203_c11_b607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_left;
     BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output := BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_58ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3180_c11_c5ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3172_c11_66fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_66b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3188_c11_9e25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_left;
     BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output := BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_d84f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3162_c11_25da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_left;
     BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output := BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3160_c11_4f63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_left;
     BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output := BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_005b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_5a15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_left;
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output := BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3182_c11_503a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3136_c6_8205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_left;
     BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output := BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3204_c11_70d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3171_c11_b61c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3183_c11_3981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_left;
     BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output := BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_9469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_left;
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output := BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3192_c11_6db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3164_c11_8f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3159_c11_727e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3146_c11_fa22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_left;
     BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output := BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_e5c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3185_c11_cc56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_left;
     BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output := BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3184_c11_2d8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3174_c11_b2c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3144_c11_6969] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_left;
     BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output := BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_2326] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_left;
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output := BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3136_c6_8205_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_e99f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3138_c11_0327_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_5a15_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e606_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_f967_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3142_c11_5d33_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_6f52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3144_c11_6969_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_d84f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3146_c11_fa22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3147_c11_cc29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_62f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_fdb4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3150_c11_dd8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_74bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3152_c11_4877_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_8dbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3154_c11_e292_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_0f62_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3156_c11_d780_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_1e90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_005b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3159_c11_727e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3160_c11_4f63_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_9469_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3162_c11_25da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_9c2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3164_c11_8f51_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_5cd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_e5c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3167_c11_a678_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3168_c11_13b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3169_c11_99bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_66b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3171_c11_b61c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3172_c11_66fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_2326_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3174_c11_b2c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3175_c11_5aa4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3176_c11_a57d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3177_c11_22a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_1a47_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3179_c11_8b37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3180_c11_c5ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_3b87_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3182_c11_503a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3183_c11_3981_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3184_c11_2d8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3185_c11_cc56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3186_c11_731c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_225b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3188_c11_9e25_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3189_c11_2ebb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3190_c11_aeb7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3191_c11_37e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3192_c11_6db3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_1281_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3194_c11_db47_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3195_c11_5b70_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3196_c11_af38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_4236_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3198_c11_7817_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3199_c11_8d07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3200_c11_9064_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_58ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3202_c11_5091_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3203_c11_b607_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3204_c11_70d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_0076_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c7_340c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c7_340c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3137_c1_e31c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c7_5c5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output;
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3137_c1_e31c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3138_c1_cc8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c7_aea5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output;

     -- jci[uxn_opcodes_h_l3137_c41_3735] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3137_c41_3735_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3137_c41_3735_phase <= VAR_jci_uxn_opcodes_h_l3137_c41_3735_phase;
     jci_uxn_opcodes_h_l3137_c41_3735_pc <= VAR_jci_uxn_opcodes_h_l3137_c41_3735_pc;
     jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_stack_read;
     jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3137_c41_3735_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3137_c41_3735_return_output := jci_uxn_opcodes_h_l3137_c41_3735_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output;
     VAR_jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3138_c1_cc8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue := VAR_jci_uxn_opcodes_h_l3137_c41_3735_return_output;
     -- jmi[uxn_opcodes_h_l3138_c41_51be] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3138_c41_51be_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3138_c41_51be_phase <= VAR_jmi_uxn_opcodes_h_l3138_c41_51be_phase;
     jmi_uxn_opcodes_h_l3138_c41_51be_pc <= VAR_jmi_uxn_opcodes_h_l3138_c41_51be_pc;
     jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3138_c41_51be_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3138_c41_51be_return_output := jmi_uxn_opcodes_h_l3138_c41_51be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c7_206e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3139_c1_5773] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c7_206e_return_output;
     VAR_jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3139_c1_5773_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue := VAR_jmi_uxn_opcodes_h_l3138_c41_51be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3140_c1_ed20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c7_cbe7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output;

     -- jsi[uxn_opcodes_h_l3139_c41_f865] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3139_c41_f865_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3139_c41_f865_phase <= VAR_jsi_uxn_opcodes_h_l3139_c41_f865_phase;
     jsi_uxn_opcodes_h_l3139_c41_f865_pc <= VAR_jsi_uxn_opcodes_h_l3139_c41_f865_pc;
     jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3139_c41_f865_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3139_c41_f865_return_output := jsi_uxn_opcodes_h_l3139_c41_f865_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output;
     VAR_lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3140_c1_ed20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue := VAR_jsi_uxn_opcodes_h_l3139_c41_f865_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c7_cd56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3141_c1_b6af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output;

     -- lit[uxn_opcodes_h_l3140_c41_aff2] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3140_c41_aff2_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3140_c41_aff2_phase <= VAR_lit_uxn_opcodes_h_l3140_c41_aff2_phase;
     lit_uxn_opcodes_h_l3140_c41_aff2_pc <= VAR_lit_uxn_opcodes_h_l3140_c41_aff2_pc;
     lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3140_c41_aff2_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3140_c41_aff2_return_output := lit_uxn_opcodes_h_l3140_c41_aff2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output;
     VAR_lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3141_c1_b6af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue := VAR_lit_uxn_opcodes_h_l3140_c41_aff2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c7_61cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output;

     -- lit2[uxn_opcodes_h_l3141_c41_633e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3141_c41_633e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3141_c41_633e_phase <= VAR_lit2_uxn_opcodes_h_l3141_c41_633e_phase;
     lit2_uxn_opcodes_h_l3141_c41_633e_pc <= VAR_lit2_uxn_opcodes_h_l3141_c41_633e_pc;
     lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3141_c41_633e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3141_c41_633e_return_output := lit2_uxn_opcodes_h_l3141_c41_633e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3142_c1_6cf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output;
     VAR_lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3142_c1_6cf1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue := VAR_lit2_uxn_opcodes_h_l3141_c41_633e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3143_c1_5868] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c7_6dfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output;

     -- lit[uxn_opcodes_h_l3142_c41_a15e] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3142_c41_a15e_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3142_c41_a15e_phase <= VAR_lit_uxn_opcodes_h_l3142_c41_a15e_phase;
     lit_uxn_opcodes_h_l3142_c41_a15e_pc <= VAR_lit_uxn_opcodes_h_l3142_c41_a15e_pc;
     lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3142_c41_a15e_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3142_c41_a15e_return_output := lit_uxn_opcodes_h_l3142_c41_a15e_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output;
     VAR_lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3143_c1_5868_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue := VAR_lit_uxn_opcodes_h_l3142_c41_a15e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3144_c1_3318] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c7_4353] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output;

     -- lit2[uxn_opcodes_h_l3143_c41_690e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3143_c41_690e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3143_c41_690e_phase <= VAR_lit2_uxn_opcodes_h_l3143_c41_690e_phase;
     lit2_uxn_opcodes_h_l3143_c41_690e_pc <= VAR_lit2_uxn_opcodes_h_l3143_c41_690e_pc;
     lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3143_c41_690e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3143_c41_690e_return_output := lit2_uxn_opcodes_h_l3143_c41_690e_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c7_4353_return_output;
     VAR_inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3144_c1_3318_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue := VAR_lit2_uxn_opcodes_h_l3143_c41_690e_return_output;
     -- inc[uxn_opcodes_h_l3144_c41_4beb] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3144_c41_4beb_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3144_c41_4beb_phase <= VAR_inc_uxn_opcodes_h_l3144_c41_4beb_phase;
     inc_uxn_opcodes_h_l3144_c41_4beb_ins <= VAR_inc_uxn_opcodes_h_l3144_c41_4beb_ins;
     inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3144_c41_4beb_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3144_c41_4beb_return_output := inc_uxn_opcodes_h_l3144_c41_4beb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3145_c1_0911] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c7_2047] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c7_2047_return_output;
     VAR_inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3145_c1_0911_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue := VAR_inc_uxn_opcodes_h_l3144_c41_4beb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3146_c1_409d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c7_cb8f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output;

     -- inc2[uxn_opcodes_h_l3145_c41_375c] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3145_c41_375c_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3145_c41_375c_phase <= VAR_inc2_uxn_opcodes_h_l3145_c41_375c_phase;
     inc2_uxn_opcodes_h_l3145_c41_375c_ins <= VAR_inc2_uxn_opcodes_h_l3145_c41_375c_ins;
     inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3145_c41_375c_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3145_c41_375c_return_output := inc2_uxn_opcodes_h_l3145_c41_375c_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output;
     VAR_pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3146_c1_409d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue := VAR_inc2_uxn_opcodes_h_l3145_c41_375c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c7_d708] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output;

     -- pop[uxn_opcodes_h_l3146_c41_d46b] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3146_c41_d46b_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3146_c41_d46b_phase <= VAR_pop_uxn_opcodes_h_l3146_c41_d46b_phase;
     pop_uxn_opcodes_h_l3146_c41_d46b_ins <= VAR_pop_uxn_opcodes_h_l3146_c41_d46b_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3146_c41_d46b_return_output := pop_uxn_opcodes_h_l3146_c41_d46b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3147_c1_0422] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c7_d708_return_output;
     VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3147_c1_0422_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue := VAR_pop_uxn_opcodes_h_l3146_c41_d46b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3148_c1_41f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c7_eaf3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output;

     -- pop2[uxn_opcodes_h_l3147_c41_3d8a] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3147_c41_3d8a_phase <= VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_phase;
     pop2_uxn_opcodes_h_l3147_c41_3d8a_ins <= VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output := pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output;
     VAR_nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3148_c1_41f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue := VAR_pop2_uxn_opcodes_h_l3147_c41_3d8a_return_output;
     -- nip[uxn_opcodes_h_l3148_c41_9c04] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3148_c41_9c04_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3148_c41_9c04_phase <= VAR_nip_uxn_opcodes_h_l3148_c41_9c04_phase;
     nip_uxn_opcodes_h_l3148_c41_9c04_ins <= VAR_nip_uxn_opcodes_h_l3148_c41_9c04_ins;
     nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3148_c41_9c04_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3148_c41_9c04_return_output := nip_uxn_opcodes_h_l3148_c41_9c04_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c7_1ffd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3149_c1_d42c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output;
     VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3149_c1_d42c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue := VAR_nip_uxn_opcodes_h_l3148_c41_9c04_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c7_10af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3150_c1_75f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output;

     -- nip2[uxn_opcodes_h_l3149_c41_1bb7] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3149_c41_1bb7_phase <= VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_phase;
     nip2_uxn_opcodes_h_l3149_c41_1bb7_ins <= VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_ins;
     nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output := nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c7_10af_return_output;
     VAR_swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3150_c1_75f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue := VAR_nip2_uxn_opcodes_h_l3149_c41_1bb7_return_output;
     -- swp[uxn_opcodes_h_l3150_c41_e258] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3150_c41_e258_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3150_c41_e258_phase <= VAR_swp_uxn_opcodes_h_l3150_c41_e258_phase;
     swp_uxn_opcodes_h_l3150_c41_e258_ins <= VAR_swp_uxn_opcodes_h_l3150_c41_e258_ins;
     swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3150_c41_e258_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3150_c41_e258_return_output := swp_uxn_opcodes_h_l3150_c41_e258_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3151_c1_9476] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c7_19aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output;
     VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3151_c1_9476_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue := VAR_swp_uxn_opcodes_h_l3150_c41_e258_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c7_fe18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3152_c1_4c95] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output;

     -- swp2[uxn_opcodes_h_l3151_c41_dce6] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3151_c41_dce6_phase <= VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_phase;
     swp2_uxn_opcodes_h_l3151_c41_dce6_ins <= VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_ins;
     swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_return_output := swp2_uxn_opcodes_h_l3151_c41_dce6_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output;
     VAR_rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3152_c1_4c95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue := VAR_swp2_uxn_opcodes_h_l3151_c41_dce6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c7_c9b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output;

     -- rot[uxn_opcodes_h_l3152_c41_76e1] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3152_c41_76e1_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3152_c41_76e1_phase <= VAR_rot_uxn_opcodes_h_l3152_c41_76e1_phase;
     rot_uxn_opcodes_h_l3152_c41_76e1_ins <= VAR_rot_uxn_opcodes_h_l3152_c41_76e1_ins;
     rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3152_c41_76e1_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3152_c41_76e1_return_output := rot_uxn_opcodes_h_l3152_c41_76e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3153_c1_0501] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output;
     VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3153_c1_0501_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue := VAR_rot_uxn_opcodes_h_l3152_c41_76e1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c7_d1d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3154_c1_cbb1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output;

     -- rot2[uxn_opcodes_h_l3153_c41_f09f] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3153_c41_f09f_phase <= VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_phase;
     rot2_uxn_opcodes_h_l3153_c41_f09f_ins <= VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_ins;
     rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_return_output := rot2_uxn_opcodes_h_l3153_c41_f09f_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output;
     VAR_dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3154_c1_cbb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue := VAR_rot2_uxn_opcodes_h_l3153_c41_f09f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3155_c1_1d51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output;

     -- dup[uxn_opcodes_h_l3154_c41_06c8] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3154_c41_06c8_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3154_c41_06c8_phase <= VAR_dup_uxn_opcodes_h_l3154_c41_06c8_phase;
     dup_uxn_opcodes_h_l3154_c41_06c8_ins <= VAR_dup_uxn_opcodes_h_l3154_c41_06c8_ins;
     dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3154_c41_06c8_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3154_c41_06c8_return_output := dup_uxn_opcodes_h_l3154_c41_06c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c7_61a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output;
     VAR_dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3155_c1_1d51_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue := VAR_dup_uxn_opcodes_h_l3154_c41_06c8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3156_c1_6534] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c7_4a8f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output;

     -- dup2[uxn_opcodes_h_l3155_c41_4015] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3155_c41_4015_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3155_c41_4015_phase <= VAR_dup2_uxn_opcodes_h_l3155_c41_4015_phase;
     dup2_uxn_opcodes_h_l3155_c41_4015_ins <= VAR_dup2_uxn_opcodes_h_l3155_c41_4015_ins;
     dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3155_c41_4015_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3155_c41_4015_return_output := dup2_uxn_opcodes_h_l3155_c41_4015_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output;
     VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3156_c1_6534_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue := VAR_dup2_uxn_opcodes_h_l3155_c41_4015_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c7_ce59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3157_c1_63bb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output;

     -- ovr[uxn_opcodes_h_l3156_c41_bee3] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3156_c41_bee3_phase <= VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_phase;
     ovr_uxn_opcodes_h_l3156_c41_bee3_ins <= VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_ins;
     ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_return_output := ovr_uxn_opcodes_h_l3156_c41_bee3_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output;
     VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3157_c1_63bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue := VAR_ovr_uxn_opcodes_h_l3156_c41_bee3_return_output;
     -- ovr2[uxn_opcodes_h_l3157_c41_66cf] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3157_c41_66cf_phase <= VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_phase;
     ovr2_uxn_opcodes_h_l3157_c41_66cf_ins <= VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_ins;
     ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output := ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3158_c1_1c7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c7_0fb3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output;
     VAR_equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3158_c1_1c7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue := VAR_ovr2_uxn_opcodes_h_l3157_c41_66cf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c7_73d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output;

     -- equ[uxn_opcodes_h_l3158_c41_41f8] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3158_c41_41f8_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3158_c41_41f8_phase <= VAR_equ_uxn_opcodes_h_l3158_c41_41f8_phase;
     equ_uxn_opcodes_h_l3158_c41_41f8_ins <= VAR_equ_uxn_opcodes_h_l3158_c41_41f8_ins;
     equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3158_c41_41f8_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3158_c41_41f8_return_output := equ_uxn_opcodes_h_l3158_c41_41f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3159_c1_2777] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output;
     VAR_equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3159_c1_2777_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue := VAR_equ_uxn_opcodes_h_l3158_c41_41f8_return_output;
     -- equ2[uxn_opcodes_h_l3159_c41_018b] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3159_c41_018b_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3159_c41_018b_phase <= VAR_equ2_uxn_opcodes_h_l3159_c41_018b_phase;
     equ2_uxn_opcodes_h_l3159_c41_018b_ins <= VAR_equ2_uxn_opcodes_h_l3159_c41_018b_ins;
     equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3159_c41_018b_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3159_c41_018b_return_output := equ2_uxn_opcodes_h_l3159_c41_018b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3160_c1_bced] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c7_cc5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output;
     VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3160_c1_bced_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue := VAR_equ2_uxn_opcodes_h_l3159_c41_018b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3161_c1_f15c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c7_f1c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output;

     -- neq[uxn_opcodes_h_l3160_c41_0fe2] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3160_c41_0fe2_phase <= VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_phase;
     neq_uxn_opcodes_h_l3160_c41_0fe2_ins <= VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_ins;
     neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_return_output := neq_uxn_opcodes_h_l3160_c41_0fe2_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output;
     VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3161_c1_f15c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue := VAR_neq_uxn_opcodes_h_l3160_c41_0fe2_return_output;
     -- neq2[uxn_opcodes_h_l3161_c41_50d6] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3161_c41_50d6_phase <= VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_phase;
     neq2_uxn_opcodes_h_l3161_c41_50d6_ins <= VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_ins;
     neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_return_output := neq2_uxn_opcodes_h_l3161_c41_50d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c7_ea64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3162_c1_25ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output;
     VAR_gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3162_c1_25ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue := VAR_neq2_uxn_opcodes_h_l3161_c41_50d6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c7_15f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output;

     -- gth[uxn_opcodes_h_l3162_c41_082a] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3162_c41_082a_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3162_c41_082a_phase <= VAR_gth_uxn_opcodes_h_l3162_c41_082a_phase;
     gth_uxn_opcodes_h_l3162_c41_082a_ins <= VAR_gth_uxn_opcodes_h_l3162_c41_082a_ins;
     gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3162_c41_082a_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3162_c41_082a_return_output := gth_uxn_opcodes_h_l3162_c41_082a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3163_c1_1a26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output;
     VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3163_c1_1a26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue := VAR_gth_uxn_opcodes_h_l3162_c41_082a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c7_3055] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3164_c1_ada1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output;

     -- gth2[uxn_opcodes_h_l3163_c41_24d9] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3163_c41_24d9_phase <= VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_phase;
     gth2_uxn_opcodes_h_l3163_c41_24d9_ins <= VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_ins;
     gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_return_output := gth2_uxn_opcodes_h_l3163_c41_24d9_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c7_3055_return_output;
     VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3164_c1_ada1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue := VAR_gth2_uxn_opcodes_h_l3163_c41_24d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3165_c1_f859] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output;

     -- lth[uxn_opcodes_h_l3164_c41_5e8d] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3164_c41_5e8d_phase <= VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_phase;
     lth_uxn_opcodes_h_l3164_c41_5e8d_ins <= VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_ins;
     lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_return_output := lth_uxn_opcodes_h_l3164_c41_5e8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c7_3355] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c7_3355_return_output;
     VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3165_c1_f859_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue := VAR_lth_uxn_opcodes_h_l3164_c41_5e8d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3166_c1_1d6f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c7_4747] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output;

     -- lth2[uxn_opcodes_h_l3165_c41_dfcc] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3165_c41_dfcc_phase <= VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_phase;
     lth2_uxn_opcodes_h_l3165_c41_dfcc_ins <= VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_ins;
     lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output := lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c7_4747_return_output;
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3166_c1_1d6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue := VAR_lth2_uxn_opcodes_h_l3165_c41_dfcc_return_output;
     -- jmp[uxn_opcodes_h_l3166_c41_41aa] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3166_c41_41aa_phase <= VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_phase;
     jmp_uxn_opcodes_h_l3166_c41_41aa_ins <= VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_ins;
     jmp_uxn_opcodes_h_l3166_c41_41aa_pc <= VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_pc;
     jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_return_output := jmp_uxn_opcodes_h_l3166_c41_41aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3167_c1_250c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c7_0780] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c7_0780_return_output;
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3167_c1_250c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue := VAR_jmp_uxn_opcodes_h_l3166_c41_41aa_return_output;
     -- jmp2[uxn_opcodes_h_l3167_c41_4598] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3167_c41_4598_phase <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_phase;
     jmp2_uxn_opcodes_h_l3167_c41_4598_ins <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_ins;
     jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_return_output := jmp2_uxn_opcodes_h_l3167_c41_4598_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3168_c1_07ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c7_5439] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c7_5439_return_output;
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3168_c1_07ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue := VAR_jmp2_uxn_opcodes_h_l3167_c41_4598_return_output;
     -- jcn[uxn_opcodes_h_l3168_c41_a6e1] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3168_c41_a6e1_phase <= VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_phase;
     jcn_uxn_opcodes_h_l3168_c41_a6e1_ins <= VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_ins;
     jcn_uxn_opcodes_h_l3168_c41_a6e1_pc <= VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_pc;
     jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output := jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c7_0bca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3169_c1_57cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output;
     VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3169_c1_57cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue := VAR_jcn_uxn_opcodes_h_l3168_c41_a6e1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c7_db1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output;

     -- jcn2[uxn_opcodes_h_l3169_c41_f52b] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3169_c41_f52b_phase <= VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_phase;
     jcn2_uxn_opcodes_h_l3169_c41_f52b_ins <= VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_ins;
     jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output := jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3170_c1_b97a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output;
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3170_c1_b97a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue := VAR_jcn2_uxn_opcodes_h_l3169_c41_f52b_return_output;
     -- jsr[uxn_opcodes_h_l3170_c41_edfb] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3170_c41_edfb_phase <= VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_phase;
     jsr_uxn_opcodes_h_l3170_c41_edfb_ins <= VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_ins;
     jsr_uxn_opcodes_h_l3170_c41_edfb_pc <= VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_pc;
     jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_return_output := jsr_uxn_opcodes_h_l3170_c41_edfb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c7_09ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3171_c1_937d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output;
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3171_c1_937d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue := VAR_jsr_uxn_opcodes_h_l3170_c41_edfb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3172_c1_48df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output;

     -- jsr2[uxn_opcodes_h_l3171_c41_fcec] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3171_c41_fcec_phase <= VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_phase;
     jsr2_uxn_opcodes_h_l3171_c41_fcec_ins <= VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_ins;
     jsr2_uxn_opcodes_h_l3171_c41_fcec_pc <= VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_pc;
     jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output := jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c7_ecf2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output;
     VAR_sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3172_c1_48df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue := VAR_jsr2_uxn_opcodes_h_l3171_c41_fcec_return_output;
     -- sth[uxn_opcodes_h_l3172_c41_69b4] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3172_c41_69b4_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3172_c41_69b4_phase <= VAR_sth_uxn_opcodes_h_l3172_c41_69b4_phase;
     sth_uxn_opcodes_h_l3172_c41_69b4_ins <= VAR_sth_uxn_opcodes_h_l3172_c41_69b4_ins;
     sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3172_c41_69b4_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3172_c41_69b4_return_output := sth_uxn_opcodes_h_l3172_c41_69b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c7_d6ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3173_c1_b0f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output;
     VAR_sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3173_c1_b0f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue := VAR_sth_uxn_opcodes_h_l3172_c41_69b4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c7_c491] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3174_c1_9912] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output;

     -- sth2[uxn_opcodes_h_l3173_c41_a325] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3173_c41_a325_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3173_c41_a325_phase <= VAR_sth2_uxn_opcodes_h_l3173_c41_a325_phase;
     sth2_uxn_opcodes_h_l3173_c41_a325_ins <= VAR_sth2_uxn_opcodes_h_l3173_c41_a325_ins;
     sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3173_c41_a325_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3173_c41_a325_return_output := sth2_uxn_opcodes_h_l3173_c41_a325_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c7_c491_return_output;
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3174_c1_9912_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue := VAR_sth2_uxn_opcodes_h_l3173_c41_a325_return_output;
     -- ldz[uxn_opcodes_h_l3174_c41_1e8b] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3174_c41_1e8b_phase <= VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_phase;
     ldz_uxn_opcodes_h_l3174_c41_1e8b_ins <= VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_ins;
     ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_stack_read;
     ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output := ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3175_c1_70df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c7_b689] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c7_b689_return_output;
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3175_c1_70df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue := VAR_ldz_uxn_opcodes_h_l3174_c41_1e8b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3176_c1_ffbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c7_d908] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output;

     -- ldz2[uxn_opcodes_h_l3175_c41_af7a] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3175_c41_af7a_phase <= VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_phase;
     ldz2_uxn_opcodes_h_l3175_c41_af7a_ins <= VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_ins;
     ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_stack_read;
     ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output := ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c7_d908_return_output;
     VAR_stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3176_c1_ffbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue := VAR_ldz2_uxn_opcodes_h_l3175_c41_af7a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3177_c1_c204] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output;

     -- stz[uxn_opcodes_h_l3176_c41_d876] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3176_c41_d876_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3176_c41_d876_phase <= VAR_stz_uxn_opcodes_h_l3176_c41_d876_phase;
     stz_uxn_opcodes_h_l3176_c41_d876_ins <= VAR_stz_uxn_opcodes_h_l3176_c41_d876_ins;
     stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3176_c41_d876_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3176_c41_d876_return_output := stz_uxn_opcodes_h_l3176_c41_d876_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c7_50e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output;
     VAR_stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3177_c1_c204_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue := VAR_stz_uxn_opcodes_h_l3176_c41_d876_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c7_2bc7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output;

     -- stz2[uxn_opcodes_h_l3177_c41_5062] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3177_c41_5062_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3177_c41_5062_phase <= VAR_stz2_uxn_opcodes_h_l3177_c41_5062_phase;
     stz2_uxn_opcodes_h_l3177_c41_5062_ins <= VAR_stz2_uxn_opcodes_h_l3177_c41_5062_ins;
     stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3177_c41_5062_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3177_c41_5062_return_output := stz2_uxn_opcodes_h_l3177_c41_5062_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3178_c1_edca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output;
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3178_c1_edca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue := VAR_stz2_uxn_opcodes_h_l3177_c41_5062_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c7_c035] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3179_c1_7d85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output;

     -- ldr[uxn_opcodes_h_l3178_c41_04f0] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3178_c41_04f0_phase <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_phase;
     ldr_uxn_opcodes_h_l3178_c41_04f0_ins <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_ins;
     ldr_uxn_opcodes_h_l3178_c41_04f0_pc <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_pc;
     ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_stack_read;
     ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_return_output := ldr_uxn_opcodes_h_l3178_c41_04f0_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c7_c035_return_output;
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3179_c1_7d85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue := VAR_ldr_uxn_opcodes_h_l3178_c41_04f0_return_output;
     -- ldr2[uxn_opcodes_h_l3179_c41_ae46] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3179_c41_ae46_phase <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_phase;
     ldr2_uxn_opcodes_h_l3179_c41_ae46_ins <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_ins;
     ldr2_uxn_opcodes_h_l3179_c41_ae46_pc <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_pc;
     ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_stack_read;
     ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output := ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3180_c1_91fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c7_0812] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c7_0812_return_output;
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3180_c1_91fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue := VAR_ldr2_uxn_opcodes_h_l3179_c41_ae46_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3181_c1_ccb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c7_9575] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output;

     -- str1[uxn_opcodes_h_l3180_c41_01ad] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3180_c41_01ad_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3180_c41_01ad_phase <= VAR_str1_uxn_opcodes_h_l3180_c41_01ad_phase;
     str1_uxn_opcodes_h_l3180_c41_01ad_ins <= VAR_str1_uxn_opcodes_h_l3180_c41_01ad_ins;
     str1_uxn_opcodes_h_l3180_c41_01ad_pc <= VAR_str1_uxn_opcodes_h_l3180_c41_01ad_pc;
     str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3180_c41_01ad_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3180_c41_01ad_return_output := str1_uxn_opcodes_h_l3180_c41_01ad_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c7_9575_return_output;
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3181_c1_ccb9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue := VAR_str1_uxn_opcodes_h_l3180_c41_01ad_return_output;
     -- str2[uxn_opcodes_h_l3181_c41_ca46] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3181_c41_ca46_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3181_c41_ca46_phase <= VAR_str2_uxn_opcodes_h_l3181_c41_ca46_phase;
     str2_uxn_opcodes_h_l3181_c41_ca46_ins <= VAR_str2_uxn_opcodes_h_l3181_c41_ca46_ins;
     str2_uxn_opcodes_h_l3181_c41_ca46_pc <= VAR_str2_uxn_opcodes_h_l3181_c41_ca46_pc;
     str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3181_c41_ca46_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3181_c41_ca46_return_output := str2_uxn_opcodes_h_l3181_c41_ca46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c7_688c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3182_c1_4407] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c7_688c_return_output;
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3182_c1_4407_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue := VAR_str2_uxn_opcodes_h_l3181_c41_ca46_return_output;
     -- lda[uxn_opcodes_h_l3182_c41_8026] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3182_c41_8026_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3182_c41_8026_phase <= VAR_lda_uxn_opcodes_h_l3182_c41_8026_phase;
     lda_uxn_opcodes_h_l3182_c41_8026_ins <= VAR_lda_uxn_opcodes_h_l3182_c41_8026_ins;
     lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_stack_read;
     lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3182_c41_8026_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3182_c41_8026_return_output := lda_uxn_opcodes_h_l3182_c41_8026_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c7_3d61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3183_c1_2e47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output;
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3183_c1_2e47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue := VAR_lda_uxn_opcodes_h_l3182_c41_8026_return_output;
     -- lda2[uxn_opcodes_h_l3183_c41_64a3] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3183_c41_64a3_phase <= VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_phase;
     lda2_uxn_opcodes_h_l3183_c41_64a3_ins <= VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_ins;
     lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_stack_read;
     lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_return_output := lda2_uxn_opcodes_h_l3183_c41_64a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c7_8bc5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3184_c1_41e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output;
     VAR_sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3184_c1_41e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue := VAR_lda2_uxn_opcodes_h_l3183_c41_64a3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c7_616d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3185_c1_8e95] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output;

     -- sta[uxn_opcodes_h_l3184_c41_4d34] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3184_c41_4d34_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3184_c41_4d34_phase <= VAR_sta_uxn_opcodes_h_l3184_c41_4d34_phase;
     sta_uxn_opcodes_h_l3184_c41_4d34_ins <= VAR_sta_uxn_opcodes_h_l3184_c41_4d34_ins;
     sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3184_c41_4d34_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3184_c41_4d34_return_output := sta_uxn_opcodes_h_l3184_c41_4d34_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c7_616d_return_output;
     VAR_sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3185_c1_8e95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue := VAR_sta_uxn_opcodes_h_l3184_c41_4d34_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3186_c1_b3e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c7_3479] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output;

     -- sta2[uxn_opcodes_h_l3185_c41_3834] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3185_c41_3834_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3185_c41_3834_phase <= VAR_sta2_uxn_opcodes_h_l3185_c41_3834_phase;
     sta2_uxn_opcodes_h_l3185_c41_3834_ins <= VAR_sta2_uxn_opcodes_h_l3185_c41_3834_ins;
     sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3185_c41_3834_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3185_c41_3834_return_output := sta2_uxn_opcodes_h_l3185_c41_3834_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c7_3479_return_output;
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3186_c1_b3e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue := VAR_sta2_uxn_opcodes_h_l3185_c41_3834_return_output;
     -- dei[uxn_opcodes_h_l3186_c41_c28a] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3186_c41_c28a_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3186_c41_c28a_phase <= VAR_dei_uxn_opcodes_h_l3186_c41_c28a_phase;
     dei_uxn_opcodes_h_l3186_c41_c28a_ins <= VAR_dei_uxn_opcodes_h_l3186_c41_c28a_ins;
     dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_stack_read;
     dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3186_c41_c28a_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3186_c41_c28a_return_output := dei_uxn_opcodes_h_l3186_c41_c28a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3187_c1_134a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c7_4bbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output;
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3187_c1_134a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue := VAR_dei_uxn_opcodes_h_l3186_c41_c28a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3188_c1_cdd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output;

     -- dei2[uxn_opcodes_h_l3187_c41_2cdb] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3187_c41_2cdb_phase <= VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_phase;
     dei2_uxn_opcodes_h_l3187_c41_2cdb_ins <= VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_ins;
     dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_stack_read;
     dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output := dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c7_29e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output;
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3188_c1_cdd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue := VAR_dei2_uxn_opcodes_h_l3187_c41_2cdb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3189_c1_d731] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output;

     -- deo[uxn_opcodes_h_l3188_c41_1652] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3188_c41_1652_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3188_c41_1652_phase <= VAR_deo_uxn_opcodes_h_l3188_c41_1652_phase;
     deo_uxn_opcodes_h_l3188_c41_1652_ins <= VAR_deo_uxn_opcodes_h_l3188_c41_1652_ins;
     deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_stack_read;
     deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3188_c41_1652_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3188_c41_1652_return_output := deo_uxn_opcodes_h_l3188_c41_1652_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c7_d675] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c7_d675_return_output;
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3189_c1_d731_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue := VAR_deo_uxn_opcodes_h_l3188_c41_1652_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3190_c1_0e8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c7_7f18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output;

     -- deo2[uxn_opcodes_h_l3189_c41_6e3c] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3189_c41_6e3c_phase <= VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_phase;
     deo2_uxn_opcodes_h_l3189_c41_6e3c_ins <= VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_ins;
     deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_stack_read;
     deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output := deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output;
     VAR_add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3190_c1_0e8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue := VAR_deo2_uxn_opcodes_h_l3189_c41_6e3c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c7_16b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3191_c1_4491] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output;

     -- add[uxn_opcodes_h_l3190_c41_fa5e] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3190_c41_fa5e_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3190_c41_fa5e_phase <= VAR_add_uxn_opcodes_h_l3190_c41_fa5e_phase;
     add_uxn_opcodes_h_l3190_c41_fa5e_ins <= VAR_add_uxn_opcodes_h_l3190_c41_fa5e_ins;
     add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read <= VAR_add_uxn_opcodes_h_l3190_c41_fa5e_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3190_c41_fa5e_return_output := add_uxn_opcodes_h_l3190_c41_fa5e_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output;
     VAR_add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3191_c1_4491_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue := VAR_add_uxn_opcodes_h_l3190_c41_fa5e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c7_e72c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3192_c1_1611] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output;

     -- add2[uxn_opcodes_h_l3191_c41_d40b] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3191_c41_d40b_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3191_c41_d40b_phase <= VAR_add2_uxn_opcodes_h_l3191_c41_d40b_phase;
     add2_uxn_opcodes_h_l3191_c41_d40b_ins <= VAR_add2_uxn_opcodes_h_l3191_c41_d40b_ins;
     add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3191_c41_d40b_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3191_c41_d40b_return_output := add2_uxn_opcodes_h_l3191_c41_d40b_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output;
     VAR_sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3192_c1_1611_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue := VAR_add2_uxn_opcodes_h_l3191_c41_d40b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c7_dfe5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3193_c1_041b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output;

     -- sub[uxn_opcodes_h_l3192_c41_1cba] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3192_c41_1cba_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3192_c41_1cba_phase <= VAR_sub_uxn_opcodes_h_l3192_c41_1cba_phase;
     sub_uxn_opcodes_h_l3192_c41_1cba_ins <= VAR_sub_uxn_opcodes_h_l3192_c41_1cba_ins;
     sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3192_c41_1cba_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3192_c41_1cba_return_output := sub_uxn_opcodes_h_l3192_c41_1cba_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output;
     VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3193_c1_041b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue := VAR_sub_uxn_opcodes_h_l3192_c41_1cba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c7_6b62] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output;

     -- sub2[uxn_opcodes_h_l3193_c41_0d91] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3193_c41_0d91_phase <= VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_phase;
     sub2_uxn_opcodes_h_l3193_c41_0d91_ins <= VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_ins;
     sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_return_output := sub2_uxn_opcodes_h_l3193_c41_0d91_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3194_c1_d73b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output;
     VAR_mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3194_c1_d73b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue := VAR_sub2_uxn_opcodes_h_l3193_c41_0d91_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c7_df04] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output;

     -- mul[uxn_opcodes_h_l3194_c41_3be7] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3194_c41_3be7_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3194_c41_3be7_phase <= VAR_mul_uxn_opcodes_h_l3194_c41_3be7_phase;
     mul_uxn_opcodes_h_l3194_c41_3be7_ins <= VAR_mul_uxn_opcodes_h_l3194_c41_3be7_ins;
     mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3194_c41_3be7_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3194_c41_3be7_return_output := mul_uxn_opcodes_h_l3194_c41_3be7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3195_c1_7577] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c7_df04_return_output;
     VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3195_c1_7577_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue := VAR_mul_uxn_opcodes_h_l3194_c41_3be7_return_output;
     -- mul2[uxn_opcodes_h_l3195_c41_44a1] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3195_c41_44a1_phase <= VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_phase;
     mul2_uxn_opcodes_h_l3195_c41_44a1_ins <= VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_ins;
     mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_return_output := mul2_uxn_opcodes_h_l3195_c41_44a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c7_beeb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3196_c1_52fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output;
     VAR_div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3196_c1_52fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue := VAR_mul2_uxn_opcodes_h_l3195_c41_44a1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c7_fdaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output;

     -- div[uxn_opcodes_h_l3196_c41_53b2] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3196_c41_53b2_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3196_c41_53b2_phase <= VAR_div_uxn_opcodes_h_l3196_c41_53b2_phase;
     div_uxn_opcodes_h_l3196_c41_53b2_ins <= VAR_div_uxn_opcodes_h_l3196_c41_53b2_ins;
     div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read <= VAR_div_uxn_opcodes_h_l3196_c41_53b2_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3196_c41_53b2_return_output := div_uxn_opcodes_h_l3196_c41_53b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3197_c1_d07e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output;
     VAR_div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3197_c1_d07e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue := VAR_div_uxn_opcodes_h_l3196_c41_53b2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c7_3184] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3198_c1_41e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output;

     -- div2[uxn_opcodes_h_l3197_c41_16c6] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3197_c41_16c6_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3197_c41_16c6_phase <= VAR_div2_uxn_opcodes_h_l3197_c41_16c6_phase;
     div2_uxn_opcodes_h_l3197_c41_16c6_ins <= VAR_div2_uxn_opcodes_h_l3197_c41_16c6_ins;
     div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3197_c41_16c6_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3197_c41_16c6_return_output := div2_uxn_opcodes_h_l3197_c41_16c6_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c7_3184_return_output;
     VAR_and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3198_c1_41e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue := VAR_div2_uxn_opcodes_h_l3197_c41_16c6_return_output;
     -- and[uxn_opcodes_h_l3198_c41_d5ba] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3198_c41_d5ba_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3198_c41_d5ba_phase <= VAR_and_uxn_opcodes_h_l3198_c41_d5ba_phase;
     and_uxn_opcodes_h_l3198_c41_d5ba_ins <= VAR_and_uxn_opcodes_h_l3198_c41_d5ba_ins;
     and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read <= VAR_and_uxn_opcodes_h_l3198_c41_d5ba_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3198_c41_d5ba_return_output := and_uxn_opcodes_h_l3198_c41_d5ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3199_c1_0cb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c7_7f99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output;
     VAR_and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3199_c1_0cb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue := VAR_and_uxn_opcodes_h_l3198_c41_d5ba_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3200_c1_7bbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output;

     -- and2[uxn_opcodes_h_l3199_c41_7d81] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3199_c41_7d81_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3199_c41_7d81_phase <= VAR_and2_uxn_opcodes_h_l3199_c41_7d81_phase;
     and2_uxn_opcodes_h_l3199_c41_7d81_ins <= VAR_and2_uxn_opcodes_h_l3199_c41_7d81_ins;
     and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3199_c41_7d81_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3199_c41_7d81_return_output := and2_uxn_opcodes_h_l3199_c41_7d81_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c7_bfc5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output;
     VAR_ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3200_c1_7bbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue := VAR_and2_uxn_opcodes_h_l3199_c41_7d81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c7_f195] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3201_c1_a90c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output;

     -- ora[uxn_opcodes_h_l3200_c41_3882] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3200_c41_3882_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3200_c41_3882_phase <= VAR_ora_uxn_opcodes_h_l3200_c41_3882_phase;
     ora_uxn_opcodes_h_l3200_c41_3882_ins <= VAR_ora_uxn_opcodes_h_l3200_c41_3882_ins;
     ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3200_c41_3882_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3200_c41_3882_return_output := ora_uxn_opcodes_h_l3200_c41_3882_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c7_f195_return_output;
     VAR_ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3201_c1_a90c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue := VAR_ora_uxn_opcodes_h_l3200_c41_3882_return_output;
     -- ora2[uxn_opcodes_h_l3201_c41_4150] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3201_c41_4150_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3201_c41_4150_phase <= VAR_ora2_uxn_opcodes_h_l3201_c41_4150_phase;
     ora2_uxn_opcodes_h_l3201_c41_4150_ins <= VAR_ora2_uxn_opcodes_h_l3201_c41_4150_ins;
     ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3201_c41_4150_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3201_c41_4150_return_output := ora2_uxn_opcodes_h_l3201_c41_4150_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c7_4f85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3202_c1_36ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output;
     VAR_eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3202_c1_36ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue := VAR_ora2_uxn_opcodes_h_l3201_c41_4150_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3203_c1_38d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c7_5f74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output;

     -- eor[uxn_opcodes_h_l3202_c41_0321] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3202_c41_0321_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3202_c41_0321_phase <= VAR_eor_uxn_opcodes_h_l3202_c41_0321_phase;
     eor_uxn_opcodes_h_l3202_c41_0321_ins <= VAR_eor_uxn_opcodes_h_l3202_c41_0321_ins;
     eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3202_c41_0321_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3202_c41_0321_return_output := eor_uxn_opcodes_h_l3202_c41_0321_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output;
     VAR_eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3203_c1_38d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue := VAR_eor_uxn_opcodes_h_l3202_c41_0321_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c7_18c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output;

     -- eor2[uxn_opcodes_h_l3203_c41_e700] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3203_c41_e700_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3203_c41_e700_phase <= VAR_eor2_uxn_opcodes_h_l3203_c41_e700_phase;
     eor2_uxn_opcodes_h_l3203_c41_e700_ins <= VAR_eor2_uxn_opcodes_h_l3203_c41_e700_ins;
     eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3203_c41_e700_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3203_c41_e700_return_output := eor2_uxn_opcodes_h_l3203_c41_e700_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3204_c1_75e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output;
     VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3204_c1_75e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue := VAR_eor2_uxn_opcodes_h_l3203_c41_e700_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3206_c1_4f7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output;

     -- sft[uxn_opcodes_h_l3204_c41_a9bb] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3204_c41_a9bb_phase <= VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_phase;
     sft_uxn_opcodes_h_l3204_c41_a9bb_ins <= VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_ins;
     sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_return_output := sft_uxn_opcodes_h_l3204_c41_a9bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3205_c1_fb14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3206_c1_4f7a_return_output;
     VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3205_c1_fb14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue := VAR_sft_uxn_opcodes_h_l3204_c41_a9bb_return_output;
     -- printf_uxn_opcodes_h_l3206_c9_0eab[uxn_opcodes_h_l3206_c9_0eab] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0 <= VAR_printf_uxn_opcodes_h_l3206_c9_0eab_uxn_opcodes_h_l3206_c9_0eab_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l3205_c41_52e8] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3205_c41_52e8_phase <= VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_phase;
     sft2_uxn_opcodes_h_l3205_c41_52e8_ins <= VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_ins;
     sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_return_output := sft2_uxn_opcodes_h_l3205_c41_52e8_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue := VAR_sft2_uxn_opcodes_h_l3205_c41_52e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3205_c7_18c1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_cond;
     opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output := opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3205_c7_18c1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3204_c7_5f74] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_cond;
     opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output := opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3204_c7_5f74_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3203_c7_4f85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_cond;
     opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output := opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3203_c7_4f85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3202_c7_f195] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_cond;
     opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output := opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3202_c7_f195_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3201_c7_bfc5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_cond;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output := opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3201_c7_bfc5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3200_c7_7f99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_cond;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output := opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3200_c7_7f99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3199_c7_3184] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_cond;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output := opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3199_c7_3184_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3198_c7_fdaa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_cond;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output := opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3198_c7_fdaa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3197_c7_beeb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_cond;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output := opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3197_c7_beeb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3196_c7_df04] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_cond;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output := opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3196_c7_df04_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3195_c7_6b62] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_cond;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output := opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3195_c7_6b62_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3194_c7_dfe5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_cond;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output := opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3194_c7_dfe5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3193_c7_e72c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_cond;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output := opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3193_c7_e72c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3192_c7_16b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_cond;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output := opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3192_c7_16b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3191_c7_7f18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_cond;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output := opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3191_c7_7f18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3190_c7_d675] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_cond;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output := opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3190_c7_d675_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3189_c7_29e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_cond;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output := opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3189_c7_29e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3188_c7_4bbe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_cond;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output := opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3188_c7_4bbe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3187_c7_3479] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_cond;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output := opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3187_c7_3479_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3186_c7_616d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_cond;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output := opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3186_c7_616d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3185_c7_8bc5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_cond;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output := opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3185_c7_8bc5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3184_c7_3d61] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_cond;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output := opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3184_c7_3d61_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3183_c7_688c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_cond;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output := opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3183_c7_688c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3182_c7_9575] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_cond;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output := opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3182_c7_9575_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3181_c7_0812] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_cond;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output := opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3181_c7_0812_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3180_c7_c035] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_cond;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output := opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3180_c7_c035_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3179_c7_2bc7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_cond;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output := opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3179_c7_2bc7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3178_c7_50e9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_cond;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output := opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3178_c7_50e9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3177_c7_d908] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_cond;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output := opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3177_c7_d908_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3176_c7_b689] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_cond;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output := opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3176_c7_b689_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3175_c7_c491] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_cond;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output := opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3175_c7_c491_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3174_c7_d6ea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_cond;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output := opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3174_c7_d6ea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3173_c7_ecf2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_cond;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output := opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3173_c7_ecf2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3172_c7_09ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_cond;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output := opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3172_c7_09ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3171_c7_db1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_cond;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output := opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3171_c7_db1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3170_c7_0bca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_cond;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output := opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3170_c7_0bca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3169_c7_5439] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_cond;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output := opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3169_c7_5439_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3168_c7_0780] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_cond;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output := opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3168_c7_0780_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3167_c7_4747] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_cond;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output := opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3167_c7_4747_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3166_c7_3355] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_cond;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output := opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3166_c7_3355_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3165_c7_3055] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_cond;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output := opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3165_c7_3055_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3164_c7_15f8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_cond;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output := opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3164_c7_15f8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3163_c7_ea64] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_cond;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output := opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3163_c7_ea64_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3162_c7_f1c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_cond;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output := opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3162_c7_f1c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3161_c7_cc5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_cond;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output := opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3161_c7_cc5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3160_c7_73d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_cond;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output := opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3160_c7_73d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3159_c7_0fb3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_cond;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output := opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3159_c7_0fb3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3158_c7_ce59] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_cond;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output := opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3158_c7_ce59_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3157_c7_4a8f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_cond;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output := opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3157_c7_4a8f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3156_c7_61a1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_cond;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output := opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3156_c7_61a1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3155_c7_d1d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_cond;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output := opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3155_c7_d1d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3154_c7_c9b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_cond;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output := opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3154_c7_c9b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3153_c7_fe18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_cond;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output := opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3153_c7_fe18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3152_c7_19aa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_cond;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output := opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3152_c7_19aa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3151_c7_10af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_cond;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output := opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3151_c7_10af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3150_c7_1ffd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_cond;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output := opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3150_c7_1ffd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3149_c7_eaf3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_cond;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output := opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3149_c7_eaf3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3148_c7_d708] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_cond;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output := opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3148_c7_d708_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3147_c7_cb8f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_cond;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output := opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3147_c7_cb8f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3146_c7_2047] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_cond;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output := opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3146_c7_2047_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3145_c7_4353] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_cond;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output := opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3145_c7_4353_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3144_c7_6dfe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_cond;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output := opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3144_c7_6dfe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3143_c7_61cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_cond;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output := opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3143_c7_61cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3142_c7_cd56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_cond;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output := opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3142_c7_cd56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3141_c7_cbe7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_cond;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output := opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3141_c7_cbe7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3140_c7_206e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_cond;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output := opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3140_c7_206e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3139_c7_aea5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_cond;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output := opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3139_c7_aea5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3138_c7_5c5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_cond;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output := opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3138_c7_5c5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3137_c7_340c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_cond;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output := opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3137_c7_340c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3136_c2_5feb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_cond;
     opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output := opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l3219_c22_5b8e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_5b8e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l3234_c23_d90b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_d90b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_48ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_48ba_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3208_c6_54f8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_54f8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_sp_shift;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l3241_c31_3382] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_3382_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3233_c34_0d2e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_0d2e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3238_c34_de6b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_de6b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l3236_c29_2ef0] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_2ef0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l3229_c3_82b7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_82b7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.device_ram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3240_c33_2545] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_2545_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3239_c37_61a0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_61a0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3230_c3_0b78] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_0b78_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3216_c19_24e7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_24e7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3210_l3212_DUPLICATE_7f10 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3210_l3212_DUPLICATE_7f10_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3235_c33_8ace] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_8ace_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3228_c3_51ab] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_51ab_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3242_c32_6b2c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_6b2c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l3237_c30_7a8e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_7a8e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3217_c82_1d46] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_1d46_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3136_c2_5feb_return_output.stack_address_sp_offset;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3210_l3212_DUPLICATE_7f10_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3210_l3212_DUPLICATE_7f10_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3230_c3_0b78_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_54f8_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3208_c6_54f8_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3217_l3218_l3209_DUPLICATE_48ba_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_24e7_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3216_c19_24e7_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3228_c3_51ab_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l3229_c3_82b7_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3217_c82_1d46_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_5b8e_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3219_c22_5b8e_return_output;
     -- device_ram_update[uxn_opcodes_h_l3227_c26_e341] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_device_address;
     device_ram_update_uxn_opcodes_h_l3227_c26_e341_value <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_value;
     device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable <= VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output := device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output;

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_98a9 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_98a9_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3233_c34_0d2e_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l3234_c23_d90b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3235_c33_8ace_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l3236_c29_2ef0_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l3237_c30_7a8e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3238_c34_de6b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3239_c37_61a0_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3240_c33_2545_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l3241_c31_3382_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3242_c32_6b2c_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l3210_c4_6704] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3212_c4_f71d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l3210_c4_c464 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3210_c4_6704_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3212_c4_03d5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3212_c4_f71d_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output;
     VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l3218_l3209_l3217_DUPLICATE_7c52_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_98a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_3a71_uxn_opcodes_h_l3244_l3115_DUPLICATE_98a9_return_output;
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_opcodes_h_l3227_c26_e341_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse := VAR_sp0_uxn_opcodes_h_l3212_c4_03d5;
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue := VAR_sp1_uxn_opcodes_h_l3210_c4_c464;
     -- sp0_MUX[uxn_opcodes_h_l3209_c3_eb6a] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond;
     sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue;
     sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output := sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output;

     -- MUX[uxn_opcodes_h_l3218_c20_2efb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3218_c20_2efb_cond <= VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_cond;
     MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue <= VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iftrue;
     MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse <= VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_return_output := MUX_uxn_opcodes_h_l3218_c20_2efb_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3209_c3_eb6a] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_cond;
     sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iftrue;
     sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output := sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output;

     -- Submodule level 148
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right := VAR_MUX_uxn_opcodes_h_l3218_c20_2efb_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3209_c3_eb6a_return_output;
     -- sp0_MUX[uxn_opcodes_h_l3208_c2_1e57] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_cond;
     sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue;
     sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output := sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3208_c2_1e57] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_cond;
     sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iftrue;
     sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output := sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;
     VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3208_c2_1e57_return_output;
     -- MUX[uxn_opcodes_h_l3217_c19_2d7e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3217_c19_2d7e_cond <= VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_cond;
     MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue <= VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iftrue;
     MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse <= VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output := MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left := VAR_MUX_uxn_opcodes_h_l3217_c19_2d7e_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3217_c19_b530] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l3217_c2_36dd := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l3217_c19_b530_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left := VAR_stack_address_uxn_opcodes_h_l3217_c2_36dd;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3218_c2_b044] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output;

     -- Submodule level 152
     VAR_stack_address_uxn_opcodes_h_l3218_c2_ecdc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3218_c2_b044_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3218_c2_ecdc;
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address := VAR_stack_address_uxn_opcodes_h_l3218_c2_ecdc;
     -- stack_ram_update[uxn_opcodes_h_l3221_c21_465a] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_stack_address;
     stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_value;
     stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output := stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3221_c21_465a_return_output;
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
