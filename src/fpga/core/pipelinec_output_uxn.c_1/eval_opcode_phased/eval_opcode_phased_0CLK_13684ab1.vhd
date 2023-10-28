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
-- Submodules: 377
entity eval_opcode_phased_0CLK_13684ab1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_13684ab1;
architecture arch of eval_opcode_phased_0CLK_13684ab1 is
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
signal REG_COMB_stack_address : unsigned(11 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l3051_c10_00cc]
signal BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3051_c10_1002]
signal BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3051_c41_8117]
signal BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3051_c57_75e9]
signal CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3051_c10_dfb1]
signal MUX_uxn_opcodes_h_l3051_c10_dfb1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l3054_c2_0d05[uxn_opcodes_h_l3054_c2_0d05]
signal printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3056_c6_1d7e]
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_ace2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3056_c2_7da6]
signal opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_c999]
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_85ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_db6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3057_c7_ace2]
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3057_c41_f650]
signal jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3057_c41_f650_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3057_c41_f650_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3057_c41_f650_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_283e]
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_be8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_e6b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3058_c7_db6f]
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3058_c41_e8e2]
signal jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3058_c41_e8e2_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3058_c41_e8e2_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_1937]
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_6b12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_cc15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3059_c7_e6b4]
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3059_c41_d200]
signal jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3059_c41_d200_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3059_c41_d200_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3059_c41_d200_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_54a9]
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_ce2e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_4b0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3060_c7_cc15]
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3060_c41_2224]
signal lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_2224_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_2224_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_2224_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_263e]
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_5bd5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_e56e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3061_c7_4b0d]
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3061_c41_7cfc]
signal lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_7cfc_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_7cfc_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_b7f0]
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_4c8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_9129]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3062_c7_e56e]
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3062_c41_95fb]
signal lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3062_c41_95fb_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3062_c41_95fb_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3062_c41_95fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_38f8]
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_0b95]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_05b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3063_c7_9129]
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3063_c41_cff0]
signal lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3063_c41_cff0_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3063_c41_cff0_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3063_c41_cff0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_a63c]
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_2b57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_eab3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3064_c7_05b6]
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3064_c41_fd92]
signal inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3064_c41_fd92_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3064_c41_fd92_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3064_c41_fd92_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_47c6]
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_2b75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_0897]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3065_c7_eab3]
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3065_c41_6b44]
signal inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3065_c41_6b44_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3065_c41_6b44_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3065_c41_6b44_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3eb1]
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_9b85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_d339]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3066_c7_0897]
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3066_c41_020a]
signal pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3066_c41_020a_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3066_c41_020a_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3066_c41_020a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_f85a]
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_0d96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_1385]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3067_c7_d339]
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3067_c41_2229]
signal pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3067_c41_2229_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3067_c41_2229_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3067_c41_2229_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_53fd]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_b36c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_8420]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3068_c7_1385]
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3068_c41_a062]
signal nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3068_c41_a062_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3068_c41_a062_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3068_c41_a062_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_b7aa]
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_647a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_5373]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3069_c7_8420]
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3069_c41_7b43]
signal nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3069_c41_7b43_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3069_c41_7b43_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3069_c41_7b43_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_62dc]
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_46df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_b11f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3070_c7_5373]
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3070_c41_ddb9]
signal swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3070_c41_ddb9_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3070_c41_ddb9_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3070_c41_ddb9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_cbca]
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_2d48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_2029]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3071_c7_b11f]
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3071_c41_5e92]
signal swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3071_c41_5e92_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3071_c41_5e92_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3071_c41_5e92_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_79c0]
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_374b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_179e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3072_c7_2029]
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3072_c41_1896]
signal rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3072_c41_1896_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3072_c41_1896_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3072_c41_1896_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_8499]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_9e0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_6242]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3073_c7_179e]
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3073_c41_fbe0]
signal rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3073_c41_fbe0_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3073_c41_fbe0_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_54e3]
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_7a62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_adf3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3074_c7_6242]
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3074_c41_ec57]
signal dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3074_c41_ec57_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3074_c41_ec57_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3074_c41_ec57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_774a]
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_8bbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_9885]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3075_c7_adf3]
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3075_c41_6177]
signal dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3075_c41_6177_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3075_c41_6177_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3075_c41_6177_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_0565]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_7092]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_c450]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3076_c7_9885]
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3076_c41_27c1]
signal ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3076_c41_27c1_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3076_c41_27c1_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3076_c41_27c1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_98cc]
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_d885]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_4c72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3077_c7_c450]
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3077_c41_482d]
signal ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3077_c41_482d_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3077_c41_482d_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3077_c41_482d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_c96d]
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_f2b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_3738]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3078_c7_4c72]
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3078_c41_8bc1]
signal equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3078_c41_8bc1_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3078_c41_8bc1_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3078_c41_8bc1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_9733]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_1598]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_0d11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3079_c7_3738]
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3079_c41_0d85]
signal equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3079_c41_0d85_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3079_c41_0d85_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3079_c41_0d85_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_6ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_0f25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_b417]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3080_c7_0d11]
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3080_c41_8565]
signal neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3080_c41_8565_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3080_c41_8565_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3080_c41_8565_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_4ded]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_9c5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_f416]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3081_c7_b417]
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3081_c41_f588]
signal neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3081_c41_f588_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3081_c41_f588_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3081_c41_f588_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_ea4c]
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_c66e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_527a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3082_c7_f416]
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3082_c41_7017]
signal gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3082_c41_7017_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3082_c41_7017_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3082_c41_7017_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_ecf7]
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_f893]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_f8f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3083_c7_527a]
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3083_c41_8ac2]
signal gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3083_c41_8ac2_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3083_c41_8ac2_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_805f]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_4021]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_f580]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3084_c7_f8f4]
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3084_c41_cda6]
signal lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3084_c41_cda6_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3084_c41_cda6_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3084_c41_cda6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_70e8]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_6bda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_d60b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3085_c7_f580]
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3085_c41_0ac5]
signal lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3085_c41_0ac5_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3085_c41_0ac5_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_fb43]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_f01e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_5fdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3086_c7_d60b]
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3086_c41_04a8]
signal jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3086_c41_04a8_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3086_c41_04a8_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3086_c41_04a8_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3086_c41_04a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_9ff5]
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_695b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_1e2f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3087_c7_5fdd]
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3087_c41_c220]
signal jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3087_c41_c220_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3087_c41_c220_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3087_c41_c220_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_73e6]
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_dd03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_eed2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3088_c7_1e2f]
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3088_c41_b70b]
signal jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3088_c41_b70b_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3088_c41_b70b_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3088_c41_b70b_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3088_c41_b70b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_a7e9]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_d97e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_8a90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3089_c7_eed2]
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3089_c41_59dd]
signal jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3089_c41_59dd_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3089_c41_59dd_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_ae54]
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_4521]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_99e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3090_c7_8a90]
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3090_c41_dc61]
signal jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3090_c41_dc61_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3090_c41_dc61_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3090_c41_dc61_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3090_c41_dc61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_1689]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_f1fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_1ad0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3091_c7_99e2]
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3091_c41_9fed]
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_7ec0]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_109e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_d066]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3092_c7_1ad0]
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3092_c41_8703]
signal sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3092_c41_8703_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3092_c41_8703_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3092_c41_8703_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_a7c8]
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_942d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_8950]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3093_c7_d066]
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3093_c41_46ca]
signal sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3093_c41_46ca_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3093_c41_46ca_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3093_c41_46ca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_8a84]
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_3060]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_4138]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3094_c7_8950]
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3094_c41_4421]
signal ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3094_c41_4421_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3094_c41_4421_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3094_c41_4421_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_02cd]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_4378]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_3acd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3095_c7_4138]
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3095_c41_7dcc]
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_36b3]
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_fe8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_6811]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3096_c7_3acd]
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3096_c41_a188]
signal stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3096_c41_a188_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3096_c41_a188_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3096_c41_a188_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_0be6]
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_e207]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_b343]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3097_c7_6811]
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3097_c41_2fb4]
signal stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3097_c41_2fb4_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3097_c41_2fb4_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_84fd]
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_daac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_36dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3098_c7_b343]
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3098_c41_71ef]
signal ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3098_c41_71ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_942b]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_1f08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_f2b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3099_c7_36dc]
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3099_c41_6c12]
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_60b7]
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_bd17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_2be1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3100_c7_f2b2]
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3100_c41_60f0]
signal str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3100_c41_60f0_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3100_c41_60f0_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3100_c41_60f0_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3100_c41_60f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_0d6f]
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_6ef6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_2cc3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3101_c7_2be1]
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3101_c41_5569]
signal str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3101_c41_5569_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3101_c41_5569_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3101_c41_5569_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3101_c41_5569_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_4080]
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_71a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_ae4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3102_c7_2cc3]
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3102_c41_67b0]
signal lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3102_c41_67b0_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3102_c41_67b0_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3102_c41_67b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ac91]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_bec0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_d033]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3103_c7_ae4b]
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3103_c41_eb50]
signal lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3103_c41_eb50_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3103_c41_eb50_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3103_c41_eb50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_4d2c]
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_6f44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_9960]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3104_c7_d033]
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3104_c41_6a02]
signal sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3104_c41_6a02_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3104_c41_6a02_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3104_c41_6a02_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_5980]
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_b3fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_4215]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3105_c7_9960]
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3105_c41_b913]
signal sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3105_c41_b913_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3105_c41_b913_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3105_c41_b913_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_74ae]
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_9833]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_f015]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3106_c7_4215]
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3106_c41_dfcd]
signal dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3106_c41_dfcd_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3106_c41_dfcd_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3106_c41_dfcd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_81cc]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_3bfc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_c237]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3107_c7_f015]
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3107_c41_bcc0]
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_b112]
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_4161]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_3368]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3108_c7_c237]
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3108_c41_7822]
signal deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3108_c41_7822_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_565d]
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_3849]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_0f17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3109_c7_3368]
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3109_c41_ebcb]
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_a71f]
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_544b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_bf11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3110_c7_0f17]
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3110_c41_a3f0]
signal add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3110_c41_a3f0_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3110_c41_a3f0_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3110_c41_a3f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_02c1]
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_af04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_d51d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3111_c7_bf11]
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3111_c41_1956]
signal add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3111_c41_1956_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3111_c41_1956_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3111_c41_1956_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_2750]
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_fedf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_c82a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3112_c7_d51d]
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3112_c41_a647]
signal sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3112_c41_a647_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3112_c41_a647_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3112_c41_a647_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_519f]
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_68af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_91cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3113_c7_c82a]
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3113_c41_2d51]
signal sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3113_c41_2d51_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3113_c41_2d51_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3113_c41_2d51_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_9fb8]
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_2cc7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_35ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3114_c7_91cc]
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3114_c41_9ac1]
signal mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3114_c41_9ac1_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3114_c41_9ac1_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3114_c41_9ac1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_4c23]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_83aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_73d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3115_c7_35ca]
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3115_c41_3557]
signal mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3115_c41_3557_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3115_c41_3557_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3115_c41_3557_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_80ed]
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_d819]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_ec48]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3116_c7_73d3]
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3116_c41_3039]
signal div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3116_c41_3039_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3116_c41_3039_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3116_c41_3039_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_d9ae]
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_bf3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_1d22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3117_c7_ec48]
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3117_c41_3810]
signal div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3117_c41_3810_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3117_c41_3810_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3117_c41_3810_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_d5eb]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_b1c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_e66c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3118_c7_1d22]
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3118_c41_2475]
signal and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3118_c41_2475_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3118_c41_2475_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3118_c41_2475_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_6a1a]
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_5ece]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c7_6684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3119_c7_e66c]
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3119_c41_14ba]
signal and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3119_c41_14ba_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3119_c41_14ba_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3119_c41_14ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3120_c11_9a60]
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_45fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c7_2303]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3120_c7_6684]
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3120_c41_3219]
signal ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3120_c41_3219_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3120_c41_3219_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3120_c41_3219_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_5c57]
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c1_e91e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c7_dedf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3121_c7_2303]
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3121_c41_7f66]
signal ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3121_c41_7f66_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3121_c41_7f66_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3121_c41_7f66_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_c26a]
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c1_8e5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c7_2401]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3122_c7_dedf]
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3122_c41_1109]
signal eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3122_c41_1109_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3122_c41_1109_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3122_c41_1109_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3123_c11_c6f1]
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c1_68a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c7_769e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3123_c7_2401]
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3123_c41_a2ea]
signal eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3123_c41_a2ea_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3123_c41_a2ea_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3124_c11_bb1d]
signal BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c1_2b3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3125_c7_c67a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3124_c7_769e]
signal opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3124_c41_d2ee]
signal sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3124_c41_d2ee_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3124_c41_d2ee_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3124_c41_d2ee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_a332]
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3125_c1_597b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3126_c1_8ece]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3125_c7_c67a]
signal opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3125_c41_413b]
signal sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3125_c41_413b_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3125_c41_413b_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3125_c41_413b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3126_c9_5615[uxn_opcodes_h_l3126_c9_5615]
signal printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3128_c18_765a]
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3128_c18_ccda]
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3128_c18_4410]
signal MUX_uxn_opcodes_h_l3128_c18_4410_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_4410_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_4410_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3128_c18_4410_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l3129_c2_c6d0]
signal BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3131_c2_139c]
signal sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3131_c2_139c]
signal sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3132_c3_a76f]
signal sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3132_c3_a76f]
signal sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3133_c4_f009]
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3135_c4_3b5f]
signal BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3139_c30_925c]
signal MUX_uxn_opcodes_h_l3139_c30_925c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3139_c30_925c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3139_c30_925c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3139_c30_925c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3139_c19_9b1f]
signal BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3140_c20_9ff9]
signal MUX_uxn_opcodes_h_l3140_c20_9ff9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3140_c2_e6c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3142_c21_f782]
signal stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53( ref_toks_0 : unsigned;
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
      base.device_ram_address := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc
BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left,
BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right,
BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002
BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left,
BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right,
BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117
BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left,
BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right,
BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9
CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x,
CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output);

-- MUX_uxn_opcodes_h_l3051_c10_dfb1
MUX_uxn_opcodes_h_l3051_c10_dfb1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3051_c10_dfb1_cond,
MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue,
MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse,
MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output);

-- printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05
printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05 : entity work.printf_uxn_opcodes_h_l3054_c2_0d05_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0,
printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1,
printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e
BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left,
BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right,
BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6
opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond,
opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2
opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output);

-- jci_uxn_opcodes_h_l3057_c41_f650
jci_uxn_opcodes_h_l3057_c41_f650 : entity work.jci_0CLK_9ff5fd8d port map (
clk,
jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3057_c41_f650_phase,
jci_uxn_opcodes_h_l3057_c41_f650_pc,
jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read,
jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read,
jci_uxn_opcodes_h_l3057_c41_f650_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f
opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond,
opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output);

-- jmi_uxn_opcodes_h_l3058_c41_e8e2
jmi_uxn_opcodes_h_l3058_c41_e8e2 : entity work.jmi_0CLK_e573058b port map (
clk,
jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3058_c41_e8e2_phase,
jmi_uxn_opcodes_h_l3058_c41_e8e2_pc,
jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read,
jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4
opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond,
opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output);

-- jsi_uxn_opcodes_h_l3059_c41_d200
jsi_uxn_opcodes_h_l3059_c41_d200 : entity work.jsi_0CLK_06911bbe port map (
clk,
jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3059_c41_d200_phase,
jsi_uxn_opcodes_h_l3059_c41_d200_pc,
jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read,
jsi_uxn_opcodes_h_l3059_c41_d200_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15
opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond,
opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue,
opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse,
opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output);

-- lit_uxn_opcodes_h_l3060_c41_2224
lit_uxn_opcodes_h_l3060_c41_2224 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3060_c41_2224_phase,
lit_uxn_opcodes_h_l3060_c41_2224_pc,
lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read,
lit_uxn_opcodes_h_l3060_c41_2224_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d
opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond,
opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output);

-- lit2_uxn_opcodes_h_l3061_c41_7cfc
lit2_uxn_opcodes_h_l3061_c41_7cfc : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3061_c41_7cfc_phase,
lit2_uxn_opcodes_h_l3061_c41_7cfc_pc,
lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read,
lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e
opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond,
opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output);

-- lit_uxn_opcodes_h_l3062_c41_95fb
lit_uxn_opcodes_h_l3062_c41_95fb : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3062_c41_95fb_phase,
lit_uxn_opcodes_h_l3062_c41_95fb_pc,
lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read,
lit_uxn_opcodes_h_l3062_c41_95fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3063_c7_9129
opc_result_MUX_uxn_opcodes_h_l3063_c7_9129 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond,
opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue,
opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse,
opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output);

-- lit2_uxn_opcodes_h_l3063_c41_cff0
lit2_uxn_opcodes_h_l3063_c41_cff0 : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3063_c41_cff0_phase,
lit2_uxn_opcodes_h_l3063_c41_cff0_pc,
lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read,
lit2_uxn_opcodes_h_l3063_c41_cff0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6
opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond,
opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output);

-- inc_uxn_opcodes_h_l3064_c41_fd92
inc_uxn_opcodes_h_l3064_c41_fd92 : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3064_c41_fd92_phase,
inc_uxn_opcodes_h_l3064_c41_fd92_ins,
inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read,
inc_uxn_opcodes_h_l3064_c41_fd92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3
opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond,
opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output);

-- inc2_uxn_opcodes_h_l3065_c41_6b44
inc2_uxn_opcodes_h_l3065_c41_6b44 : entity work.inc2_0CLK_861257cf port map (
clk,
inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3065_c41_6b44_phase,
inc2_uxn_opcodes_h_l3065_c41_6b44_ins,
inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read,
inc2_uxn_opcodes_h_l3065_c41_6b44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3066_c7_0897
opc_result_MUX_uxn_opcodes_h_l3066_c7_0897 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output);

-- pop_uxn_opcodes_h_l3066_c41_020a
pop_uxn_opcodes_h_l3066_c41_020a : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3066_c41_020a_phase,
pop_uxn_opcodes_h_l3066_c41_020a_ins,
pop_uxn_opcodes_h_l3066_c41_020a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3067_c7_d339
opc_result_MUX_uxn_opcodes_h_l3067_c7_d339 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond,
opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue,
opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse,
opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output);

-- pop2_uxn_opcodes_h_l3067_c41_2229
pop2_uxn_opcodes_h_l3067_c41_2229 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3067_c41_2229_phase,
pop2_uxn_opcodes_h_l3067_c41_2229_ins,
pop2_uxn_opcodes_h_l3067_c41_2229_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3068_c7_1385
opc_result_MUX_uxn_opcodes_h_l3068_c7_1385 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond,
opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue,
opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse,
opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output);

-- nip_uxn_opcodes_h_l3068_c41_a062
nip_uxn_opcodes_h_l3068_c41_a062 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3068_c41_a062_phase,
nip_uxn_opcodes_h_l3068_c41_a062_ins,
nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read,
nip_uxn_opcodes_h_l3068_c41_a062_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3069_c7_8420
opc_result_MUX_uxn_opcodes_h_l3069_c7_8420 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond,
opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue,
opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse,
opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output);

-- nip2_uxn_opcodes_h_l3069_c41_7b43
nip2_uxn_opcodes_h_l3069_c41_7b43 : entity work.nip2_0CLK_15c648e1 port map (
clk,
nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3069_c41_7b43_phase,
nip2_uxn_opcodes_h_l3069_c41_7b43_ins,
nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read,
nip2_uxn_opcodes_h_l3069_c41_7b43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3070_c7_5373
opc_result_MUX_uxn_opcodes_h_l3070_c7_5373 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond,
opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue,
opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse,
opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output);

-- swp_uxn_opcodes_h_l3070_c41_ddb9
swp_uxn_opcodes_h_l3070_c41_ddb9 : entity work.swp_0CLK_bf6dd460 port map (
clk,
swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3070_c41_ddb9_phase,
swp_uxn_opcodes_h_l3070_c41_ddb9_ins,
swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read,
swp_uxn_opcodes_h_l3070_c41_ddb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f
opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond,
opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output);

-- swp2_uxn_opcodes_h_l3071_c41_5e92
swp2_uxn_opcodes_h_l3071_c41_5e92 : entity work.swp2_0CLK_27acc40e port map (
clk,
swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3071_c41_5e92_phase,
swp2_uxn_opcodes_h_l3071_c41_5e92_ins,
swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read,
swp2_uxn_opcodes_h_l3071_c41_5e92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3072_c7_2029
opc_result_MUX_uxn_opcodes_h_l3072_c7_2029 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond,
opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue,
opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse,
opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output);

-- rot_uxn_opcodes_h_l3072_c41_1896
rot_uxn_opcodes_h_l3072_c41_1896 : entity work.rot_0CLK_97b3b4bb port map (
clk,
rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3072_c41_1896_phase,
rot_uxn_opcodes_h_l3072_c41_1896_ins,
rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read,
rot_uxn_opcodes_h_l3072_c41_1896_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3073_c7_179e
opc_result_MUX_uxn_opcodes_h_l3073_c7_179e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond,
opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output);

-- rot2_uxn_opcodes_h_l3073_c41_fbe0
rot2_uxn_opcodes_h_l3073_c41_fbe0 : entity work.rot2_0CLK_fc44b089 port map (
clk,
rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3073_c41_fbe0_phase,
rot2_uxn_opcodes_h_l3073_c41_fbe0_ins,
rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read,
rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3074_c7_6242
opc_result_MUX_uxn_opcodes_h_l3074_c7_6242 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond,
opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue,
opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse,
opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output);

-- dup_uxn_opcodes_h_l3074_c41_ec57
dup_uxn_opcodes_h_l3074_c41_ec57 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3074_c41_ec57_phase,
dup_uxn_opcodes_h_l3074_c41_ec57_ins,
dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read,
dup_uxn_opcodes_h_l3074_c41_ec57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3
opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond,
opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output);

-- dup2_uxn_opcodes_h_l3075_c41_6177
dup2_uxn_opcodes_h_l3075_c41_6177 : entity work.dup2_0CLK_be266937 port map (
clk,
dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3075_c41_6177_phase,
dup2_uxn_opcodes_h_l3075_c41_6177_ins,
dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read,
dup2_uxn_opcodes_h_l3075_c41_6177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3076_c7_9885
opc_result_MUX_uxn_opcodes_h_l3076_c7_9885 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond,
opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue,
opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse,
opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output);

-- ovr_uxn_opcodes_h_l3076_c41_27c1
ovr_uxn_opcodes_h_l3076_c41_27c1 : entity work.ovr_0CLK_a1f536f9 port map (
clk,
ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3076_c41_27c1_phase,
ovr_uxn_opcodes_h_l3076_c41_27c1_ins,
ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read,
ovr_uxn_opcodes_h_l3076_c41_27c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3077_c7_c450
opc_result_MUX_uxn_opcodes_h_l3077_c7_c450 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond,
opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue,
opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse,
opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output);

-- ovr2_uxn_opcodes_h_l3077_c41_482d
ovr2_uxn_opcodes_h_l3077_c41_482d : entity work.ovr2_0CLK_a10f7d9d port map (
clk,
ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3077_c41_482d_phase,
ovr2_uxn_opcodes_h_l3077_c41_482d_ins,
ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read,
ovr2_uxn_opcodes_h_l3077_c41_482d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72
opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond,
opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue,
opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse,
opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output);

-- equ_uxn_opcodes_h_l3078_c41_8bc1
equ_uxn_opcodes_h_l3078_c41_8bc1 : entity work.equ_0CLK_6d7675a8 port map (
clk,
equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3078_c41_8bc1_phase,
equ_uxn_opcodes_h_l3078_c41_8bc1_ins,
equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read,
equ_uxn_opcodes_h_l3078_c41_8bc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3079_c7_3738
opc_result_MUX_uxn_opcodes_h_l3079_c7_3738 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output);

-- equ2_uxn_opcodes_h_l3079_c41_0d85
equ2_uxn_opcodes_h_l3079_c41_0d85 : entity work.equ2_0CLK_c96e1a89 port map (
clk,
equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3079_c41_0d85_phase,
equ2_uxn_opcodes_h_l3079_c41_0d85_ins,
equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read,
equ2_uxn_opcodes_h_l3079_c41_0d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11
opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond,
opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue,
opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse,
opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output);

-- neq_uxn_opcodes_h_l3080_c41_8565
neq_uxn_opcodes_h_l3080_c41_8565 : entity work.neq_0CLK_6d7675a8 port map (
clk,
neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3080_c41_8565_phase,
neq_uxn_opcodes_h_l3080_c41_8565_ins,
neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read,
neq_uxn_opcodes_h_l3080_c41_8565_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3081_c7_b417
opc_result_MUX_uxn_opcodes_h_l3081_c7_b417 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond,
opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue,
opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse,
opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output);

-- neq2_uxn_opcodes_h_l3081_c41_f588
neq2_uxn_opcodes_h_l3081_c41_f588 : entity work.neq2_0CLK_c96e1a89 port map (
clk,
neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3081_c41_f588_phase,
neq2_uxn_opcodes_h_l3081_c41_f588_ins,
neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read,
neq2_uxn_opcodes_h_l3081_c41_f588_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3082_c7_f416
opc_result_MUX_uxn_opcodes_h_l3082_c7_f416 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond,
opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue,
opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse,
opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output);

-- gth_uxn_opcodes_h_l3082_c41_7017
gth_uxn_opcodes_h_l3082_c41_7017 : entity work.gth_0CLK_6d7675a8 port map (
clk,
gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3082_c41_7017_phase,
gth_uxn_opcodes_h_l3082_c41_7017_ins,
gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read,
gth_uxn_opcodes_h_l3082_c41_7017_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3083_c7_527a
opc_result_MUX_uxn_opcodes_h_l3083_c7_527a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond,
opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output);

-- gth2_uxn_opcodes_h_l3083_c41_8ac2
gth2_uxn_opcodes_h_l3083_c41_8ac2 : entity work.gth2_0CLK_c96e1a89 port map (
clk,
gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3083_c41_8ac2_phase,
gth2_uxn_opcodes_h_l3083_c41_8ac2_ins,
gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read,
gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4
opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond,
opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output);

-- lth_uxn_opcodes_h_l3084_c41_cda6
lth_uxn_opcodes_h_l3084_c41_cda6 : entity work.lth_0CLK_6d7675a8 port map (
clk,
lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3084_c41_cda6_phase,
lth_uxn_opcodes_h_l3084_c41_cda6_ins,
lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read,
lth_uxn_opcodes_h_l3084_c41_cda6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3085_c7_f580
opc_result_MUX_uxn_opcodes_h_l3085_c7_f580 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond,
opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue,
opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse,
opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output);

-- lth2_uxn_opcodes_h_l3085_c41_0ac5
lth2_uxn_opcodes_h_l3085_c41_0ac5 : entity work.lth2_0CLK_c96e1a89 port map (
clk,
lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3085_c41_0ac5_phase,
lth2_uxn_opcodes_h_l3085_c41_0ac5_ins,
lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read,
lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b
opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond,
opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output);

-- jmp_uxn_opcodes_h_l3086_c41_04a8
jmp_uxn_opcodes_h_l3086_c41_04a8 : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3086_c41_04a8_phase,
jmp_uxn_opcodes_h_l3086_c41_04a8_ins,
jmp_uxn_opcodes_h_l3086_c41_04a8_pc,
jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read,
jmp_uxn_opcodes_h_l3086_c41_04a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd
opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond,
opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output);

-- jmp2_uxn_opcodes_h_l3087_c41_c220
jmp2_uxn_opcodes_h_l3087_c41_c220 : entity work.jmp2_0CLK_be70b838 port map (
clk,
jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3087_c41_c220_phase,
jmp2_uxn_opcodes_h_l3087_c41_c220_ins,
jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read,
jmp2_uxn_opcodes_h_l3087_c41_c220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f
opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond,
opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output);

-- jcn_uxn_opcodes_h_l3088_c41_b70b
jcn_uxn_opcodes_h_l3088_c41_b70b : entity work.jcn_0CLK_b288bfb7 port map (
clk,
jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3088_c41_b70b_phase,
jcn_uxn_opcodes_h_l3088_c41_b70b_ins,
jcn_uxn_opcodes_h_l3088_c41_b70b_pc,
jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read,
jcn_uxn_opcodes_h_l3088_c41_b70b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2
opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond,
opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output);

-- jcn2_uxn_opcodes_h_l3089_c41_59dd
jcn2_uxn_opcodes_h_l3089_c41_59dd : entity work.jcn2_0CLK_f91b0bf2 port map (
clk,
jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3089_c41_59dd_phase,
jcn2_uxn_opcodes_h_l3089_c41_59dd_ins,
jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read,
jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90
opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond,
opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue,
opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse,
opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output);

-- jsr_uxn_opcodes_h_l3090_c41_dc61
jsr_uxn_opcodes_h_l3090_c41_dc61 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3090_c41_dc61_phase,
jsr_uxn_opcodes_h_l3090_c41_dc61_ins,
jsr_uxn_opcodes_h_l3090_c41_dc61_pc,
jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read,
jsr_uxn_opcodes_h_l3090_c41_dc61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2
opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond,
opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output);

-- jsr2_uxn_opcodes_h_l3091_c41_9fed
jsr2_uxn_opcodes_h_l3091_c41_9fed : entity work.jsr2_0CLK_6e0dc44d port map (
clk,
jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3091_c41_9fed_phase,
jsr2_uxn_opcodes_h_l3091_c41_9fed_ins,
jsr2_uxn_opcodes_h_l3091_c41_9fed_pc,
jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read,
jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output);

-- sth_uxn_opcodes_h_l3092_c41_8703
sth_uxn_opcodes_h_l3092_c41_8703 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3092_c41_8703_phase,
sth_uxn_opcodes_h_l3092_c41_8703_ins,
sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read,
sth_uxn_opcodes_h_l3092_c41_8703_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3093_c7_d066
opc_result_MUX_uxn_opcodes_h_l3093_c7_d066 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output);

-- sth2_uxn_opcodes_h_l3093_c41_46ca
sth2_uxn_opcodes_h_l3093_c41_46ca : entity work.sth2_0CLK_f91b0bf2 port map (
clk,
sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3093_c41_46ca_phase,
sth2_uxn_opcodes_h_l3093_c41_46ca_ins,
sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read,
sth2_uxn_opcodes_h_l3093_c41_46ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3094_c7_8950
opc_result_MUX_uxn_opcodes_h_l3094_c7_8950 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output);

-- ldz_uxn_opcodes_h_l3094_c41_4421
ldz_uxn_opcodes_h_l3094_c41_4421 : entity work.ldz_0CLK_46731a7b port map (
clk,
ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3094_c41_4421_phase,
ldz_uxn_opcodes_h_l3094_c41_4421_ins,
ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read,
ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read,
ldz_uxn_opcodes_h_l3094_c41_4421_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3095_c7_4138
opc_result_MUX_uxn_opcodes_h_l3095_c7_4138 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond,
opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue,
opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse,
opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output);

-- ldz2_uxn_opcodes_h_l3095_c41_7dcc
ldz2_uxn_opcodes_h_l3095_c41_7dcc : entity work.ldz2_0CLK_1417ec42 port map (
clk,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read,
ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd
opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond,
opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output);

-- stz_uxn_opcodes_h_l3096_c41_a188
stz_uxn_opcodes_h_l3096_c41_a188 : entity work.stz_0CLK_75b4bee3 port map (
clk,
stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3096_c41_a188_phase,
stz_uxn_opcodes_h_l3096_c41_a188_ins,
stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read,
stz_uxn_opcodes_h_l3096_c41_a188_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3097_c7_6811
opc_result_MUX_uxn_opcodes_h_l3097_c7_6811 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond,
opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue,
opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse,
opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output);

-- stz2_uxn_opcodes_h_l3097_c41_2fb4
stz2_uxn_opcodes_h_l3097_c41_2fb4 : entity work.stz2_0CLK_f2c34df9 port map (
clk,
stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3097_c41_2fb4_phase,
stz2_uxn_opcodes_h_l3097_c41_2fb4_ins,
stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read,
stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3098_c7_b343
opc_result_MUX_uxn_opcodes_h_l3098_c7_b343 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond,
opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue,
opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse,
opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output);

-- ldr_uxn_opcodes_h_l3098_c41_71ef
ldr_uxn_opcodes_h_l3098_c41_71ef : entity work.ldr_0CLK_a6885b22 port map (
clk,
ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3098_c41_71ef_phase,
ldr_uxn_opcodes_h_l3098_c41_71ef_ins,
ldr_uxn_opcodes_h_l3098_c41_71ef_pc,
ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read,
ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read,
ldr_uxn_opcodes_h_l3098_c41_71ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc
opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond,
opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output);

-- ldr2_uxn_opcodes_h_l3099_c41_6c12
ldr2_uxn_opcodes_h_l3099_c41_6c12 : entity work.ldr2_0CLK_1417ec42 port map (
clk,
ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3099_c41_6c12_phase,
ldr2_uxn_opcodes_h_l3099_c41_6c12_ins,
ldr2_uxn_opcodes_h_l3099_c41_6c12_pc,
ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read,
ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read,
ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2
opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond,
opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output);

-- str1_uxn_opcodes_h_l3100_c41_60f0
str1_uxn_opcodes_h_l3100_c41_60f0 : entity work.str1_0CLK_90cbec6a port map (
clk,
str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3100_c41_60f0_phase,
str1_uxn_opcodes_h_l3100_c41_60f0_ins,
str1_uxn_opcodes_h_l3100_c41_60f0_pc,
str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read,
str1_uxn_opcodes_h_l3100_c41_60f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1
opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond,
opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output);

-- str2_uxn_opcodes_h_l3101_c41_5569
str2_uxn_opcodes_h_l3101_c41_5569 : entity work.str2_0CLK_f2c34df9 port map (
clk,
str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3101_c41_5569_phase,
str2_uxn_opcodes_h_l3101_c41_5569_ins,
str2_uxn_opcodes_h_l3101_c41_5569_pc,
str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read,
str2_uxn_opcodes_h_l3101_c41_5569_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3
opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond,
opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output);

-- lda_uxn_opcodes_h_l3102_c41_67b0
lda_uxn_opcodes_h_l3102_c41_67b0 : entity work.lda_0CLK_05e131b1 port map (
clk,
lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3102_c41_67b0_phase,
lda_uxn_opcodes_h_l3102_c41_67b0_ins,
lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read,
lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read,
lda_uxn_opcodes_h_l3102_c41_67b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b
opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond,
opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output);

-- lda2_uxn_opcodes_h_l3103_c41_eb50
lda2_uxn_opcodes_h_l3103_c41_eb50 : entity work.lda2_0CLK_c8be2b47 port map (
clk,
lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3103_c41_eb50_phase,
lda2_uxn_opcodes_h_l3103_c41_eb50_ins,
lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read,
lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read,
lda2_uxn_opcodes_h_l3103_c41_eb50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3104_c7_d033
opc_result_MUX_uxn_opcodes_h_l3104_c7_d033 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond,
opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue,
opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse,
opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output);

-- sta_uxn_opcodes_h_l3104_c41_6a02
sta_uxn_opcodes_h_l3104_c41_6a02 : entity work.sta_0CLK_89f6ba96 port map (
clk,
sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3104_c41_6a02_phase,
sta_uxn_opcodes_h_l3104_c41_6a02_ins,
sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read,
sta_uxn_opcodes_h_l3104_c41_6a02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3105_c7_9960
opc_result_MUX_uxn_opcodes_h_l3105_c7_9960 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond,
opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue,
opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse,
opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output);

-- sta2_uxn_opcodes_h_l3105_c41_b913
sta2_uxn_opcodes_h_l3105_c41_b913 : entity work.sta2_0CLK_44f2ccf6 port map (
clk,
sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3105_c41_b913_phase,
sta2_uxn_opcodes_h_l3105_c41_b913_ins,
sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read,
sta2_uxn_opcodes_h_l3105_c41_b913_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3106_c7_4215
opc_result_MUX_uxn_opcodes_h_l3106_c7_4215 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond,
opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue,
opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse,
opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output);

-- dei_uxn_opcodes_h_l3106_c41_dfcd
dei_uxn_opcodes_h_l3106_c41_dfcd : entity work.dei_0CLK_540d7a59 port map (
clk,
dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3106_c41_dfcd_phase,
dei_uxn_opcodes_h_l3106_c41_dfcd_ins,
dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read,
dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read,
dei_uxn_opcodes_h_l3106_c41_dfcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3107_c7_f015
opc_result_MUX_uxn_opcodes_h_l3107_c7_f015 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond,
opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue,
opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse,
opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output);

-- dei2_uxn_opcodes_h_l3107_c41_bcc0
dei2_uxn_opcodes_h_l3107_c41_bcc0 : entity work.dei2_0CLK_5ef9c585 port map (
clk,
dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3107_c41_bcc0_phase,
dei2_uxn_opcodes_h_l3107_c41_bcc0_ins,
dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read,
dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read,
dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3108_c7_c237
opc_result_MUX_uxn_opcodes_h_l3108_c7_c237 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond,
opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue,
opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse,
opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output);

-- deo_uxn_opcodes_h_l3108_c41_7822
deo_uxn_opcodes_h_l3108_c41_7822 : entity work.deo_0CLK_fbbdf924 port map (
clk,
deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3108_c41_7822_phase,
deo_uxn_opcodes_h_l3108_c41_7822_ins,
deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read,
deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read,
deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read,
deo_uxn_opcodes_h_l3108_c41_7822_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3109_c7_3368
opc_result_MUX_uxn_opcodes_h_l3109_c7_3368 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond,
opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue,
opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse,
opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output);

-- deo2_uxn_opcodes_h_l3109_c41_ebcb
deo2_uxn_opcodes_h_l3109_c41_ebcb : entity work.deo2_0CLK_f86d7e2d port map (
clk,
deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3109_c41_ebcb_phase,
deo2_uxn_opcodes_h_l3109_c41_ebcb_ins,
deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read,
deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read,
deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read,
deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17
opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond,
opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue,
opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse,
opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output);

-- add_uxn_opcodes_h_l3110_c41_a3f0
add_uxn_opcodes_h_l3110_c41_a3f0 : entity work.add_0CLK_f62d646e port map (
clk,
add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE,
add_uxn_opcodes_h_l3110_c41_a3f0_phase,
add_uxn_opcodes_h_l3110_c41_a3f0_ins,
add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read,
add_uxn_opcodes_h_l3110_c41_a3f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11
opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond,
opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue,
opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse,
opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output);

-- add2_uxn_opcodes_h_l3111_c41_1956
add2_uxn_opcodes_h_l3111_c41_1956 : entity work.add2_0CLK_a7b4806f port map (
clk,
add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3111_c41_1956_phase,
add2_uxn_opcodes_h_l3111_c41_1956_ins,
add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read,
add2_uxn_opcodes_h_l3111_c41_1956_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d
opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond,
opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output);

-- sub_uxn_opcodes_h_l3112_c41_a647
sub_uxn_opcodes_h_l3112_c41_a647 : entity work.sub_0CLK_f62d646e port map (
clk,
sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3112_c41_a647_phase,
sub_uxn_opcodes_h_l3112_c41_a647_ins,
sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read,
sub_uxn_opcodes_h_l3112_c41_a647_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a
opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond,
opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output);

-- sub2_uxn_opcodes_h_l3113_c41_2d51
sub2_uxn_opcodes_h_l3113_c41_2d51 : entity work.sub2_0CLK_a7b4806f port map (
clk,
sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3113_c41_2d51_phase,
sub2_uxn_opcodes_h_l3113_c41_2d51_ins,
sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read,
sub2_uxn_opcodes_h_l3113_c41_2d51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc
opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond,
opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output);

-- mul_uxn_opcodes_h_l3114_c41_9ac1
mul_uxn_opcodes_h_l3114_c41_9ac1 : entity work.mul_0CLK_f62d646e port map (
clk,
mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3114_c41_9ac1_phase,
mul_uxn_opcodes_h_l3114_c41_9ac1_ins,
mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read,
mul_uxn_opcodes_h_l3114_c41_9ac1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca
opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond,
opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output);

-- mul2_uxn_opcodes_h_l3115_c41_3557
mul2_uxn_opcodes_h_l3115_c41_3557 : entity work.mul2_0CLK_a7b4806f port map (
clk,
mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3115_c41_3557_phase,
mul2_uxn_opcodes_h_l3115_c41_3557_ins,
mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read,
mul2_uxn_opcodes_h_l3115_c41_3557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3
opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond,
opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output);

-- div_uxn_opcodes_h_l3116_c41_3039
div_uxn_opcodes_h_l3116_c41_3039 : entity work.div_0CLK_af9273cc port map (
clk,
div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE,
div_uxn_opcodes_h_l3116_c41_3039_phase,
div_uxn_opcodes_h_l3116_c41_3039_ins,
div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read,
div_uxn_opcodes_h_l3116_c41_3039_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48
opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond,
opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue,
opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse,
opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output);

-- div2_uxn_opcodes_h_l3117_c41_3810
div2_uxn_opcodes_h_l3117_c41_3810 : entity work.div2_0CLK_db5cbd9a port map (
clk,
div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3117_c41_3810_phase,
div2_uxn_opcodes_h_l3117_c41_3810_ins,
div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read,
div2_uxn_opcodes_h_l3117_c41_3810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22
opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond,
opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue,
opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse,
opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output);

-- and_uxn_opcodes_h_l3118_c41_2475
and_uxn_opcodes_h_l3118_c41_2475 : entity work.and_0CLK_f62d646e port map (
clk,
and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE,
and_uxn_opcodes_h_l3118_c41_2475_phase,
and_uxn_opcodes_h_l3118_c41_2475_ins,
and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read,
and_uxn_opcodes_h_l3118_c41_2475_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c
opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond,
opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output);

-- and2_uxn_opcodes_h_l3119_c41_14ba
and2_uxn_opcodes_h_l3119_c41_14ba : entity work.and2_0CLK_a7b4806f port map (
clk,
and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3119_c41_14ba_phase,
and2_uxn_opcodes_h_l3119_c41_14ba_ins,
and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read,
and2_uxn_opcodes_h_l3119_c41_14ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left,
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right,
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3120_c7_6684
opc_result_MUX_uxn_opcodes_h_l3120_c7_6684 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond,
opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue,
opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse,
opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output);

-- ora_uxn_opcodes_h_l3120_c41_3219
ora_uxn_opcodes_h_l3120_c41_3219 : entity work.ora_0CLK_f62d646e port map (
clk,
ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3120_c41_3219_phase,
ora_uxn_opcodes_h_l3120_c41_3219_ins,
ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read,
ora_uxn_opcodes_h_l3120_c41_3219_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3121_c7_2303
opc_result_MUX_uxn_opcodes_h_l3121_c7_2303 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond,
opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue,
opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse,
opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output);

-- ora2_uxn_opcodes_h_l3121_c41_7f66
ora2_uxn_opcodes_h_l3121_c41_7f66 : entity work.ora2_0CLK_a7b4806f port map (
clk,
ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3121_c41_7f66_phase,
ora2_uxn_opcodes_h_l3121_c41_7f66_ins,
ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read,
ora2_uxn_opcodes_h_l3121_c41_7f66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf
opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond,
opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output);

-- eor_uxn_opcodes_h_l3122_c41_1109
eor_uxn_opcodes_h_l3122_c41_1109 : entity work.eor_0CLK_f62d646e port map (
clk,
eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3122_c41_1109_phase,
eor_uxn_opcodes_h_l3122_c41_1109_ins,
eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read,
eor_uxn_opcodes_h_l3122_c41_1109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left,
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right,
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3123_c7_2401
opc_result_MUX_uxn_opcodes_h_l3123_c7_2401 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond,
opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue,
opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse,
opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output);

-- eor2_uxn_opcodes_h_l3123_c41_a2ea
eor2_uxn_opcodes_h_l3123_c41_a2ea : entity work.eor2_0CLK_a7b4806f port map (
clk,
eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3123_c41_a2ea_phase,
eor2_uxn_opcodes_h_l3123_c41_a2ea_ins,
eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read,
eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d
BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left,
BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right,
BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3124_c7_769e
opc_result_MUX_uxn_opcodes_h_l3124_c7_769e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond,
opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output);

-- sft_uxn_opcodes_h_l3124_c41_d2ee
sft_uxn_opcodes_h_l3124_c41_d2ee : entity work.sft_0CLK_7bf7ae34 port map (
clk,
sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3124_c41_d2ee_phase,
sft_uxn_opcodes_h_l3124_c41_d2ee_ins,
sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read,
sft_uxn_opcodes_h_l3124_c41_d2ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a
opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond,
opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output);

-- sft2_uxn_opcodes_h_l3125_c41_413b
sft2_uxn_opcodes_h_l3125_c41_413b : entity work.sft2_0CLK_4392568d port map (
clk,
sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3125_c41_413b_phase,
sft2_uxn_opcodes_h_l3125_c41_413b_ins,
sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read,
sft2_uxn_opcodes_h_l3125_c41_413b_return_output);

-- printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615
printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615 : entity work.printf_uxn_opcodes_h_l3126_c9_5615_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a
BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left,
BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right,
BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda
BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left,
BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right,
BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output);

-- MUX_uxn_opcodes_h_l3128_c18_4410
MUX_uxn_opcodes_h_l3128_c18_4410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3128_c18_4410_cond,
MUX_uxn_opcodes_h_l3128_c18_4410_iftrue,
MUX_uxn_opcodes_h_l3128_c18_4410_iffalse,
MUX_uxn_opcodes_h_l3128_c18_4410_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0
BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left,
BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right,
BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output);

-- sp0_MUX_uxn_opcodes_h_l3131_c2_139c
sp0_MUX_uxn_opcodes_h_l3131_c2_139c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond,
sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue,
sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse,
sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output);

-- sp1_MUX_uxn_opcodes_h_l3131_c2_139c
sp1_MUX_uxn_opcodes_h_l3131_c2_139c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond,
sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue,
sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse,
sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output);

-- sp0_MUX_uxn_opcodes_h_l3132_c3_a76f
sp0_MUX_uxn_opcodes_h_l3132_c3_a76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond,
sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue,
sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse,
sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output);

-- sp1_MUX_uxn_opcodes_h_l3132_c3_a76f
sp1_MUX_uxn_opcodes_h_l3132_c3_a76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond,
sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue,
sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse,
sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left,
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right,
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f
BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left,
BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right,
BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output);

-- MUX_uxn_opcodes_h_l3139_c30_925c
MUX_uxn_opcodes_h_l3139_c30_925c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3139_c30_925c_cond,
MUX_uxn_opcodes_h_l3139_c30_925c_iftrue,
MUX_uxn_opcodes_h_l3139_c30_925c_iffalse,
MUX_uxn_opcodes_h_l3139_c30_925c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f
BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left,
BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right,
BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output);

-- MUX_uxn_opcodes_h_l3140_c20_9ff9
MUX_uxn_opcodes_h_l3140_c20_9ff9 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3140_c20_9ff9_cond,
MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue,
MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse,
MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5
BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5 : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output);

-- stack_ram_update_uxn_opcodes_h_l3142_c21_f782
stack_ram_update_uxn_opcodes_h_l3142_c21_f782 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address,
stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value,
stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable,
stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output);



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
 stack_address,
 stack_read_value,
 device_ram_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output,
 CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output,
 MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output,
 jci_uxn_opcodes_h_l3057_c41_f650_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output,
 jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output,
 opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output,
 jsi_uxn_opcodes_h_l3059_c41_d200_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output,
 lit_uxn_opcodes_h_l3060_c41_2224_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output,
 lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output,
 opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output,
 lit_uxn_opcodes_h_l3062_c41_95fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output,
 lit2_uxn_opcodes_h_l3063_c41_cff0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output,
 inc_uxn_opcodes_h_l3064_c41_fd92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output,
 opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output,
 inc2_uxn_opcodes_h_l3065_c41_6b44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output,
 opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output,
 pop_uxn_opcodes_h_l3066_c41_020a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output,
 opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output,
 pop2_uxn_opcodes_h_l3067_c41_2229_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output,
 opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output,
 nip_uxn_opcodes_h_l3068_c41_a062_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output,
 opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output,
 nip2_uxn_opcodes_h_l3069_c41_7b43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output,
 swp_uxn_opcodes_h_l3070_c41_ddb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output,
 opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output,
 swp2_uxn_opcodes_h_l3071_c41_5e92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output,
 rot_uxn_opcodes_h_l3072_c41_1896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output,
 opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output,
 rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output,
 dup_uxn_opcodes_h_l3074_c41_ec57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output,
 opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output,
 dup2_uxn_opcodes_h_l3075_c41_6177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output,
 opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output,
 ovr_uxn_opcodes_h_l3076_c41_27c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output,
 opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output,
 ovr2_uxn_opcodes_h_l3077_c41_482d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output,
 opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output,
 equ_uxn_opcodes_h_l3078_c41_8bc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output,
 opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output,
 equ2_uxn_opcodes_h_l3079_c41_0d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output,
 opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output,
 neq_uxn_opcodes_h_l3080_c41_8565_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output,
 opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output,
 neq2_uxn_opcodes_h_l3081_c41_f588_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output,
 gth_uxn_opcodes_h_l3082_c41_7017_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output,
 gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output,
 opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output,
 lth_uxn_opcodes_h_l3084_c41_cda6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output,
 lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output,
 jmp_uxn_opcodes_h_l3086_c41_04a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output,
 jmp2_uxn_opcodes_h_l3087_c41_c220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output,
 jcn_uxn_opcodes_h_l3088_c41_b70b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output,
 opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output,
 jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output,
 jsr_uxn_opcodes_h_l3090_c41_dc61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output,
 jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output,
 opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output,
 sth_uxn_opcodes_h_l3092_c41_8703_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output,
 opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output,
 sth2_uxn_opcodes_h_l3093_c41_46ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output,
 opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output,
 ldz_uxn_opcodes_h_l3094_c41_4421_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output,
 ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output,
 opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output,
 stz_uxn_opcodes_h_l3096_c41_a188_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output,
 opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output,
 stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output,
 ldr_uxn_opcodes_h_l3098_c41_71ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output,
 ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output,
 str1_uxn_opcodes_h_l3100_c41_60f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output,
 str2_uxn_opcodes_h_l3101_c41_5569_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output,
 lda_uxn_opcodes_h_l3102_c41_67b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output,
 opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output,
 lda2_uxn_opcodes_h_l3103_c41_eb50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output,
 opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output,
 sta_uxn_opcodes_h_l3104_c41_6a02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output,
 opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output,
 sta2_uxn_opcodes_h_l3105_c41_b913_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output,
 opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output,
 dei_uxn_opcodes_h_l3106_c41_dfcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output,
 opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output,
 dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output,
 opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output,
 deo_uxn_opcodes_h_l3108_c41_7822_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output,
 opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output,
 deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output,
 opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output,
 add_uxn_opcodes_h_l3110_c41_a3f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output,
 add2_uxn_opcodes_h_l3111_c41_1956_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output,
 sub_uxn_opcodes_h_l3112_c41_a647_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output,
 sub2_uxn_opcodes_h_l3113_c41_2d51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output,
 mul_uxn_opcodes_h_l3114_c41_9ac1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output,
 mul2_uxn_opcodes_h_l3115_c41_3557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output,
 opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output,
 div_uxn_opcodes_h_l3116_c41_3039_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output,
 opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output,
 div2_uxn_opcodes_h_l3117_c41_3810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output,
 and_uxn_opcodes_h_l3118_c41_2475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output,
 opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output,
 and2_uxn_opcodes_h_l3119_c41_14ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output,
 opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output,
 ora_uxn_opcodes_h_l3120_c41_3219_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output,
 ora2_uxn_opcodes_h_l3121_c41_7f66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output,
 opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output,
 eor_uxn_opcodes_h_l3122_c41_1109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output,
 eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output,
 sft_uxn_opcodes_h_l3124_c41_d2ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output,
 opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output,
 sft2_uxn_opcodes_h_l3125_c41_413b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output,
 MUX_uxn_opcodes_h_l3128_c18_4410_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output,
 sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output,
 sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output,
 sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output,
 sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output,
 MUX_uxn_opcodes_h_l3139_c30_925c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output,
 MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output,
 stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3051_c2_f230 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c30_62ae_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c57_618d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3056_c2_7da6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3057_c41_f650_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3059_c41_d200_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3059_c41_d200_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3059_c41_d200_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_2224_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_2224_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_2224_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3062_c41_95fb_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3062_c41_95fb_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3062_c41_95fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3064_c41_fd92_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3064_c41_fd92_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3064_c41_fd92_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3066_c41_020a_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3066_c41_020a_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3066_c41_020a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3067_c41_2229_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3067_c41_2229_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3067_c41_2229_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3068_c41_a062_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3068_c41_a062_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3068_c41_a062_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3072_c41_1896_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3072_c41_1896_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3072_c41_1896_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3074_c41_ec57_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3074_c41_ec57_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3074_c41_ec57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3075_c41_6177_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3075_c41_6177_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3075_c41_6177_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3080_c41_8565_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3080_c41_8565_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3080_c41_8565_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3081_c41_f588_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3081_c41_f588_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3081_c41_f588_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3082_c41_7017_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3082_c41_7017_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3082_c41_7017_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3084_c41_cda6_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3084_c41_cda6_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3084_c41_cda6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3092_c41_8703_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3092_c41_8703_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3092_c41_8703_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3094_c41_4421_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3096_c41_a188_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3096_c41_a188_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3096_c41_a188_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3100_c41_60f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3101_c41_5569_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3102_c41_67b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3104_c41_6a02_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3104_c41_6a02_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3104_c41_6a02_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3105_c41_b913_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3105_c41_b913_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3105_c41_b913_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3108_c41_7822_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3110_c41_a3f0_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3110_c41_a3f0_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3110_c41_a3f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3111_c41_1956_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3111_c41_1956_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3111_c41_1956_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3112_c41_a647_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3112_c41_a647_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3112_c41_a647_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3115_c41_3557_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3115_c41_3557_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3115_c41_3557_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3116_c41_3039_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3116_c41_3039_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3116_c41_3039_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3117_c41_3810_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3117_c41_3810_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3117_c41_3810_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3118_c41_2475_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3118_c41_2475_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3118_c41_2475_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3119_c41_14ba_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3119_c41_14ba_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3119_c41_14ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3120_c41_3219_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3120_c41_3219_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3120_c41_3219_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3122_c41_1109_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3122_c41_1109_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3122_c41_1109_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3125_c41_413b_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3125_c41_413b_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3125_c41_413b_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_4410_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3128_c18_4410_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3129_c17_d51c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3131_c6_8dff_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3135_c4_f4be : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3133_c4_34cd : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3139_c30_925c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3139_c30_925c_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c19_4382_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3139_c70_6206_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c59_72ea_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3140_c2_a0b0 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3145_c3_d4d8_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3148_c39_bd63_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3149_c40_5564_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3150_c34_9a3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3151_c30_8f85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3152_c33_d2cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3153_c34_d1ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3154_c37_f895_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3155_c33_eedf_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3157_c32_132d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3133_l3135_DUPLICATE_988d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3135_DUPLICATE_35ef_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3156_l3144_DUPLICATE_c31e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3159_l3036_DUPLICATE_6d58_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right := to_unsigned(512, 10);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right := to_unsigned(41, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right := to_unsigned(27, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right := to_unsigned(18, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right := to_unsigned(15, 4);
     VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right := to_unsigned(22, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right := to_unsigned(33, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right := to_unsigned(1024, 11);
     VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right := to_unsigned(13, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_device_ram_read_value := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3111_c41_1956_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3110_c41_a3f0_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3119_c41_14ba_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3118_c41_2475_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3117_c41_3810_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3116_c41_3039_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3075_c41_6177_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3074_c41_ec57_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3122_c41_1109_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3082_c41_7017_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3064_c41_fd92_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3084_c41_cda6_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3115_c41_3557_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3081_c41_f588_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3080_c41_8565_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3068_c41_a062_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3120_c41_3219_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3067_c41_2229_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3066_c41_020a_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3072_c41_1896_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3125_c41_413b_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3105_c41_b913_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3104_c41_6a02_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3092_c41_8703_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3096_c41_a188_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3112_c41_a647_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3059_c41_d200_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3060_c41_2224_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3062_c41_95fb_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3111_c41_1956_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3110_c41_a3f0_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3119_c41_14ba_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3118_c41_2475_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3117_c41_3810_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3116_c41_3039_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3075_c41_6177_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3074_c41_ec57_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3122_c41_1109_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3082_c41_7017_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3064_c41_fd92_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3059_c41_d200_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3060_c41_2224_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3062_c41_95fb_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3084_c41_cda6_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3115_c41_3557_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3081_c41_f588_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3080_c41_8565_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3068_c41_a062_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3120_c41_3219_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3067_c41_2229_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3066_c41_020a_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3072_c41_1896_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3125_c41_413b_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3105_c41_b913_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3104_c41_6a02_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3092_c41_8703_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3096_c41_a188_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3112_c41_a647_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3051_c57_618d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c57_618d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3056_c2_7da6] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3056_c2_7da6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l3051_c10_00cc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_left;
     BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output := BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3051_c41_8117] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_left;
     BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output := BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3128_c18_765a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_left;
     BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output := BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c10_00cc_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3128_c18_765a_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c57_618d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3056_c2_7da6_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3051_c30_62ae] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c30_62ae_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3051_c41_8117_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3051_c10_1002] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_left;
     BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output := BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3128_c18_ccda] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_left;
     BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output := BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3051_c57_75e9] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output := CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3051_c10_1002_return_output;
     VAR_MUX_uxn_opcodes_h_l3128_c18_4410_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3128_c18_ccda_return_output;
     VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3051_c30_62ae_return_output;
     VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3051_c57_75e9_return_output;
     -- MUX[uxn_opcodes_h_l3128_c18_4410] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3128_c18_4410_cond <= VAR_MUX_uxn_opcodes_h_l3128_c18_4410_cond;
     MUX_uxn_opcodes_h_l3128_c18_4410_iftrue <= VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iftrue;
     MUX_uxn_opcodes_h_l3128_c18_4410_iffalse <= VAR_MUX_uxn_opcodes_h_l3128_c18_4410_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3128_c18_4410_return_output := MUX_uxn_opcodes_h_l3128_c18_4410_return_output;

     -- MUX[uxn_opcodes_h_l3051_c10_dfb1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3051_c10_dfb1_cond <= VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_cond;
     MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue <= VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iftrue;
     MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse <= VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output := MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3051_c2_f230 := VAR_MUX_uxn_opcodes_h_l3051_c10_dfb1_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left := VAR_MUX_uxn_opcodes_h_l3128_c18_4410_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3051_c2_f230;
     VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1 := resize(VAR_opc_uxn_opcodes_h_l3051_c2_f230, 32);
     VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0 := resize(VAR_opc_uxn_opcodes_h_l3051_c2_f230, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_70e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_283e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_9733] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_519f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_4d2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_74ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_84fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_5980] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_left;
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output := BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_98cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_1689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_f85a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ac91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_fb43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_c999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_left;
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output := BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_a71f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_47c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_b112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_left;
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output := BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_2750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_left;
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output := BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_79c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3eb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_6ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_5c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_54e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3123_c11_c6f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_774a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_0565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3124_c11_bb1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3056_c6_1d7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_54a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_53fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_8499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_73e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_263e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_a332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_left;
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output := BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_4080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_left;
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output := BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_36b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_c26a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_9ff5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_d9ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_a63c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_0d6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_9fb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_62dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output;

     -- printf_uxn_opcodes_h_l3054_c2_0d05[uxn_opcodes_h_l3054_c2_0d05] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0 <= VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg0;
     printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1 <= VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg1;
     printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2 <= VAR_printf_uxn_opcodes_h_l3054_c2_0d05_uxn_opcodes_h_l3054_c2_0d05_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_ecf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_8a84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_left;
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output := BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_60b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_02c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_c96d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_80ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_6a1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_4c23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_942b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_02cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_805f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_b7aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_ea4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_a7e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_ae54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_left;
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output := BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_0be6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3120_c11_9a60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_left;
     BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output := BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_565d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_38f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_7ec0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_cbca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_left;
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output := BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_4ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_d5eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_a7c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_b7f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_81cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_1937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_left;
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output := BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c6_1d7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_c999_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_283e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_1937_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_54a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_263e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_b7f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_38f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_a63c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_47c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3eb1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_f85a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_53fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_b7aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_62dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_cbca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_79c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_8499_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_54e3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_774a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_0565_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_98cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_c96d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_9733_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_6ffe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4ded_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_ea4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ecf7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_805f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_70e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_fb43_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_9ff5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_73e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_a7e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_ae54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_1689_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_7ec0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_a7c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_8a84_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_02cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_36b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_0be6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_84fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_942b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_60b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_0d6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4080_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ac91_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4d2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_5980_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_74ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_81cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_b112_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_565d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_a71f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_02c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_2750_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_519f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9fb8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_4c23_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_80ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_d9ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_d5eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_6a1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_9a60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_5c57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_c26a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_c6f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3124_c11_bb1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_a332_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_ace2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_85ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_db6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output;
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_85ae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_be8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_e6b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output;

     -- jci[uxn_opcodes_h_l3057_c41_f650] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3057_c41_f650_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3057_c41_f650_phase <= VAR_jci_uxn_opcodes_h_l3057_c41_f650_phase;
     jci_uxn_opcodes_h_l3057_c41_f650_pc <= VAR_jci_uxn_opcodes_h_l3057_c41_f650_pc;
     jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_stack_read;
     jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3057_c41_f650_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3057_c41_f650_return_output := jci_uxn_opcodes_h_l3057_c41_f650_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output;
     VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_be8f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue := VAR_jci_uxn_opcodes_h_l3057_c41_f650_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_6b12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_cc15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output;

     -- jmi[uxn_opcodes_h_l3058_c41_e8e2] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3058_c41_e8e2_phase <= VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_phase;
     jmi_uxn_opcodes_h_l3058_c41_e8e2_pc <= VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_pc;
     jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output := jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output;
     VAR_jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_6b12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue := VAR_jmi_uxn_opcodes_h_l3058_c41_e8e2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_ce2e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_4b0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output;

     -- jsi[uxn_opcodes_h_l3059_c41_d200] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3059_c41_d200_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3059_c41_d200_phase <= VAR_jsi_uxn_opcodes_h_l3059_c41_d200_phase;
     jsi_uxn_opcodes_h_l3059_c41_d200_pc <= VAR_jsi_uxn_opcodes_h_l3059_c41_d200_pc;
     jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3059_c41_d200_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3059_c41_d200_return_output := jsi_uxn_opcodes_h_l3059_c41_d200_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output;
     VAR_lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_ce2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue := VAR_jsi_uxn_opcodes_h_l3059_c41_d200_return_output;
     -- lit[uxn_opcodes_h_l3060_c41_2224] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3060_c41_2224_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3060_c41_2224_phase <= VAR_lit_uxn_opcodes_h_l3060_c41_2224_phase;
     lit_uxn_opcodes_h_l3060_c41_2224_pc <= VAR_lit_uxn_opcodes_h_l3060_c41_2224_pc;
     lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3060_c41_2224_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3060_c41_2224_return_output := lit_uxn_opcodes_h_l3060_c41_2224_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_5bd5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_e56e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output;
     VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_5bd5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue := VAR_lit_uxn_opcodes_h_l3060_c41_2224_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_4c8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output;

     -- lit2[uxn_opcodes_h_l3061_c41_7cfc] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3061_c41_7cfc_phase <= VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_phase;
     lit2_uxn_opcodes_h_l3061_c41_7cfc_pc <= VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_pc;
     lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output := lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_9129] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_9129_return_output;
     VAR_lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_4c8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue := VAR_lit2_uxn_opcodes_h_l3061_c41_7cfc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_05b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output;

     -- lit[uxn_opcodes_h_l3062_c41_95fb] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3062_c41_95fb_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3062_c41_95fb_phase <= VAR_lit_uxn_opcodes_h_l3062_c41_95fb_phase;
     lit_uxn_opcodes_h_l3062_c41_95fb_pc <= VAR_lit_uxn_opcodes_h_l3062_c41_95fb_pc;
     lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3062_c41_95fb_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3062_c41_95fb_return_output := lit_uxn_opcodes_h_l3062_c41_95fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_0b95] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output;
     VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_0b95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue := VAR_lit_uxn_opcodes_h_l3062_c41_95fb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_2b57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_eab3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output;

     -- lit2[uxn_opcodes_h_l3063_c41_cff0] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3063_c41_cff0_phase <= VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_phase;
     lit2_uxn_opcodes_h_l3063_c41_cff0_pc <= VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_pc;
     lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_return_output := lit2_uxn_opcodes_h_l3063_c41_cff0_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output;
     VAR_inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_2b57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue := VAR_lit2_uxn_opcodes_h_l3063_c41_cff0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_2b75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output;

     -- inc[uxn_opcodes_h_l3064_c41_fd92] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3064_c41_fd92_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3064_c41_fd92_phase <= VAR_inc_uxn_opcodes_h_l3064_c41_fd92_phase;
     inc_uxn_opcodes_h_l3064_c41_fd92_ins <= VAR_inc_uxn_opcodes_h_l3064_c41_fd92_ins;
     inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3064_c41_fd92_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3064_c41_fd92_return_output := inc_uxn_opcodes_h_l3064_c41_fd92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_0897] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0897_return_output;
     VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_2b75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue := VAR_inc_uxn_opcodes_h_l3064_c41_fd92_return_output;
     -- inc2[uxn_opcodes_h_l3065_c41_6b44] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3065_c41_6b44_phase <= VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_phase;
     inc2_uxn_opcodes_h_l3065_c41_6b44_ins <= VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_ins;
     inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_return_output := inc2_uxn_opcodes_h_l3065_c41_6b44_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_9b85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_d339] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_d339_return_output;
     VAR_pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9b85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue := VAR_inc2_uxn_opcodes_h_l3065_c41_6b44_return_output;
     -- pop[uxn_opcodes_h_l3066_c41_020a] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3066_c41_020a_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3066_c41_020a_phase <= VAR_pop_uxn_opcodes_h_l3066_c41_020a_phase;
     pop_uxn_opcodes_h_l3066_c41_020a_ins <= VAR_pop_uxn_opcodes_h_l3066_c41_020a_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3066_c41_020a_return_output := pop_uxn_opcodes_h_l3066_c41_020a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_0d96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_1385] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_1385_return_output;
     VAR_pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_0d96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue := VAR_pop_uxn_opcodes_h_l3066_c41_020a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_b36c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output;

     -- pop2[uxn_opcodes_h_l3067_c41_2229] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3067_c41_2229_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3067_c41_2229_phase <= VAR_pop2_uxn_opcodes_h_l3067_c41_2229_phase;
     pop2_uxn_opcodes_h_l3067_c41_2229_ins <= VAR_pop2_uxn_opcodes_h_l3067_c41_2229_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3067_c41_2229_return_output := pop2_uxn_opcodes_h_l3067_c41_2229_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_8420] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_8420_return_output;
     VAR_nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_b36c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue := VAR_pop2_uxn_opcodes_h_l3067_c41_2229_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_5373] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output;

     -- nip[uxn_opcodes_h_l3068_c41_a062] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3068_c41_a062_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3068_c41_a062_phase <= VAR_nip_uxn_opcodes_h_l3068_c41_a062_phase;
     nip_uxn_opcodes_h_l3068_c41_a062_ins <= VAR_nip_uxn_opcodes_h_l3068_c41_a062_ins;
     nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3068_c41_a062_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3068_c41_a062_return_output := nip_uxn_opcodes_h_l3068_c41_a062_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_647a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_5373_return_output;
     VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_647a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue := VAR_nip_uxn_opcodes_h_l3068_c41_a062_return_output;
     -- nip2[uxn_opcodes_h_l3069_c41_7b43] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3069_c41_7b43_phase <= VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_phase;
     nip2_uxn_opcodes_h_l3069_c41_7b43_ins <= VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_ins;
     nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_return_output := nip2_uxn_opcodes_h_l3069_c41_7b43_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_46df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_b11f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output;
     VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_46df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue := VAR_nip2_uxn_opcodes_h_l3069_c41_7b43_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_2d48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output;

     -- swp[uxn_opcodes_h_l3070_c41_ddb9] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3070_c41_ddb9_phase <= VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_phase;
     swp_uxn_opcodes_h_l3070_c41_ddb9_ins <= VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_ins;
     swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_return_output := swp_uxn_opcodes_h_l3070_c41_ddb9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_2029] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_2029_return_output;
     VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_2d48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue := VAR_swp_uxn_opcodes_h_l3070_c41_ddb9_return_output;
     -- swp2[uxn_opcodes_h_l3071_c41_5e92] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3071_c41_5e92_phase <= VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_phase;
     swp2_uxn_opcodes_h_l3071_c41_5e92_ins <= VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_ins;
     swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_return_output := swp2_uxn_opcodes_h_l3071_c41_5e92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_179e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_374b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_179e_return_output;
     VAR_rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_374b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue := VAR_swp2_uxn_opcodes_h_l3071_c41_5e92_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_9e0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_6242] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output;

     -- rot[uxn_opcodes_h_l3072_c41_1896] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3072_c41_1896_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3072_c41_1896_phase <= VAR_rot_uxn_opcodes_h_l3072_c41_1896_phase;
     rot_uxn_opcodes_h_l3072_c41_1896_ins <= VAR_rot_uxn_opcodes_h_l3072_c41_1896_ins;
     rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3072_c41_1896_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3072_c41_1896_return_output := rot_uxn_opcodes_h_l3072_c41_1896_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_6242_return_output;
     VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_9e0b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue := VAR_rot_uxn_opcodes_h_l3072_c41_1896_return_output;
     -- rot2[uxn_opcodes_h_l3073_c41_fbe0] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3073_c41_fbe0_phase <= VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_phase;
     rot2_uxn_opcodes_h_l3073_c41_fbe0_ins <= VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_ins;
     rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output := rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_adf3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_7a62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output;
     VAR_dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_7a62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue := VAR_rot2_uxn_opcodes_h_l3073_c41_fbe0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_8bbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output;

     -- dup[uxn_opcodes_h_l3074_c41_ec57] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3074_c41_ec57_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3074_c41_ec57_phase <= VAR_dup_uxn_opcodes_h_l3074_c41_ec57_phase;
     dup_uxn_opcodes_h_l3074_c41_ec57_ins <= VAR_dup_uxn_opcodes_h_l3074_c41_ec57_ins;
     dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3074_c41_ec57_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3074_c41_ec57_return_output := dup_uxn_opcodes_h_l3074_c41_ec57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_9885] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_9885_return_output;
     VAR_dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_8bbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue := VAR_dup_uxn_opcodes_h_l3074_c41_ec57_return_output;
     -- dup2[uxn_opcodes_h_l3075_c41_6177] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3075_c41_6177_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3075_c41_6177_phase <= VAR_dup2_uxn_opcodes_h_l3075_c41_6177_phase;
     dup2_uxn_opcodes_h_l3075_c41_6177_ins <= VAR_dup2_uxn_opcodes_h_l3075_c41_6177_ins;
     dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3075_c41_6177_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3075_c41_6177_return_output := dup2_uxn_opcodes_h_l3075_c41_6177_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_7092] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_c450] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_c450_return_output;
     VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7092_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue := VAR_dup2_uxn_opcodes_h_l3075_c41_6177_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_d885] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output;

     -- ovr[uxn_opcodes_h_l3076_c41_27c1] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3076_c41_27c1_phase <= VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_phase;
     ovr_uxn_opcodes_h_l3076_c41_27c1_ins <= VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_ins;
     ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_return_output := ovr_uxn_opcodes_h_l3076_c41_27c1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_4c72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output;
     VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_d885_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue := VAR_ovr_uxn_opcodes_h_l3076_c41_27c1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_3738] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output;

     -- ovr2[uxn_opcodes_h_l3077_c41_482d] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3077_c41_482d_phase <= VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_phase;
     ovr2_uxn_opcodes_h_l3077_c41_482d_ins <= VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_ins;
     ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_return_output := ovr2_uxn_opcodes_h_l3077_c41_482d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_f2b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3738_return_output;
     VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_f2b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue := VAR_ovr2_uxn_opcodes_h_l3077_c41_482d_return_output;
     -- equ[uxn_opcodes_h_l3078_c41_8bc1] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3078_c41_8bc1_phase <= VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_phase;
     equ_uxn_opcodes_h_l3078_c41_8bc1_ins <= VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_ins;
     equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_return_output := equ_uxn_opcodes_h_l3078_c41_8bc1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_0d11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_1598] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output;
     VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_1598_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue := VAR_equ_uxn_opcodes_h_l3078_c41_8bc1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_b417] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_0f25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output;

     -- equ2[uxn_opcodes_h_l3079_c41_0d85] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3079_c41_0d85_phase <= VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_phase;
     equ2_uxn_opcodes_h_l3079_c41_0d85_ins <= VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_ins;
     equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_return_output := equ2_uxn_opcodes_h_l3079_c41_0d85_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_b417_return_output;
     VAR_neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_0f25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue := VAR_equ2_uxn_opcodes_h_l3079_c41_0d85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_9c5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output;

     -- neq[uxn_opcodes_h_l3080_c41_8565] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3080_c41_8565_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3080_c41_8565_phase <= VAR_neq_uxn_opcodes_h_l3080_c41_8565_phase;
     neq_uxn_opcodes_h_l3080_c41_8565_ins <= VAR_neq_uxn_opcodes_h_l3080_c41_8565_ins;
     neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3080_c41_8565_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3080_c41_8565_return_output := neq_uxn_opcodes_h_l3080_c41_8565_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_f416] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_f416_return_output;
     VAR_neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_9c5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue := VAR_neq_uxn_opcodes_h_l3080_c41_8565_return_output;
     -- neq2[uxn_opcodes_h_l3081_c41_f588] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3081_c41_f588_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3081_c41_f588_phase <= VAR_neq2_uxn_opcodes_h_l3081_c41_f588_phase;
     neq2_uxn_opcodes_h_l3081_c41_f588_ins <= VAR_neq2_uxn_opcodes_h_l3081_c41_f588_ins;
     neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3081_c41_f588_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3081_c41_f588_return_output := neq2_uxn_opcodes_h_l3081_c41_f588_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_c66e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_527a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_527a_return_output;
     VAR_gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_c66e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue := VAR_neq2_uxn_opcodes_h_l3081_c41_f588_return_output;
     -- gth[uxn_opcodes_h_l3082_c41_7017] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3082_c41_7017_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3082_c41_7017_phase <= VAR_gth_uxn_opcodes_h_l3082_c41_7017_phase;
     gth_uxn_opcodes_h_l3082_c41_7017_ins <= VAR_gth_uxn_opcodes_h_l3082_c41_7017_ins;
     gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3082_c41_7017_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3082_c41_7017_return_output := gth_uxn_opcodes_h_l3082_c41_7017_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_f893] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_f8f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output;
     VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_f893_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue := VAR_gth_uxn_opcodes_h_l3082_c41_7017_return_output;
     -- gth2[uxn_opcodes_h_l3083_c41_8ac2] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3083_c41_8ac2_phase <= VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_phase;
     gth2_uxn_opcodes_h_l3083_c41_8ac2_ins <= VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_ins;
     gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output := gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_4021] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_f580] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_f580_return_output;
     VAR_lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_4021_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue := VAR_gth2_uxn_opcodes_h_l3083_c41_8ac2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_d60b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_6bda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output;

     -- lth[uxn_opcodes_h_l3084_c41_cda6] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3084_c41_cda6_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3084_c41_cda6_phase <= VAR_lth_uxn_opcodes_h_l3084_c41_cda6_phase;
     lth_uxn_opcodes_h_l3084_c41_cda6_ins <= VAR_lth_uxn_opcodes_h_l3084_c41_cda6_ins;
     lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3084_c41_cda6_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3084_c41_cda6_return_output := lth_uxn_opcodes_h_l3084_c41_cda6_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output;
     VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_6bda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue := VAR_lth_uxn_opcodes_h_l3084_c41_cda6_return_output;
     -- lth2[uxn_opcodes_h_l3085_c41_0ac5] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3085_c41_0ac5_phase <= VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_phase;
     lth2_uxn_opcodes_h_l3085_c41_0ac5_ins <= VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_ins;
     lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output := lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_f01e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_5fdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output;
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_f01e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue := VAR_lth2_uxn_opcodes_h_l3085_c41_0ac5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_1e2f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output;

     -- jmp[uxn_opcodes_h_l3086_c41_04a8] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3086_c41_04a8_phase <= VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_phase;
     jmp_uxn_opcodes_h_l3086_c41_04a8_ins <= VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_ins;
     jmp_uxn_opcodes_h_l3086_c41_04a8_pc <= VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_pc;
     jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_return_output := jmp_uxn_opcodes_h_l3086_c41_04a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_695b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output;
     VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_695b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue := VAR_jmp_uxn_opcodes_h_l3086_c41_04a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_eed2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_dd03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output;

     -- jmp2[uxn_opcodes_h_l3087_c41_c220] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3087_c41_c220_phase <= VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_phase;
     jmp2_uxn_opcodes_h_l3087_c41_c220_ins <= VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_ins;
     jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_return_output := jmp2_uxn_opcodes_h_l3087_c41_c220_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output;
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_dd03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue := VAR_jmp2_uxn_opcodes_h_l3087_c41_c220_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_d97e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_8a90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output;

     -- jcn[uxn_opcodes_h_l3088_c41_b70b] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3088_c41_b70b_phase <= VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_phase;
     jcn_uxn_opcodes_h_l3088_c41_b70b_ins <= VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_ins;
     jcn_uxn_opcodes_h_l3088_c41_b70b_pc <= VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_pc;
     jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_return_output := jcn_uxn_opcodes_h_l3088_c41_b70b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output;
     VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_d97e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue := VAR_jcn_uxn_opcodes_h_l3088_c41_b70b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_99e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output;

     -- jcn2[uxn_opcodes_h_l3089_c41_59dd] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3089_c41_59dd_phase <= VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_phase;
     jcn2_uxn_opcodes_h_l3089_c41_59dd_ins <= VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_ins;
     jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output := jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_4521] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output;
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4521_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue := VAR_jcn2_uxn_opcodes_h_l3089_c41_59dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_f1fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output;

     -- jsr[uxn_opcodes_h_l3090_c41_dc61] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3090_c41_dc61_phase <= VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_phase;
     jsr_uxn_opcodes_h_l3090_c41_dc61_ins <= VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_ins;
     jsr_uxn_opcodes_h_l3090_c41_dc61_pc <= VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_pc;
     jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_return_output := jsr_uxn_opcodes_h_l3090_c41_dc61_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_1ad0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output;
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_f1fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue := VAR_jsr_uxn_opcodes_h_l3090_c41_dc61_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_d066] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_109e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output;

     -- jsr2[uxn_opcodes_h_l3091_c41_9fed] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3091_c41_9fed_phase <= VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_phase;
     jsr2_uxn_opcodes_h_l3091_c41_9fed_ins <= VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_ins;
     jsr2_uxn_opcodes_h_l3091_c41_9fed_pc <= VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_pc;
     jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output := jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d066_return_output;
     VAR_sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_109e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue := VAR_jsr2_uxn_opcodes_h_l3091_c41_9fed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_8950] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_942d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output;

     -- sth[uxn_opcodes_h_l3092_c41_8703] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3092_c41_8703_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3092_c41_8703_phase <= VAR_sth_uxn_opcodes_h_l3092_c41_8703_phase;
     sth_uxn_opcodes_h_l3092_c41_8703_ins <= VAR_sth_uxn_opcodes_h_l3092_c41_8703_ins;
     sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3092_c41_8703_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3092_c41_8703_return_output := sth_uxn_opcodes_h_l3092_c41_8703_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8950_return_output;
     VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_942d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue := VAR_sth_uxn_opcodes_h_l3092_c41_8703_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_4138] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_3060] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output;

     -- sth2[uxn_opcodes_h_l3093_c41_46ca] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3093_c41_46ca_phase <= VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_phase;
     sth2_uxn_opcodes_h_l3093_c41_46ca_ins <= VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_ins;
     sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_return_output := sth2_uxn_opcodes_h_l3093_c41_46ca_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_4138_return_output;
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_3060_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue := VAR_sth2_uxn_opcodes_h_l3093_c41_46ca_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_4378] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output;

     -- ldz[uxn_opcodes_h_l3094_c41_4421] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3094_c41_4421_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3094_c41_4421_phase <= VAR_ldz_uxn_opcodes_h_l3094_c41_4421_phase;
     ldz_uxn_opcodes_h_l3094_c41_4421_ins <= VAR_ldz_uxn_opcodes_h_l3094_c41_4421_ins;
     ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_stack_read;
     ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3094_c41_4421_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3094_c41_4421_return_output := ldz_uxn_opcodes_h_l3094_c41_4421_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_3acd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output;
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4378_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue := VAR_ldz_uxn_opcodes_h_l3094_c41_4421_return_output;
     -- ldz2[uxn_opcodes_h_l3095_c41_7dcc] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase <= VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_phase;
     ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins <= VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_ins;
     ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_stack_read;
     ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output := ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_6811] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_fe8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_6811_return_output;
     VAR_stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_fe8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue := VAR_ldz2_uxn_opcodes_h_l3095_c41_7dcc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_b343] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output;

     -- stz[uxn_opcodes_h_l3096_c41_a188] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3096_c41_a188_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3096_c41_a188_phase <= VAR_stz_uxn_opcodes_h_l3096_c41_a188_phase;
     stz_uxn_opcodes_h_l3096_c41_a188_ins <= VAR_stz_uxn_opcodes_h_l3096_c41_a188_ins;
     stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3096_c41_a188_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3096_c41_a188_return_output := stz_uxn_opcodes_h_l3096_c41_a188_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_e207] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_b343_return_output;
     VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_e207_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue := VAR_stz_uxn_opcodes_h_l3096_c41_a188_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_daac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output;

     -- stz2[uxn_opcodes_h_l3097_c41_2fb4] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3097_c41_2fb4_phase <= VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_phase;
     stz2_uxn_opcodes_h_l3097_c41_2fb4_ins <= VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_ins;
     stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output := stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_36dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output;
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_daac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue := VAR_stz2_uxn_opcodes_h_l3097_c41_2fb4_return_output;
     -- ldr[uxn_opcodes_h_l3098_c41_71ef] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3098_c41_71ef_phase <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_phase;
     ldr_uxn_opcodes_h_l3098_c41_71ef_ins <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_ins;
     ldr_uxn_opcodes_h_l3098_c41_71ef_pc <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_pc;
     ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_stack_read;
     ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_return_output := ldr_uxn_opcodes_h_l3098_c41_71ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_f2b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_1f08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output;
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_1f08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue := VAR_ldr_uxn_opcodes_h_l3098_c41_71ef_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_2be1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output;

     -- ldr2[uxn_opcodes_h_l3099_c41_6c12] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3099_c41_6c12_phase <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_phase;
     ldr2_uxn_opcodes_h_l3099_c41_6c12_ins <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_ins;
     ldr2_uxn_opcodes_h_l3099_c41_6c12_pc <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_pc;
     ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_stack_read;
     ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output := ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_bd17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output;
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_bd17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue := VAR_ldr2_uxn_opcodes_h_l3099_c41_6c12_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_2cc3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_6ef6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output;

     -- str1[uxn_opcodes_h_l3100_c41_60f0] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3100_c41_60f0_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3100_c41_60f0_phase <= VAR_str1_uxn_opcodes_h_l3100_c41_60f0_phase;
     str1_uxn_opcodes_h_l3100_c41_60f0_ins <= VAR_str1_uxn_opcodes_h_l3100_c41_60f0_ins;
     str1_uxn_opcodes_h_l3100_c41_60f0_pc <= VAR_str1_uxn_opcodes_h_l3100_c41_60f0_pc;
     str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3100_c41_60f0_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3100_c41_60f0_return_output := str1_uxn_opcodes_h_l3100_c41_60f0_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output;
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_6ef6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue := VAR_str1_uxn_opcodes_h_l3100_c41_60f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_71a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output;

     -- str2[uxn_opcodes_h_l3101_c41_5569] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3101_c41_5569_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3101_c41_5569_phase <= VAR_str2_uxn_opcodes_h_l3101_c41_5569_phase;
     str2_uxn_opcodes_h_l3101_c41_5569_ins <= VAR_str2_uxn_opcodes_h_l3101_c41_5569_ins;
     str2_uxn_opcodes_h_l3101_c41_5569_pc <= VAR_str2_uxn_opcodes_h_l3101_c41_5569_pc;
     str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3101_c41_5569_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3101_c41_5569_return_output := str2_uxn_opcodes_h_l3101_c41_5569_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_ae4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output;
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_71a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue := VAR_str2_uxn_opcodes_h_l3101_c41_5569_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_bec0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output;

     -- lda[uxn_opcodes_h_l3102_c41_67b0] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3102_c41_67b0_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3102_c41_67b0_phase <= VAR_lda_uxn_opcodes_h_l3102_c41_67b0_phase;
     lda_uxn_opcodes_h_l3102_c41_67b0_ins <= VAR_lda_uxn_opcodes_h_l3102_c41_67b0_ins;
     lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_stack_read;
     lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3102_c41_67b0_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3102_c41_67b0_return_output := lda_uxn_opcodes_h_l3102_c41_67b0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_d033] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_d033_return_output;
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_bec0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue := VAR_lda_uxn_opcodes_h_l3102_c41_67b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_6f44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output;

     -- lda2[uxn_opcodes_h_l3103_c41_eb50] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3103_c41_eb50_phase <= VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_phase;
     lda2_uxn_opcodes_h_l3103_c41_eb50_ins <= VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_ins;
     lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_stack_read;
     lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_return_output := lda2_uxn_opcodes_h_l3103_c41_eb50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_9960] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_9960_return_output;
     VAR_sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_6f44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue := VAR_lda2_uxn_opcodes_h_l3103_c41_eb50_return_output;
     -- sta[uxn_opcodes_h_l3104_c41_6a02] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3104_c41_6a02_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3104_c41_6a02_phase <= VAR_sta_uxn_opcodes_h_l3104_c41_6a02_phase;
     sta_uxn_opcodes_h_l3104_c41_6a02_ins <= VAR_sta_uxn_opcodes_h_l3104_c41_6a02_ins;
     sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3104_c41_6a02_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3104_c41_6a02_return_output := sta_uxn_opcodes_h_l3104_c41_6a02_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_4215] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_b3fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_4215_return_output;
     VAR_sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_b3fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue := VAR_sta_uxn_opcodes_h_l3104_c41_6a02_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_9833] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_f015] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output;

     -- sta2[uxn_opcodes_h_l3105_c41_b913] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3105_c41_b913_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3105_c41_b913_phase <= VAR_sta2_uxn_opcodes_h_l3105_c41_b913_phase;
     sta2_uxn_opcodes_h_l3105_c41_b913_ins <= VAR_sta2_uxn_opcodes_h_l3105_c41_b913_ins;
     sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3105_c41_b913_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3105_c41_b913_return_output := sta2_uxn_opcodes_h_l3105_c41_b913_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_f015_return_output;
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9833_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue := VAR_sta2_uxn_opcodes_h_l3105_c41_b913_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_3bfc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_c237] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output;

     -- dei[uxn_opcodes_h_l3106_c41_dfcd] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3106_c41_dfcd_phase <= VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_phase;
     dei_uxn_opcodes_h_l3106_c41_dfcd_ins <= VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_ins;
     dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_stack_read;
     dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_return_output := dei_uxn_opcodes_h_l3106_c41_dfcd_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_c237_return_output;
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_3bfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue := VAR_dei_uxn_opcodes_h_l3106_c41_dfcd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_3368] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output;

     -- dei2[uxn_opcodes_h_l3107_c41_bcc0] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3107_c41_bcc0_phase <= VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_phase;
     dei2_uxn_opcodes_h_l3107_c41_bcc0_ins <= VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_ins;
     dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_stack_read;
     dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output := dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_4161] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_3368_return_output;
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_4161_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue := VAR_dei2_uxn_opcodes_h_l3107_c41_bcc0_return_output;
     -- deo[uxn_opcodes_h_l3108_c41_7822] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3108_c41_7822_phase <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_phase;
     deo_uxn_opcodes_h_l3108_c41_7822_ins <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_ins;
     deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_stack_read;
     deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_device_ram_read;
     deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read <= VAR_deo_uxn_opcodes_h_l3108_c41_7822_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3108_c41_7822_return_output := deo_uxn_opcodes_h_l3108_c41_7822_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_0f17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_3849] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output;
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_3849_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue := VAR_deo_uxn_opcodes_h_l3108_c41_7822_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_544b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_bf11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output;

     -- deo2[uxn_opcodes_h_l3109_c41_ebcb] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3109_c41_ebcb_phase <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_phase;
     deo2_uxn_opcodes_h_l3109_c41_ebcb_ins <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_ins;
     deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_stack_read;
     deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_device_ram_read;
     deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output := deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output;
     VAR_add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_544b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue := VAR_deo2_uxn_opcodes_h_l3109_c41_ebcb_return_output;
     -- add[uxn_opcodes_h_l3110_c41_a3f0] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3110_c41_a3f0_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3110_c41_a3f0_phase <= VAR_add_uxn_opcodes_h_l3110_c41_a3f0_phase;
     add_uxn_opcodes_h_l3110_c41_a3f0_ins <= VAR_add_uxn_opcodes_h_l3110_c41_a3f0_ins;
     add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read <= VAR_add_uxn_opcodes_h_l3110_c41_a3f0_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3110_c41_a3f0_return_output := add_uxn_opcodes_h_l3110_c41_a3f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_af04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_d51d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output;
     VAR_add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_af04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue := VAR_add_uxn_opcodes_h_l3110_c41_a3f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_fedf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output;

     -- add2[uxn_opcodes_h_l3111_c41_1956] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3111_c41_1956_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3111_c41_1956_phase <= VAR_add2_uxn_opcodes_h_l3111_c41_1956_phase;
     add2_uxn_opcodes_h_l3111_c41_1956_ins <= VAR_add2_uxn_opcodes_h_l3111_c41_1956_ins;
     add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3111_c41_1956_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3111_c41_1956_return_output := add2_uxn_opcodes_h_l3111_c41_1956_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_c82a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output;
     VAR_sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_fedf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue := VAR_add2_uxn_opcodes_h_l3111_c41_1956_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_68af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output;

     -- sub[uxn_opcodes_h_l3112_c41_a647] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3112_c41_a647_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3112_c41_a647_phase <= VAR_sub_uxn_opcodes_h_l3112_c41_a647_phase;
     sub_uxn_opcodes_h_l3112_c41_a647_ins <= VAR_sub_uxn_opcodes_h_l3112_c41_a647_ins;
     sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3112_c41_a647_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3112_c41_a647_return_output := sub_uxn_opcodes_h_l3112_c41_a647_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_91cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output;
     VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_68af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue := VAR_sub_uxn_opcodes_h_l3112_c41_a647_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_2cc7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_35ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output;

     -- sub2[uxn_opcodes_h_l3113_c41_2d51] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3113_c41_2d51_phase <= VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_phase;
     sub2_uxn_opcodes_h_l3113_c41_2d51_ins <= VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_ins;
     sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_return_output := sub2_uxn_opcodes_h_l3113_c41_2d51_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output;
     VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_2cc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue := VAR_sub2_uxn_opcodes_h_l3113_c41_2d51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_73d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output;

     -- mul[uxn_opcodes_h_l3114_c41_9ac1] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3114_c41_9ac1_phase <= VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_phase;
     mul_uxn_opcodes_h_l3114_c41_9ac1_ins <= VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_ins;
     mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_return_output := mul_uxn_opcodes_h_l3114_c41_9ac1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_83aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output;
     VAR_mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_83aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue := VAR_mul_uxn_opcodes_h_l3114_c41_9ac1_return_output;
     -- mul2[uxn_opcodes_h_l3115_c41_3557] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3115_c41_3557_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3115_c41_3557_phase <= VAR_mul2_uxn_opcodes_h_l3115_c41_3557_phase;
     mul2_uxn_opcodes_h_l3115_c41_3557_ins <= VAR_mul2_uxn_opcodes_h_l3115_c41_3557_ins;
     mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3115_c41_3557_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3115_c41_3557_return_output := mul2_uxn_opcodes_h_l3115_c41_3557_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_ec48] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_d819] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output;
     VAR_div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_d819_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue := VAR_mul2_uxn_opcodes_h_l3115_c41_3557_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_bf3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output;

     -- div[uxn_opcodes_h_l3116_c41_3039] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3116_c41_3039_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3116_c41_3039_phase <= VAR_div_uxn_opcodes_h_l3116_c41_3039_phase;
     div_uxn_opcodes_h_l3116_c41_3039_ins <= VAR_div_uxn_opcodes_h_l3116_c41_3039_ins;
     div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read <= VAR_div_uxn_opcodes_h_l3116_c41_3039_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3116_c41_3039_return_output := div_uxn_opcodes_h_l3116_c41_3039_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_1d22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output;
     VAR_div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_bf3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue := VAR_div_uxn_opcodes_h_l3116_c41_3039_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_e66c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_b1c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output;

     -- div2[uxn_opcodes_h_l3117_c41_3810] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3117_c41_3810_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3117_c41_3810_phase <= VAR_div2_uxn_opcodes_h_l3117_c41_3810_phase;
     div2_uxn_opcodes_h_l3117_c41_3810_ins <= VAR_div2_uxn_opcodes_h_l3117_c41_3810_ins;
     div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3117_c41_3810_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3117_c41_3810_return_output := div2_uxn_opcodes_h_l3117_c41_3810_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output;
     VAR_and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_b1c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue := VAR_div2_uxn_opcodes_h_l3117_c41_3810_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c7_6684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_5ece] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output;

     -- and[uxn_opcodes_h_l3118_c41_2475] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3118_c41_2475_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3118_c41_2475_phase <= VAR_and_uxn_opcodes_h_l3118_c41_2475_phase;
     and_uxn_opcodes_h_l3118_c41_2475_ins <= VAR_and_uxn_opcodes_h_l3118_c41_2475_ins;
     and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read <= VAR_and_uxn_opcodes_h_l3118_c41_2475_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3118_c41_2475_return_output := and_uxn_opcodes_h_l3118_c41_2475_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_6684_return_output;
     VAR_and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5ece_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue := VAR_and_uxn_opcodes_h_l3118_c41_2475_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c7_2303] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_45fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output;

     -- and2[uxn_opcodes_h_l3119_c41_14ba] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3119_c41_14ba_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3119_c41_14ba_phase <= VAR_and2_uxn_opcodes_h_l3119_c41_14ba_phase;
     and2_uxn_opcodes_h_l3119_c41_14ba_ins <= VAR_and2_uxn_opcodes_h_l3119_c41_14ba_ins;
     and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3119_c41_14ba_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3119_c41_14ba_return_output := and2_uxn_opcodes_h_l3119_c41_14ba_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_2303_return_output;
     VAR_ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_45fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue := VAR_and2_uxn_opcodes_h_l3119_c41_14ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c7_dedf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c1_e91e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output;

     -- ora[uxn_opcodes_h_l3120_c41_3219] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3120_c41_3219_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3120_c41_3219_phase <= VAR_ora_uxn_opcodes_h_l3120_c41_3219_phase;
     ora_uxn_opcodes_h_l3120_c41_3219_ins <= VAR_ora_uxn_opcodes_h_l3120_c41_3219_ins;
     ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3120_c41_3219_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3120_c41_3219_return_output := ora_uxn_opcodes_h_l3120_c41_3219_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output;
     VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_e91e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue := VAR_ora_uxn_opcodes_h_l3120_c41_3219_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c7_2401] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c1_8e5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output;

     -- ora2[uxn_opcodes_h_l3121_c41_7f66] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3121_c41_7f66_phase <= VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_phase;
     ora2_uxn_opcodes_h_l3121_c41_7f66_ins <= VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_ins;
     ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_return_output := ora2_uxn_opcodes_h_l3121_c41_7f66_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_2401_return_output;
     VAR_eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8e5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue := VAR_ora2_uxn_opcodes_h_l3121_c41_7f66_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c7_769e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c1_68a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output;

     -- eor[uxn_opcodes_h_l3122_c41_1109] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3122_c41_1109_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3122_c41_1109_phase <= VAR_eor_uxn_opcodes_h_l3122_c41_1109_phase;
     eor_uxn_opcodes_h_l3122_c41_1109_ins <= VAR_eor_uxn_opcodes_h_l3122_c41_1109_ins;
     eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3122_c41_1109_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3122_c41_1109_return_output := eor_uxn_opcodes_h_l3122_c41_1109_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c7_769e_return_output;
     VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_68a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue := VAR_eor_uxn_opcodes_h_l3122_c41_1109_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c1_2b3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output;

     -- eor2[uxn_opcodes_h_l3123_c41_a2ea] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3123_c41_a2ea_phase <= VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_phase;
     eor2_uxn_opcodes_h_l3123_c41_a2ea_ins <= VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_ins;
     eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output := eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3125_c7_c67a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output;
     VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_2b3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue := VAR_eor2_uxn_opcodes_h_l3123_c41_a2ea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3126_c1_8ece] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output;

     -- sft[uxn_opcodes_h_l3124_c41_d2ee] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3124_c41_d2ee_phase <= VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_phase;
     sft_uxn_opcodes_h_l3124_c41_d2ee_ins <= VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_ins;
     sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_return_output := sft_uxn_opcodes_h_l3124_c41_d2ee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3125_c1_597b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3126_c1_8ece_return_output;
     VAR_sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3125_c1_597b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue := VAR_sft_uxn_opcodes_h_l3124_c41_d2ee_return_output;
     -- sft2[uxn_opcodes_h_l3125_c41_413b] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3125_c41_413b_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3125_c41_413b_phase <= VAR_sft2_uxn_opcodes_h_l3125_c41_413b_phase;
     sft2_uxn_opcodes_h_l3125_c41_413b_ins <= VAR_sft2_uxn_opcodes_h_l3125_c41_413b_ins;
     sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3125_c41_413b_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3125_c41_413b_return_output := sft2_uxn_opcodes_h_l3125_c41_413b_return_output;

     -- printf_uxn_opcodes_h_l3126_c9_5615[uxn_opcodes_h_l3126_c9_5615] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0 <= VAR_printf_uxn_opcodes_h_l3126_c9_5615_uxn_opcodes_h_l3126_c9_5615_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue := VAR_sft2_uxn_opcodes_h_l3125_c41_413b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3125_c7_c67a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_cond;
     opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output := opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3125_c7_c67a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3124_c7_769e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_cond;
     opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output := opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3124_c7_769e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3123_c7_2401] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_cond;
     opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output := opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_2401_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3122_c7_dedf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_cond;
     opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output := opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_dedf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3121_c7_2303] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_cond;
     opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output := opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_2303_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3120_c7_6684] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_cond;
     opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output := opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_6684_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3119_c7_e66c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_cond;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output := opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_e66c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3118_c7_1d22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_cond;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output := opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_1d22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3117_c7_ec48] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_cond;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output := opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_ec48_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3116_c7_73d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_cond;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output := opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_73d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3115_c7_35ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_cond;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output := opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_35ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3114_c7_91cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_cond;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output := opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_91cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3113_c7_c82a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_cond;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output := opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_c82a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3112_c7_d51d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_cond;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output := opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_d51d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3111_c7_bf11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_cond;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output := opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_bf11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3110_c7_0f17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_cond;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output := opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_0f17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3109_c7_3368] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_cond;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output := opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_3368_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3108_c7_c237] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_cond;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output := opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_c237_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3107_c7_f015] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_cond;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output := opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_f015_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3106_c7_4215] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_cond;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output := opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_4215_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3105_c7_9960] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_cond;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output := opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_9960_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3104_c7_d033] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_cond;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output := opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_d033_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3103_c7_ae4b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_cond;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output := opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_ae4b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3102_c7_2cc3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_cond;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output := opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_2cc3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3101_c7_2be1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_cond;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output := opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_2be1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3100_c7_f2b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_cond;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output := opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_f2b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3099_c7_36dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_cond;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output := opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_36dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3098_c7_b343] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_cond;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output := opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_b343_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3097_c7_6811] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_cond;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output := opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_6811_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3096_c7_3acd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_cond;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output := opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_3acd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3095_c7_4138] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_cond;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output := opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_4138_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3094_c7_8950] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_cond;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output := opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8950_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3093_c7_d066] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_cond;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output := opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d066_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3092_c7_1ad0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_cond;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output := opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ad0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3091_c7_99e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_cond;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output := opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_99e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3090_c7_8a90] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_cond;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output := opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_8a90_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3089_c7_eed2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_cond;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output := opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_eed2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3088_c7_1e2f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_cond;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output := opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_1e2f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3087_c7_5fdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_cond;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output := opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_5fdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3086_c7_d60b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_cond;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output := opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_d60b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3085_c7_f580] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_cond;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output := opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_f580_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3084_c7_f8f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_cond;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output := opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_f8f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3083_c7_527a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_cond;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output := opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_527a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3082_c7_f416] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_cond;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output := opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_f416_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3081_c7_b417] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_cond;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output := opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_b417_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3080_c7_0d11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_cond;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output := opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_0d11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3079_c7_3738] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_cond;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output := opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3738_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3078_c7_4c72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_cond;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output := opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_4c72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3077_c7_c450] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_cond;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output := opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_c450_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3076_c7_9885] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_cond;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output := opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_9885_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3075_c7_adf3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_cond;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output := opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_adf3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3074_c7_6242] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_cond;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output := opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_6242_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3073_c7_179e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_cond;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output := opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_179e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3072_c7_2029] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_cond;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output := opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_2029_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3071_c7_b11f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_cond;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output := opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_b11f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3070_c7_5373] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_cond;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output := opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_5373_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3069_c7_8420] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_cond;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output := opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_8420_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3068_c7_1385] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_cond;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output := opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_1385_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3067_c7_d339] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_cond;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output := opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_d339_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3066_c7_0897] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_cond;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output := opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0897_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3065_c7_eab3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_cond;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output := opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_eab3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3064_c7_05b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_cond;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output := opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_05b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3063_c7_9129] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_cond;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output := opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_9129_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3062_c7_e56e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_cond;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output := opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_e56e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3061_c7_4b0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_cond;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output := opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_4b0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3060_c7_cc15] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_cond;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output := opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_cc15_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3059_c7_e6b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_cond;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output := opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_e6b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3058_c7_db6f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_cond;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output := opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_db6f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3057_c7_ace2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_cond;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output := opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ace2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3056_c2_7da6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_cond;
     opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output := opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3139_c70_6206] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3139_c70_6206_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3153_c34_d1ff] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3153_c34_d1ff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3155_c33_eedf] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3155_c33_eedf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3145_c3_d4d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3145_c3_d4d8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3149_c40_5564] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3149_c40_5564_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3133_l3135_DUPLICATE_988d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3133_l3135_DUPLICATE_988d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l3129_c17_d51c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3129_c17_d51c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3156_l3144_DUPLICATE_c31e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3156_l3144_DUPLICATE_c31e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3157_c32_132d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3157_c32_132d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3154_c37_f895] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3154_c37_f895_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3148_c39_bd63] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3148_c39_bd63_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3131_c6_8dff] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3131_c6_8dff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3150_c34_9a3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3150_c34_9a3b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3152_c33_d2cf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3152_c33_d2cf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l3151_c30_8f85] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3151_c30_8f85_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c2_7da6_return_output.u16_value;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3131_c6_8dff_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3131_c6_8dff_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3129_c17_d51c_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3145_c3_d4d8_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3156_l3144_DUPLICATE_c31e_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l3129_c2_c6d0] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_left;
     BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output := BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3135_DUPLICATE_35ef LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3135_DUPLICATE_35ef_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3133_l3135_DUPLICATE_988d_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3159_l3036_DUPLICATE_6d58 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3159_l3036_DUPLICATE_6d58_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53(
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3148_c39_bd63_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3149_c40_5564_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3150_c34_9a3b_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3151_c30_8f85_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3152_c33_d2cf_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3153_c34_d1ff_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3154_c37_f895_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3155_c33_eedf_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3156_l3144_DUPLICATE_c31e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3157_c32_132d_return_output);

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3139_c59_72ea] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c59_72ea_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3139_c70_6206_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l3139_c30_925c_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;
     VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l3129_c2_c6d0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3135_DUPLICATE_35ef_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3135_DUPLICATE_35ef_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c59_72ea_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3159_l3036_DUPLICATE_6d58_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3159_l3036_DUPLICATE_6d58_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3133_c4_f009] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output;

     -- MUX[uxn_opcodes_h_l3140_c20_9ff9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3140_c20_9ff9_cond <= VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_cond;
     MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue <= VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iftrue;
     MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse <= VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output := MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3135_c4_3b5f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l3133_c4_34cd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_f009_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3135_c4_f4be := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3135_c4_3b5f_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right := VAR_MUX_uxn_opcodes_h_l3140_c20_9ff9_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse := VAR_sp0_uxn_opcodes_h_l3135_c4_f4be;
     VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue := VAR_sp1_uxn_opcodes_h_l3133_c4_34cd;
     -- sp1_MUX[uxn_opcodes_h_l3132_c3_a76f] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_cond;
     sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue;
     sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output := sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3132_c3_a76f] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_cond;
     sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iftrue;
     sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output := sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3132_c3_a76f_return_output;
     -- sp1_MUX[uxn_opcodes_h_l3131_c2_139c] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_cond;
     sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue;
     sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output := sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3131_c2_139c] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_cond;
     sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iftrue;
     sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output := sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;
     VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3131_c2_139c_return_output;
     -- MUX[uxn_opcodes_h_l3139_c30_925c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3139_c30_925c_cond <= VAR_MUX_uxn_opcodes_h_l3139_c30_925c_cond;
     MUX_uxn_opcodes_h_l3139_c30_925c_iftrue <= VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iftrue;
     MUX_uxn_opcodes_h_l3139_c30_925c_iffalse <= VAR_MUX_uxn_opcodes_h_l3139_c30_925c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3139_c30_925c_return_output := MUX_uxn_opcodes_h_l3139_c30_925c_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3139_c19_4382] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c19_4382_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l3139_c30_925c_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3139_c19_4382_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3139_c19_9b1f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l3139_c19_9b1f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3140_c2_e6c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l3140_c2_a0b0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3140_c2_e6c5_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3140_c2_a0b0;
     VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address := VAR_stack_address_uxn_opcodes_h_l3140_c2_a0b0;
     -- stack_ram_update[uxn_opcodes_h_l3142_c21_f782] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_stack_address;
     stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value <= VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_value;
     stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output := stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3142_c21_f782_return_output;
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
