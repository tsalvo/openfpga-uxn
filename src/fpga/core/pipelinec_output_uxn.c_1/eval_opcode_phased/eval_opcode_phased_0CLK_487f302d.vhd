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
-- Submodules: 406
entity eval_opcode_phased_0CLK_487f302d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_487f302d;
architecture arch of eval_opcode_phased_0CLK_487f302d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp : unsigned(7 downto 0) := to_unsigned(0, 8);
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
signal REG_COMB_sp : unsigned(7 downto 0);
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
-- BIN_OP_AND[uxn_opcodes_h_l2024_c10_4fd7]
signal BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2024_c10_4e61]
signal BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2024_c41_2f72]
signal BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2024_c57_adb4]
signal CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2024_c10_c5c2]
signal MUX_uxn_opcodes_h_l2024_c10_c5c2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2025_c18_6d24]
signal BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2025_c18_221e]
signal BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2025_c18_7b82]
signal MUX_uxn_opcodes_h_l2025_c18_7b82_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2025_c18_7b82_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2027_c2_71d9[uxn_opcodes_h_l2027_c2_71d9]
signal printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c6_c692]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_5a09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2029_c2_66e8]
signal opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_41e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_2d0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_9689]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2030_c7_5a09]
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2030_c41_6a65]
signal jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2030_c41_6a65_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2030_c41_6a65_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2030_c41_6a65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_3732]
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_e046]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_f82b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2031_c7_9689]
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2031_c41_eb92]
signal jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2031_c41_eb92_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2031_c41_eb92_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2031_c41_eb92_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_a0fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_9c85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_fd41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2032_c7_f82b]
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2032_c41_9bc2]
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_2c14]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_5d94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_66f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2033_c7_fd41]
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2033_c41_4bfd]
signal lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2033_c41_4bfd_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2033_c41_4bfd_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2033_c41_4bfd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_1538]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_13c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_b7e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2034_c7_66f1]
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2034_c41_723f]
signal lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2034_c41_723f_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2034_c41_723f_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2034_c41_723f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_c1be]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_adb5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_2334]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2035_c7_b7e6]
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2035_c41_d154]
signal lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2035_c41_d154_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2035_c41_d154_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2035_c41_d154_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_51c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_9332]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_8cb4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2036_c7_2334]
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2036_c41_efe1]
signal lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2036_c41_efe1_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2036_c41_efe1_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2036_c41_efe1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_7c49]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_f899]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_bc6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2037_c7_8cb4]
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2037_c41_90d9]
signal inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_pc : unsigned(15 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2037_c41_90d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_3564]
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_97aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_d030]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2038_c7_bc6a]
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2038_c41_7c4c]
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_pc : unsigned(15 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_a40d]
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_2ab0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_9649]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2039_c7_d030]
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2039_c41_e2fe]
signal pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_pc : unsigned(15 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2039_c41_e2fe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_19f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_4aaf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_7a6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2040_c7_9649]
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2040_c41_cd0b]
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_pc : unsigned(15 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_ba2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_c382]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_0ead]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2041_c7_7a6c]
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2041_c41_1715]
signal nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_pc : unsigned(15 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2041_c41_1715_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_b712]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_05c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_66fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2042_c7_0ead]
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2042_c41_1b1d]
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_pc : unsigned(15 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_01b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_80ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_ef49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2043_c7_66fb]
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2043_c41_8ffe]
signal swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_pc : unsigned(15 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2043_c41_8ffe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_93f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_5071]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_9c9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2044_c7_ef49]
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2044_c41_0bb5]
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_pc : unsigned(15 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_29da]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_d3d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_2e5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2045_c7_9c9e]
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2045_c28_7453[uxn_opcodes_h_l2045_c28_7453]
signal printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_67cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_0df0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_e769]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2046_c7_2e5e]
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2046_c41_a21c]
signal rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_pc : unsigned(15 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2046_c41_a21c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_a6af]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_fa62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_1597]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2047_c7_e769]
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2047_c28_5422[uxn_opcodes_h_l2047_c28_5422]
signal printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_c528]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_5a36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_3896]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2048_c7_1597]
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2048_c41_6db9]
signal dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_pc : unsigned(15 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2048_c41_6db9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_5968]
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_dc9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_3c78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2049_c7_3896]
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2049_c28_ead0[uxn_opcodes_h_l2049_c28_ead0]
signal printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_c996]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_8d3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_3978]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2050_c7_3c78]
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2050_c41_41de]
signal ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_pc : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2050_c41_41de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_6586]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_7f45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_54da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2051_c7_3978]
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2051_c41_b6da]
signal equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_pc : unsigned(15 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2051_c41_b6da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_07d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_f97e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_5073]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2052_c7_54da]
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2052_c41_4c29]
signal equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_pc : unsigned(15 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2052_c41_4c29_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_4945]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_5a5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_dc0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2053_c7_5073]
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2053_c41_5f3d]
signal neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_pc : unsigned(15 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2053_c41_5f3d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_e628]
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_5499]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_cebf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2054_c7_dc0e]
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2054_c41_f2d2]
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_pc : unsigned(15 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_6fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_591c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_c40f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2055_c7_cebf]
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2055_c28_5534[uxn_opcodes_h_l2055_c28_5534]
signal printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_2ce5]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_fd91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_9b99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2056_c7_c40f]
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2056_c41_0b3e]
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_pc : unsigned(15 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_b7c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_a6b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_0e33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2057_c7_9b99]
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2057_c28_8a36[uxn_opcodes_h_l2057_c28_8a36]
signal printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_63e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_b62d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_5c44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2058_c7_0e33]
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2058_c41_61ac]
signal lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_pc : unsigned(15 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2058_c41_61ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_898f]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_1603]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_cff5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2059_c7_5c44]
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2059_c28_19d6[uxn_opcodes_h_l2059_c28_19d6]
signal printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_e3ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_4dd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_fdfd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2060_c7_cff5]
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2060_c41_174a]
signal jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_pc : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2060_c41_174a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_0d17]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_328a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_8488]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2061_c7_fdfd]
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2061_c28_bb9f[uxn_opcodes_h_l2061_c28_bb9f]
signal printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_677b]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_f146]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_d7f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2062_c7_8488]
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2062_c28_e3cf[uxn_opcodes_h_l2062_c28_e3cf]
signal printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_80f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_52a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_d7b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2063_c7_d7f0]
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2063_c28_329a[uxn_opcodes_h_l2063_c28_329a]
signal printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_47b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_4712]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_5320]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2064_c7_d7b3]
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2064_c28_886e[uxn_opcodes_h_l2064_c28_886e]
signal printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_2ef4]
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_99b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_32b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2065_c7_5320]
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2065_c28_b4ea[uxn_opcodes_h_l2065_c28_b4ea]
signal printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_8300]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_6ffb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_afd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2066_c7_32b5]
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2066_c41_1a4a]
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_pc : unsigned(15 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_c8dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_89c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_b47c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2067_c7_afd9]
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2067_c28_ea11[uxn_opcodes_h_l2067_c28_ea11]
signal printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_2221]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_1b5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_e83b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2068_c7_b47c]
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2068_c28_24a1[uxn_opcodes_h_l2068_c28_24a1]
signal printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_8baf]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_4c78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_48a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2069_c7_e83b]
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2069_c28_09a2[uxn_opcodes_h_l2069_c28_09a2]
signal printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_238d]
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_1933]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_f77d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2070_c7_48a1]
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2070_c28_4c44[uxn_opcodes_h_l2070_c28_4c44]
signal printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_5b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_97b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_9271]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2071_c7_f77d]
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2071_c28_8e5c[uxn_opcodes_h_l2071_c28_8e5c]
signal printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_b161]
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_30b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_3bd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2072_c7_9271]
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2072_c28_6ce8[uxn_opcodes_h_l2072_c28_6ce8]
signal printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_e564]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_d48c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_6b7c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2073_c7_3bd0]
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2073_c28_9bb7[uxn_opcodes_h_l2073_c28_9bb7]
signal printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_5020]
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_b252]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_eaf3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2074_c7_6b7c]
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2074_c28_ce73[uxn_opcodes_h_l2074_c28_ce73]
signal printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_7b7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_29dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_aff5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2075_c7_eaf3]
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2075_c28_8d26[uxn_opcodes_h_l2075_c28_8d26]
signal printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_fcb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_382c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c7_67df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2076_c7_aff5]
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2076_c41_5ff0]
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_pc : unsigned(15 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_7256]
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_173e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2078_c7_5a0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2077_c7_67df]
signal opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2077_c28_7679[uxn_opcodes_h_l2077_c28_7679]
signal printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2078_c11_c1e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2078_c1_c128]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2079_c7_b919]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2078_c7_5a0d]
signal opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2078_c41_78dc]
signal sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_pc : unsigned(15 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2078_c41_78dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_57a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2079_c1_cd2a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2080_c7_0e7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2079_c7_b919]
signal opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2079_c28_bcbd[uxn_opcodes_h_l2079_c28_bcbd]
signal printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_86b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2080_c1_26e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c7_3da8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2080_c7_0e7f]
signal opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2080_c28_5994[uxn_opcodes_h_l2080_c28_5994]
signal printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_5ee8]
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c1_212c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2082_c7_749c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2081_c7_3da8]
signal opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2081_c41_6ea8]
signal deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_pc : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2081_c41_6ea8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_c968]
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2082_c1_58d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2083_c7_7b0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2082_c7_749c]
signal opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2082_c41_682f]
signal deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_pc : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2082_c41_682f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2083_c11_887d]
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2083_c1_5441]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2084_c7_328d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2083_c7_7b0e]
signal opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2083_c28_fee7[uxn_opcodes_h_l2083_c28_fee7]
signal printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_3281]
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2084_c1_99ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c7_5759]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2084_c7_328d]
signal opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2084_c41_1895]
signal add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_pc : unsigned(15 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2084_c41_1895_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2085_c11_eda9]
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c1_c5f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2086_c7_82e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2085_c7_5759]
signal opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2085_c28_6d33[uxn_opcodes_h_l2085_c28_6d33]
signal printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2086_c11_a3d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2086_c1_9d0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2087_c7_ecca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2086_c7_82e3]
signal opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2086_c41_472e]
signal sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_pc : unsigned(15 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2086_c41_472e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2087_c11_995d]
signal BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2087_c1_bbde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2088_c7_e550]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2087_c7_ecca]
signal opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2087_c28_342d[uxn_opcodes_h_l2087_c28_342d]
signal printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_5139]
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2088_c1_6a36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2089_c7_be70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2088_c7_e550]
signal opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2088_c41_071c]
signal mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_pc : unsigned(15 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2088_c41_071c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_34c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2089_c1_61e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2090_c7_8fca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2089_c7_be70]
signal opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2089_c28_43bb[uxn_opcodes_h_l2089_c28_43bb]
signal printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_d5c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2090_c1_7c42]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2091_c7_5f80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2090_c7_8fca]
signal opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2090_c41_c832]
signal div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_pc : unsigned(15 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2090_c41_c832_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2091_c11_cfa0]
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2091_c1_9fa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c7_ea51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2091_c7_5f80]
signal opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2091_c28_cab2[uxn_opcodes_h_l2091_c28_cab2]
signal printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2092_c11_66f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_31eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c7_18a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2092_c7_ea51]
signal opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2092_c41_38a4]
signal and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_pc : unsigned(15 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2092_c41_38a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_5eb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c1_a0f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c7_2117]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2093_c7_18a0]
signal opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2093_c28_73bf[uxn_opcodes_h_l2093_c28_73bf]
signal printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_9801]
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c1_9a64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c7_af52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2094_c7_2117]
signal opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2094_c41_01be]
signal ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_pc : unsigned(15 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2094_c41_01be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2095_c11_472f]
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c1_647d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2096_c7_5d63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2095_c7_af52]
signal opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2095_c41_1cca]
signal eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_pc : unsigned(15 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2095_c41_1cca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2096_c11_f031]
signal BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2096_c1_f3fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2097_c7_454b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2096_c7_5d63]
signal opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2096_c41_f53c]
signal eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_pc : unsigned(15 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2096_c41_f53c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2097_c11_4875]
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2097_c1_18b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2098_c7_540a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2097_c7_454b]
signal opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2097_c41_0817]
signal sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_pc : unsigned(15 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2097_c41_0817_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_87c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2098_c1_58e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2099_c1_596e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2098_c7_540a]
signal opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2098_c41_7dc2]
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_pc : unsigned(15 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2099_c9_8ae1[uxn_opcodes_h_l2099_c9_8ae1]
signal printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2101_c2_81c7]
signal sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2101_c2_81c7]
signal sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2102_c3_91eb]
signal sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2102_c3_91eb]
signal sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2103_c4_cd6c]
signal BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2105_c4_e0b5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2111_c19_5862]
signal MUX_uxn_opcodes_h_l2111_c19_5862_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2111_c19_5862_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2111_c19_5862_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2111_c19_5862_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2111_c19_327d]
signal BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2114_c1_e7b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2123_c1_c993]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l2114_c2_21ed]
signal stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l2115_c22_0b96]
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l2124_c22_391b]
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l2134_c26_32bd]
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output : unsigned(0 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7
BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left,
BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right,
BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61
BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left,
BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right,
BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72
BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left,
BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right,
BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4
CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x,
CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output);

-- MUX_uxn_opcodes_h_l2024_c10_c5c2
MUX_uxn_opcodes_h_l2024_c10_c5c2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2024_c10_c5c2_cond,
MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue,
MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse,
MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24
BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left,
BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right,
BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e
BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left,
BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right,
BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output);

-- MUX_uxn_opcodes_h_l2025_c18_7b82
MUX_uxn_opcodes_h_l2025_c18_7b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2025_c18_7b82_cond,
MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue,
MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse,
MUX_uxn_opcodes_h_l2025_c18_7b82_return_output);

-- printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9
printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9 : entity work.printf_uxn_opcodes_h_l2027_c2_71d9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0,
printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1,
printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692
BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8
opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond,
opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09
opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond,
opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue,
opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse,
opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output);

-- jci_uxn_opcodes_h_l2030_c41_6a65
jci_uxn_opcodes_h_l2030_c41_6a65 : entity work.jci_0CLK_bbbe252c port map (
clk,
jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2030_c41_6a65_phase,
jci_uxn_opcodes_h_l2030_c41_6a65_pc,
jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read,
jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read,
jci_uxn_opcodes_h_l2030_c41_6a65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2031_c7_9689
opc_result_MUX_uxn_opcodes_h_l2031_c7_9689 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond,
opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue,
opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse,
opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output);

-- jmi_uxn_opcodes_h_l2031_c41_eb92
jmi_uxn_opcodes_h_l2031_c41_eb92 : entity work.jmi_0CLK_b30fc8f1 port map (
clk,
jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2031_c41_eb92_phase,
jmi_uxn_opcodes_h_l2031_c41_eb92_pc,
jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read,
jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read,
jmi_uxn_opcodes_h_l2031_c41_eb92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b
opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond,
opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output);

-- jsi_uxn_opcodes_h_l2032_c41_9bc2
jsi_uxn_opcodes_h_l2032_c41_9bc2 : entity work.jsi_0CLK_a05d6369 port map (
clk,
jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2032_c41_9bc2_phase,
jsi_uxn_opcodes_h_l2032_c41_9bc2_pc,
jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read,
jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read,
jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41
opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond,
opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue,
opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse,
opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output);

-- lit_uxn_opcodes_h_l2033_c41_4bfd
lit_uxn_opcodes_h_l2033_c41_4bfd : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2033_c41_4bfd_phase,
lit_uxn_opcodes_h_l2033_c41_4bfd_pc,
lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read,
lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read,
lit_uxn_opcodes_h_l2033_c41_4bfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1
opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond,
opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output);

-- lit2_uxn_opcodes_h_l2034_c41_723f
lit2_uxn_opcodes_h_l2034_c41_723f : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2034_c41_723f_phase,
lit2_uxn_opcodes_h_l2034_c41_723f_pc,
lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read,
lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read,
lit2_uxn_opcodes_h_l2034_c41_723f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6
opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond,
opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output);

-- lit_uxn_opcodes_h_l2035_c41_d154
lit_uxn_opcodes_h_l2035_c41_d154 : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2035_c41_d154_phase,
lit_uxn_opcodes_h_l2035_c41_d154_pc,
lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read,
lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read,
lit_uxn_opcodes_h_l2035_c41_d154_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2036_c7_2334
opc_result_MUX_uxn_opcodes_h_l2036_c7_2334 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond,
opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue,
opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse,
opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output);

-- lit2_uxn_opcodes_h_l2036_c41_efe1
lit2_uxn_opcodes_h_l2036_c41_efe1 : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2036_c41_efe1_phase,
lit2_uxn_opcodes_h_l2036_c41_efe1_pc,
lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read,
lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read,
lit2_uxn_opcodes_h_l2036_c41_efe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4
opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond,
opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output);

-- inc_uxn_opcodes_h_l2037_c41_90d9
inc_uxn_opcodes_h_l2037_c41_90d9 : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2037_c41_90d9_phase,
inc_uxn_opcodes_h_l2037_c41_90d9_ins,
inc_uxn_opcodes_h_l2037_c41_90d9_pc,
inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read,
inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read,
inc_uxn_opcodes_h_l2037_c41_90d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a
opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond,
opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output);

-- inc2_uxn_opcodes_h_l2038_c41_7c4c
inc2_uxn_opcodes_h_l2038_c41_7c4c : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2038_c41_7c4c_phase,
inc2_uxn_opcodes_h_l2038_c41_7c4c_ins,
inc2_uxn_opcodes_h_l2038_c41_7c4c_pc,
inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read,
inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read,
inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2039_c7_d030
opc_result_MUX_uxn_opcodes_h_l2039_c7_d030 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond,
opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue,
opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse,
opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output);

-- pop_uxn_opcodes_h_l2039_c41_e2fe
pop_uxn_opcodes_h_l2039_c41_e2fe : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2039_c41_e2fe_phase,
pop_uxn_opcodes_h_l2039_c41_e2fe_ins,
pop_uxn_opcodes_h_l2039_c41_e2fe_pc,
pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read,
pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read,
pop_uxn_opcodes_h_l2039_c41_e2fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2040_c7_9649
opc_result_MUX_uxn_opcodes_h_l2040_c7_9649 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond,
opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue,
opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse,
opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output);

-- pop2_uxn_opcodes_h_l2040_c41_cd0b
pop2_uxn_opcodes_h_l2040_c41_cd0b : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2040_c41_cd0b_phase,
pop2_uxn_opcodes_h_l2040_c41_cd0b_ins,
pop2_uxn_opcodes_h_l2040_c41_cd0b_pc,
pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read,
pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read,
pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c
opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond,
opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output);

-- nip_uxn_opcodes_h_l2041_c41_1715
nip_uxn_opcodes_h_l2041_c41_1715 : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2041_c41_1715_phase,
nip_uxn_opcodes_h_l2041_c41_1715_ins,
nip_uxn_opcodes_h_l2041_c41_1715_pc,
nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read,
nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read,
nip_uxn_opcodes_h_l2041_c41_1715_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead
opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond,
opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue,
opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse,
opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output);

-- nip2_uxn_opcodes_h_l2042_c41_1b1d
nip2_uxn_opcodes_h_l2042_c41_1b1d : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2042_c41_1b1d_phase,
nip2_uxn_opcodes_h_l2042_c41_1b1d_ins,
nip2_uxn_opcodes_h_l2042_c41_1b1d_pc,
nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read,
nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read,
nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb
opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond,
opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output);

-- swp_uxn_opcodes_h_l2043_c41_8ffe
swp_uxn_opcodes_h_l2043_c41_8ffe : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2043_c41_8ffe_phase,
swp_uxn_opcodes_h_l2043_c41_8ffe_ins,
swp_uxn_opcodes_h_l2043_c41_8ffe_pc,
swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read,
swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read,
swp_uxn_opcodes_h_l2043_c41_8ffe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49
opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond,
opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output);

-- swp2_uxn_opcodes_h_l2044_c41_0bb5
swp2_uxn_opcodes_h_l2044_c41_0bb5 : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2044_c41_0bb5_phase,
swp2_uxn_opcodes_h_l2044_c41_0bb5_ins,
swp2_uxn_opcodes_h_l2044_c41_0bb5_pc,
swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read,
swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read,
swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e
opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output);

-- printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453
printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453 : entity work.printf_uxn_opcodes_h_l2045_c28_7453_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e
opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond,
opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output);

-- rot2_uxn_opcodes_h_l2046_c41_a21c
rot2_uxn_opcodes_h_l2046_c41_a21c : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2046_c41_a21c_phase,
rot2_uxn_opcodes_h_l2046_c41_a21c_ins,
rot2_uxn_opcodes_h_l2046_c41_a21c_pc,
rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read,
rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read,
rot2_uxn_opcodes_h_l2046_c41_a21c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2047_c7_e769
opc_result_MUX_uxn_opcodes_h_l2047_c7_e769 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond,
opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue,
opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse,
opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output);

-- printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422
printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422 : entity work.printf_uxn_opcodes_h_l2047_c28_5422_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2048_c7_1597
opc_result_MUX_uxn_opcodes_h_l2048_c7_1597 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse,
opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output);

-- dup2_uxn_opcodes_h_l2048_c41_6db9
dup2_uxn_opcodes_h_l2048_c41_6db9 : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2048_c41_6db9_phase,
dup2_uxn_opcodes_h_l2048_c41_6db9_ins,
dup2_uxn_opcodes_h_l2048_c41_6db9_pc,
dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read,
dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read,
dup2_uxn_opcodes_h_l2048_c41_6db9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right,
BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2049_c7_3896
opc_result_MUX_uxn_opcodes_h_l2049_c7_3896 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond,
opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue,
opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse,
opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output);

-- printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0
printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0 : entity work.printf_uxn_opcodes_h_l2049_c28_ead0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78
opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond,
opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue,
opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse,
opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output);

-- ovr2_uxn_opcodes_h_l2050_c41_41de
ovr2_uxn_opcodes_h_l2050_c41_41de : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2050_c41_41de_phase,
ovr2_uxn_opcodes_h_l2050_c41_41de_ins,
ovr2_uxn_opcodes_h_l2050_c41_41de_pc,
ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read,
ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read,
ovr2_uxn_opcodes_h_l2050_c41_41de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2051_c7_3978
opc_result_MUX_uxn_opcodes_h_l2051_c7_3978 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond,
opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue,
opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse,
opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output);

-- equ_uxn_opcodes_h_l2051_c41_b6da
equ_uxn_opcodes_h_l2051_c41_b6da : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2051_c41_b6da_phase,
equ_uxn_opcodes_h_l2051_c41_b6da_ins,
equ_uxn_opcodes_h_l2051_c41_b6da_pc,
equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read,
equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read,
equ_uxn_opcodes_h_l2051_c41_b6da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2052_c7_54da
opc_result_MUX_uxn_opcodes_h_l2052_c7_54da : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond,
opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue,
opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse,
opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output);

-- equ2_uxn_opcodes_h_l2052_c41_4c29
equ2_uxn_opcodes_h_l2052_c41_4c29 : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2052_c41_4c29_phase,
equ2_uxn_opcodes_h_l2052_c41_4c29_ins,
equ2_uxn_opcodes_h_l2052_c41_4c29_pc,
equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read,
equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read,
equ2_uxn_opcodes_h_l2052_c41_4c29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2053_c7_5073
opc_result_MUX_uxn_opcodes_h_l2053_c7_5073 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond,
opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue,
opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse,
opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output);

-- neq_uxn_opcodes_h_l2053_c41_5f3d
neq_uxn_opcodes_h_l2053_c41_5f3d : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2053_c41_5f3d_phase,
neq_uxn_opcodes_h_l2053_c41_5f3d_ins,
neq_uxn_opcodes_h_l2053_c41_5f3d_pc,
neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read,
neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read,
neq_uxn_opcodes_h_l2053_c41_5f3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e
opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond,
opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output);

-- neq2_uxn_opcodes_h_l2054_c41_f2d2
neq2_uxn_opcodes_h_l2054_c41_f2d2 : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2054_c41_f2d2_phase,
neq2_uxn_opcodes_h_l2054_c41_f2d2_ins,
neq2_uxn_opcodes_h_l2054_c41_f2d2_pc,
neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read,
neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read,
neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf
opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond,
opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output);

-- printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534
printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534 : entity work.printf_uxn_opcodes_h_l2055_c28_5534_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f
opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond,
opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output);

-- gth2_uxn_opcodes_h_l2056_c41_0b3e
gth2_uxn_opcodes_h_l2056_c41_0b3e : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2056_c41_0b3e_phase,
gth2_uxn_opcodes_h_l2056_c41_0b3e_ins,
gth2_uxn_opcodes_h_l2056_c41_0b3e_pc,
gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read,
gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read,
gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99
opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond,
opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue,
opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse,
opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output);

-- printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36
printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36 : entity work.printf_uxn_opcodes_h_l2057_c28_8a36_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33
opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond,
opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue,
opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse,
opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output);

-- lth2_uxn_opcodes_h_l2058_c41_61ac
lth2_uxn_opcodes_h_l2058_c41_61ac : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2058_c41_61ac_phase,
lth2_uxn_opcodes_h_l2058_c41_61ac_ins,
lth2_uxn_opcodes_h_l2058_c41_61ac_pc,
lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read,
lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read,
lth2_uxn_opcodes_h_l2058_c41_61ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44
opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond,
opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue,
opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse,
opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output);

-- printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6
printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6 : entity work.printf_uxn_opcodes_h_l2059_c28_19d6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5
opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond,
opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output);

-- jmp2_uxn_opcodes_h_l2060_c41_174a
jmp2_uxn_opcodes_h_l2060_c41_174a : entity work.jmp2_0CLK_68908aa0 port map (
clk,
jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2060_c41_174a_phase,
jmp2_uxn_opcodes_h_l2060_c41_174a_ins,
jmp2_uxn_opcodes_h_l2060_c41_174a_pc,
jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read,
jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read,
jmp2_uxn_opcodes_h_l2060_c41_174a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd
opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond,
opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output);

-- printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f
printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f : entity work.printf_uxn_opcodes_h_l2061_c28_bb9f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2062_c7_8488
opc_result_MUX_uxn_opcodes_h_l2062_c7_8488 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond,
opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue,
opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse,
opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output);

-- printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf
printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf : entity work.printf_uxn_opcodes_h_l2062_c28_e3cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0
opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond,
opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output);

-- printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a
printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a : entity work.printf_uxn_opcodes_h_l2063_c28_329a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3
opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond,
opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output);

-- printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e
printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e : entity work.printf_uxn_opcodes_h_l2064_c28_886e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2065_c7_5320
opc_result_MUX_uxn_opcodes_h_l2065_c7_5320 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond,
opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue,
opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse,
opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output);

-- printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea
printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea : entity work.printf_uxn_opcodes_h_l2065_c28_b4ea_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5
opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond,
opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output);

-- sth2_uxn_opcodes_h_l2066_c41_1a4a
sth2_uxn_opcodes_h_l2066_c41_1a4a : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2066_c41_1a4a_phase,
sth2_uxn_opcodes_h_l2066_c41_1a4a_ins,
sth2_uxn_opcodes_h_l2066_c41_1a4a_pc,
sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read,
sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read,
sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9
opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond,
opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output);

-- printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11
printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11 : entity work.printf_uxn_opcodes_h_l2067_c28_ea11_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c
opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond,
opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output);

-- printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1
printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1 : entity work.printf_uxn_opcodes_h_l2068_c28_24a1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b
opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output);

-- printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2
printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2 : entity work.printf_uxn_opcodes_h_l2069_c28_09a2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right,
BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1
opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond,
opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output);

-- printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44
printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44 : entity work.printf_uxn_opcodes_h_l2070_c28_4c44_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d
opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond,
opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output);

-- printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c
printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c : entity work.printf_uxn_opcodes_h_l2071_c28_8e5c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2072_c7_9271
opc_result_MUX_uxn_opcodes_h_l2072_c7_9271 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond,
opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue,
opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse,
opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output);

-- printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8
printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8 : entity work.printf_uxn_opcodes_h_l2072_c28_6ce8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0
opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond,
opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output);

-- printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7
printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7 : entity work.printf_uxn_opcodes_h_l2073_c28_9bb7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c
opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond,
opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output);

-- printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73
printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73 : entity work.printf_uxn_opcodes_h_l2074_c28_ce73_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3
opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond,
opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output);

-- printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26
printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26 : entity work.printf_uxn_opcodes_h_l2075_c28_8d26_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5
opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond,
opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output);

-- lda2_uxn_opcodes_h_l2076_c41_5ff0
lda2_uxn_opcodes_h_l2076_c41_5ff0 : entity work.lda2_0CLK_9347d63d port map (
clk,
lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2076_c41_5ff0_phase,
lda2_uxn_opcodes_h_l2076_c41_5ff0_ins,
lda2_uxn_opcodes_h_l2076_c41_5ff0_pc,
lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read,
lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read,
lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2077_c7_67df
opc_result_MUX_uxn_opcodes_h_l2077_c7_67df : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond,
opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue,
opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse,
opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output);

-- printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679
printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679 : entity work.printf_uxn_opcodes_h_l2077_c28_7679_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4
BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d
opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond,
opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output);

-- sta2_uxn_opcodes_h_l2078_c41_78dc
sta2_uxn_opcodes_h_l2078_c41_78dc : entity work.sta2_0CLK_201aeef3 port map (
clk,
sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2078_c41_78dc_phase,
sta2_uxn_opcodes_h_l2078_c41_78dc_ins,
sta2_uxn_opcodes_h_l2078_c41_78dc_pc,
sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read,
sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read,
sta2_uxn_opcodes_h_l2078_c41_78dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2079_c7_b919
opc_result_MUX_uxn_opcodes_h_l2079_c7_b919 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond,
opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue,
opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse,
opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output);

-- printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd
printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd : entity work.printf_uxn_opcodes_h_l2079_c28_bcbd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f
opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond,
opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output);

-- printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994
printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994 : entity work.printf_uxn_opcodes_h_l2080_c28_5994_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8
opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond,
opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output);

-- deo_uxn_opcodes_h_l2081_c41_6ea8
deo_uxn_opcodes_h_l2081_c41_6ea8 : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2081_c41_6ea8_phase,
deo_uxn_opcodes_h_l2081_c41_6ea8_ins,
deo_uxn_opcodes_h_l2081_c41_6ea8_pc,
deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read,
deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read,
deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read,
deo_uxn_opcodes_h_l2081_c41_6ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2082_c7_749c
opc_result_MUX_uxn_opcodes_h_l2082_c7_749c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond,
opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output);

-- deo2_uxn_opcodes_h_l2082_c41_682f
deo2_uxn_opcodes_h_l2082_c41_682f : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2082_c41_682f_phase,
deo2_uxn_opcodes_h_l2082_c41_682f_ins,
deo2_uxn_opcodes_h_l2082_c41_682f_pc,
deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read,
deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read,
deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read,
deo2_uxn_opcodes_h_l2082_c41_682f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left,
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right,
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e
opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond,
opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output);

-- printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7
printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7 : entity work.printf_uxn_opcodes_h_l2083_c28_fee7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2084_c7_328d
opc_result_MUX_uxn_opcodes_h_l2084_c7_328d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond,
opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output);

-- add2_uxn_opcodes_h_l2084_c41_1895
add2_uxn_opcodes_h_l2084_c41_1895 : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2084_c41_1895_phase,
add2_uxn_opcodes_h_l2084_c41_1895_ins,
add2_uxn_opcodes_h_l2084_c41_1895_pc,
add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read,
add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read,
add2_uxn_opcodes_h_l2084_c41_1895_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left,
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right,
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2085_c7_5759
opc_result_MUX_uxn_opcodes_h_l2085_c7_5759 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond,
opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue,
opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse,
opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output);

-- printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33
printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33 : entity work.printf_uxn_opcodes_h_l2085_c28_6d33_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3
opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond,
opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output);

-- sub2_uxn_opcodes_h_l2086_c41_472e
sub2_uxn_opcodes_h_l2086_c41_472e : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2086_c41_472e_phase,
sub2_uxn_opcodes_h_l2086_c41_472e_ins,
sub2_uxn_opcodes_h_l2086_c41_472e_pc,
sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read,
sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read,
sub2_uxn_opcodes_h_l2086_c41_472e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d
BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left,
BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right,
BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca
opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond,
opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output);

-- printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d
printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d : entity work.printf_uxn_opcodes_h_l2087_c28_342d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2088_c7_e550
opc_result_MUX_uxn_opcodes_h_l2088_c7_e550 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond,
opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue,
opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse,
opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output);

-- mul2_uxn_opcodes_h_l2088_c41_071c
mul2_uxn_opcodes_h_l2088_c41_071c : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2088_c41_071c_phase,
mul2_uxn_opcodes_h_l2088_c41_071c_ins,
mul2_uxn_opcodes_h_l2088_c41_071c_pc,
mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read,
mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read,
mul2_uxn_opcodes_h_l2088_c41_071c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2089_c7_be70
opc_result_MUX_uxn_opcodes_h_l2089_c7_be70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond,
opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue,
opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse,
opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output);

-- printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb
printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb : entity work.printf_uxn_opcodes_h_l2089_c28_43bb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca
opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond,
opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output);

-- div2_uxn_opcodes_h_l2090_c41_c832
div2_uxn_opcodes_h_l2090_c41_c832 : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2090_c41_c832_phase,
div2_uxn_opcodes_h_l2090_c41_c832_ins,
div2_uxn_opcodes_h_l2090_c41_c832_pc,
div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read,
div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read,
div2_uxn_opcodes_h_l2090_c41_c832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0
BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left,
BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right,
BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80
opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond,
opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output);

-- printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2
printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2 : entity work.printf_uxn_opcodes_h_l2091_c28_cab2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51
opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond,
opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue,
opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse,
opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output);

-- and2_uxn_opcodes_h_l2092_c41_38a4
and2_uxn_opcodes_h_l2092_c41_38a4 : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2092_c41_38a4_phase,
and2_uxn_opcodes_h_l2092_c41_38a4_ins,
and2_uxn_opcodes_h_l2092_c41_38a4_pc,
and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read,
and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read,
and2_uxn_opcodes_h_l2092_c41_38a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0
opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond,
opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output);

-- printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf
printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf : entity work.printf_uxn_opcodes_h_l2093_c28_73bf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2094_c7_2117
opc_result_MUX_uxn_opcodes_h_l2094_c7_2117 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond,
opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue,
opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse,
opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output);

-- ora2_uxn_opcodes_h_l2094_c41_01be
ora2_uxn_opcodes_h_l2094_c41_01be : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2094_c41_01be_phase,
ora2_uxn_opcodes_h_l2094_c41_01be_ins,
ora2_uxn_opcodes_h_l2094_c41_01be_pc,
ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read,
ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read,
ora2_uxn_opcodes_h_l2094_c41_01be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left,
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right,
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2095_c7_af52
opc_result_MUX_uxn_opcodes_h_l2095_c7_af52 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond,
opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue,
opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse,
opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output);

-- eor_uxn_opcodes_h_l2095_c41_1cca
eor_uxn_opcodes_h_l2095_c41_1cca : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2095_c41_1cca_phase,
eor_uxn_opcodes_h_l2095_c41_1cca_ins,
eor_uxn_opcodes_h_l2095_c41_1cca_pc,
eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read,
eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read,
eor_uxn_opcodes_h_l2095_c41_1cca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031
BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left,
BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right,
BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63
opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond,
opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue,
opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse,
opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output);

-- eor2_uxn_opcodes_h_l2096_c41_f53c
eor2_uxn_opcodes_h_l2096_c41_f53c : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2096_c41_f53c_phase,
eor2_uxn_opcodes_h_l2096_c41_f53c_ins,
eor2_uxn_opcodes_h_l2096_c41_f53c_pc,
eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read,
eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read,
eor2_uxn_opcodes_h_l2096_c41_f53c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left,
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right,
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2097_c7_454b
opc_result_MUX_uxn_opcodes_h_l2097_c7_454b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond,
opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output);

-- sft_uxn_opcodes_h_l2097_c41_0817
sft_uxn_opcodes_h_l2097_c41_0817 : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2097_c41_0817_phase,
sft_uxn_opcodes_h_l2097_c41_0817_ins,
sft_uxn_opcodes_h_l2097_c41_0817_pc,
sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read,
sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read,
sft_uxn_opcodes_h_l2097_c41_0817_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2098_c7_540a
opc_result_MUX_uxn_opcodes_h_l2098_c7_540a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond,
opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output);

-- sft2_uxn_opcodes_h_l2098_c41_7dc2
sft2_uxn_opcodes_h_l2098_c41_7dc2 : entity work.sft2_0CLK_51ffd248 port map (
clk,
sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2098_c41_7dc2_phase,
sft2_uxn_opcodes_h_l2098_c41_7dc2_ins,
sft2_uxn_opcodes_h_l2098_c41_7dc2_pc,
sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read,
sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read,
sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output);

-- printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1
printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1 : entity work.printf_uxn_opcodes_h_l2099_c9_8ae1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0);

-- sp0_MUX_uxn_opcodes_h_l2101_c2_81c7
sp0_MUX_uxn_opcodes_h_l2101_c2_81c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond,
sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue,
sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse,
sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output);

-- sp1_MUX_uxn_opcodes_h_l2101_c2_81c7
sp1_MUX_uxn_opcodes_h_l2101_c2_81c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond,
sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue,
sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse,
sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output);

-- sp0_MUX_uxn_opcodes_h_l2102_c3_91eb
sp0_MUX_uxn_opcodes_h_l2102_c3_91eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond,
sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue,
sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse,
sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output);

-- sp1_MUX_uxn_opcodes_h_l2102_c3_91eb
sp1_MUX_uxn_opcodes_h_l2102_c3_91eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond,
sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue,
sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse,
sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c
BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left,
BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right,
BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5
BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output);

-- MUX_uxn_opcodes_h_l2111_c19_5862
MUX_uxn_opcodes_h_l2111_c19_5862 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2111_c19_5862_cond,
MUX_uxn_opcodes_h_l2111_c19_5862_iftrue,
MUX_uxn_opcodes_h_l2111_c19_5862_iffalse,
MUX_uxn_opcodes_h_l2111_c19_5862_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d
BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left,
BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right,
BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed
stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond,
stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output);

-- device_ram_update_uxn_opcodes_h_l2134_c26_32bd
device_ram_update_uxn_opcodes_h_l2134_c26_32bd : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable,
device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output);



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
 sp,
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
 BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output,
 CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output,
 MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output,
 MUX_uxn_opcodes_h_l2025_c18_7b82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output,
 opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output,
 opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output,
 jci_uxn_opcodes_h_l2030_c41_6a65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output,
 jmi_uxn_opcodes_h_l2031_c41_eb92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output,
 opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output,
 jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output,
 lit_uxn_opcodes_h_l2033_c41_4bfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output,
 lit2_uxn_opcodes_h_l2034_c41_723f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output,
 opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output,
 lit_uxn_opcodes_h_l2035_c41_d154_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output,
 lit2_uxn_opcodes_h_l2036_c41_efe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output,
 inc_uxn_opcodes_h_l2037_c41_90d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output,
 opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output,
 inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output,
 opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output,
 pop_uxn_opcodes_h_l2039_c41_e2fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output,
 pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output,
 opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output,
 nip_uxn_opcodes_h_l2041_c41_1715_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output,
 nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output,
 swp_uxn_opcodes_h_l2043_c41_8ffe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output,
 swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output,
 opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output,
 rot2_uxn_opcodes_h_l2046_c41_a21c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output,
 opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output,
 opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output,
 dup2_uxn_opcodes_h_l2048_c41_6db9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output,
 opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output,
 opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output,
 ovr2_uxn_opcodes_h_l2050_c41_41de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output,
 opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output,
 equ_uxn_opcodes_h_l2051_c41_b6da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output,
 opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output,
 equ2_uxn_opcodes_h_l2052_c41_4c29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output,
 neq_uxn_opcodes_h_l2053_c41_5f3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output,
 neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output,
 opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output,
 gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output,
 opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output,
 opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output,
 lth2_uxn_opcodes_h_l2058_c41_61ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output,
 jmp2_uxn_opcodes_h_l2060_c41_174a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output,
 opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output,
 opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output,
 sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output,
 opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output,
 opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output,
 lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output,
 opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output,
 sta2_uxn_opcodes_h_l2078_c41_78dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output,
 deo_uxn_opcodes_h_l2081_c41_6ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output,
 deo2_uxn_opcodes_h_l2082_c41_682f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output,
 opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output,
 add2_uxn_opcodes_h_l2084_c41_1895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output,
 sub2_uxn_opcodes_h_l2086_c41_472e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output,
 opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output,
 opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output,
 mul2_uxn_opcodes_h_l2088_c41_071c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output,
 div2_uxn_opcodes_h_l2090_c41_c832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output,
 opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output,
 and2_uxn_opcodes_h_l2092_c41_38a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output,
 opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output,
 opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output,
 ora2_uxn_opcodes_h_l2094_c41_01be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output,
 opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output,
 eor_uxn_opcodes_h_l2095_c41_1cca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output,
 eor2_uxn_opcodes_h_l2096_c41_f53c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output,
 sft_uxn_opcodes_h_l2097_c41_0817_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output,
 sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output,
 sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output,
 sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output,
 sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output,
 sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output,
 MUX_uxn_opcodes_h_l2111_c19_5862_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output,
 stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output,
 stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output,
 device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2024_c2_12e6 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c30_ca3b_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c57_8194_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2029_c2_66e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2030_c41_6a65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2034_c41_723f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2035_c41_d154_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_pc : unsigned(15 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2037_c41_90d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_pc : unsigned(15 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_pc : unsigned(15 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_pc : unsigned(15 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_pc : unsigned(15 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2041_c41_1715_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_pc : unsigned(15 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_pc : unsigned(15 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_pc : unsigned(15 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9c9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_pc : unsigned(15 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_e769_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_pc : unsigned(15 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_3896_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_pc : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_pc : unsigned(15 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2051_c41_b6da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_pc : unsigned(15 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_pc : unsigned(15 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_pc : unsigned(15 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_cebf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_pc : unsigned(15 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_9b99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_pc : unsigned(15 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2059_c7_5c44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_pc : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_fdfd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2062_c7_8488_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_d7f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2064_c7_d7b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_5320_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_pc : unsigned(15 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_afd9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_b47c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e83b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2070_c7_48a1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_f77d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_9271_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2073_c7_3bd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2074_c7_6b7c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2075_c7_eaf3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_pc : unsigned(15 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2077_c7_67df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_pc : unsigned(15 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2079_c7_b919_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2080_c7_0e7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_pc : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_pc : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2082_c41_682f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2083_c7_7b0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_pc : unsigned(15 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2084_c41_1895_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2085_c7_5759_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_pc : unsigned(15 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2086_c41_472e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2087_c7_ecca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_pc : unsigned(15 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2088_c41_071c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2089_c7_be70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_pc : unsigned(15 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2090_c41_c832_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2091_c7_5f80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_pc : unsigned(15 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2092_c41_38a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2093_c7_18a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_pc : unsigned(15 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2094_c41_01be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_pc : unsigned(15 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2095_c41_1cca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_pc : unsigned(15 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_pc : unsigned(15 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2097_c41_0817_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_pc : unsigned(15 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_c6_445c_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2105_c4_da78 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2103_c4_ef9a : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2109_c18_ecee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_c19_1ae9_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2111_c2_b874 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2111_c19_5862_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2111_c19_5862_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2111_c82_6429_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2112_c22_2b90_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2115_c3_d50e : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2124_c3_2a3b : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l2134_c2_d952 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2136_c3_6977_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2137_c3_5327_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2140_c3_ec76_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2143_c34_cad7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2144_c23_0446_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2145_c32_c798_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2146_c33_be9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2147_c29_3ae5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2148_c30_04be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2149_c34_1499_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2150_c33_5568_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2151_c31_329d_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2152_c32_4d29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2102_l2114_l2111_DUPLICATE_4bc4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2105_DUPLICATE_a1ca_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2139_l2135_DUPLICATE_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2154_l2007_DUPLICATE_6ce7_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_sp : unsigned(7 downto 0);
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
  REG_VAR_sp := sp;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right := to_unsigned(17, 5);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse := to_unsigned(0, 1);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right := to_unsigned(41, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right := to_unsigned(22, 5);
     VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right := to_unsigned(18, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right := to_unsigned(2, 2);
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right := to_unsigned(3584, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right := to_unsigned(1536, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right := to_unsigned(2560, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right := to_unsigned(33, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right := to_unsigned(64, 7);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right := to_unsigned(60, 6);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse := opc_result;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_pc := VAR_pc;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_pc := VAR_pc;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_pc := VAR_pc;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_pc := VAR_pc;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_pc := VAR_pc;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_pc := VAR_pc;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_pc := VAR_pc;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_pc := VAR_pc;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_pc := VAR_pc;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_pc := VAR_pc;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_pc := VAR_pc;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_pc := VAR_pc;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_pc := VAR_pc;
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_pc := VAR_pc;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_pc := VAR_pc;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_pc := VAR_pc;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_pc := VAR_pc;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_pc := VAR_pc;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_pc := VAR_pc;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_pc := VAR_pc;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_pc := VAR_pc;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_pc := VAR_pc;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_pc := VAR_pc;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_pc := VAR_pc;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_pc := VAR_pc;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_pc := VAR_pc;
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_pc := VAR_pc;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_pc := VAR_pc;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_pc := VAR_pc;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_pc := VAR_pc;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_pc := VAR_pc;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_pc := VAR_pc;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_pc := VAR_pc;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_phase := VAR_phase;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read := VAR_previous_ram_read;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read := VAR_previous_ram_read;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read := VAR_previous_ram_read;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read := VAR_previous_ram_read;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read := VAR_previous_ram_read;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read := VAR_previous_ram_read;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read := VAR_previous_ram_read;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read := VAR_previous_ram_read;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read := VAR_previous_ram_read;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read := VAR_previous_ram_read;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read := VAR_previous_ram_read;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read := VAR_previous_ram_read;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read := VAR_previous_ram_read;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read := VAR_previous_ram_read;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read := VAR_previous_ram_read;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read := VAR_previous_ram_read;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read := VAR_previous_ram_read;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read := VAR_previous_ram_read;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read := VAR_previous_ram_read;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read := VAR_previous_ram_read;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read := VAR_previous_ram_read;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read := VAR_previous_ram_read;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read := VAR_previous_ram_read;
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read := VAR_previous_ram_read;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read := VAR_previous_ram_read;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read := VAR_previous_ram_read;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read := VAR_previous_ram_read;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read := VAR_previous_ram_read;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read := VAR_previous_ram_read;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read := VAR_previous_ram_read;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read := VAR_previous_ram_read;
     REG_VAR_sp := sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read := stack_read_value;
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read := stack_read_value;
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read := stack_read_value;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read := stack_read_value;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2068_c7_b47c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_b47c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2047_c7_e769] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_e769_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2080_c7_0e7f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2080_c7_0e7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2061_c7_fdfd] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_fdfd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2065_c7_5320] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_5320_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2072_c7_9271] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_9271_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2069_c7_e83b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e83b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2074_c7_6b7c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2074_c7_6b7c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2045_c7_9c9e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9c9e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2091_c7_5f80] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2091_c7_5f80_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2067_c7_afd9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_afd9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2057_c7_9b99] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_9b99_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2085_c7_5759] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2085_c7_5759_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2059_c7_5c44] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2059_c7_5c44_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2073_c7_3bd0] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2073_c7_3bd0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2087_c7_ecca] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2087_c7_ecca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2029_c2_66e8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2029_c2_66e8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2049_c7_3896] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_3896_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2025_c18_6d24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_left;
     BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output := BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2024_c41_2f72] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_left;
     BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output := BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2024_c57_8194] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c57_8194_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2062_c7_8488] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2062_c7_8488_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2083_c7_7b0e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2083_c7_7b0e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2063_c7_d7f0] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_d7f0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2093_c7_18a0] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2093_c7_18a0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2077_c7_67df] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2077_c7_67df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2024_c10_4fd7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_left;
     BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output := BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2055_c7_cebf] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_cebf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2071_c7_f77d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_f77d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2075_c7_eaf3] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2075_c7_eaf3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2079_c7_b919] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2079_c7_b919_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2070_c7_48a1] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2070_c7_48a1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2089_c7_be70] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2089_c7_be70_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2064_c7_d7b3] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2064_c7_d7b3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c10_4fd7_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2025_c18_6d24_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c57_8194_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2029_c2_66e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2045_c7_9c9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2047_c7_e769_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2049_c7_3896_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2055_c7_cebf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2057_c7_9b99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2059_c7_5c44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2061_c7_fdfd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2062_c7_8488_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2063_c7_d7f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2064_c7_d7b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2065_c7_5320_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2067_c7_afd9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2068_c7_b47c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2069_c7_e83b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2070_c7_48a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2071_c7_f77d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2072_c7_9271_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2073_c7_3bd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2074_c7_6b7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2075_c7_eaf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2077_c7_67df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2079_c7_b919_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2080_c7_0e7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2083_c7_7b0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2085_c7_5759_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2087_c7_ecca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2089_c7_be70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2091_c7_5f80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2093_c7_18a0_return_output;
     -- CONST_SL_4[uxn_opcodes_h_l2024_c57_adb4] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output := CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2024_c30_ca3b] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c30_ca3b_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2024_c41_2f72_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2024_c10_4e61] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_left;
     BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output := BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2025_c18_221e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_left;
     BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output := BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2024_c10_4e61_return_output;
     VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2025_c18_221e_return_output;
     VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2024_c30_ca3b_return_output;
     VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2024_c57_adb4_return_output;
     -- MUX[uxn_opcodes_h_l2024_c10_c5c2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2024_c10_c5c2_cond <= VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_cond;
     MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue <= VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iftrue;
     MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse <= VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output := MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output;

     -- MUX[uxn_opcodes_h_l2025_c18_7b82] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2025_c18_7b82_cond <= VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_cond;
     MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue <= VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iftrue;
     MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse <= VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_return_output := MUX_uxn_opcodes_h_l2025_c18_7b82_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2024_c2_12e6 := VAR_MUX_uxn_opcodes_h_l2024_c10_c5c2_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left := VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l2025_c18_7b82_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2024_c2_12e6;
     VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0 := resize(VAR_opc_uxn_opcodes_h_l2024_c2_12e6, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2085_c11_eda9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_2ef4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_b7c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_2221] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_5ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_67cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_5eb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2087_c11_995d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_e564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2095_c11_472f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_ba2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_a40d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_80f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_2ce5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_87c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_c1be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_47b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c6_c692] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2083_c11_887d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_b712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_c968] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_left;
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output := BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2091_c11_cfa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_3732] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_left;
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output := BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2049_c11_5968] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_left;
     BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output := BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_5020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_left;
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output := BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_86b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_07d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2097_c11_4875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_left;
     BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output := BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_57a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_2c14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2078_c11_c1e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_677b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_29da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2092_c11_66f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_3564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_left;
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output := BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_c8dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_1538] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_a0fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2036_c11_51c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_7256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_left;
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output := BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_9801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_left;
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output := BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_7b7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_01b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_a6af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2070_c11_238d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_7c49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_5139] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_left;
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output := BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_6586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_3281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_left;
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output := BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2086_c11_a3d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_c528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_41e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_8baf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_898f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_6fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_b161] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_left;
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output := BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_4945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_8300] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_d5c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_0d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_19f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_e3ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_5b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_63e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output;

     -- printf_uxn_opcodes_h_l2027_c2_71d9[uxn_opcodes_h_l2027_c2_71d9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0 <= VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg0;
     printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1 <= VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg1;
     printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2 <= VAR_printf_uxn_opcodes_h_l2027_c2_71d9_uxn_opcodes_h_l2027_c2_71d9_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_fcb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_93f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_c996] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2096_c11_f031] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_left;
     BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output := BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_34c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_e628] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_left;
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output := BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c6_c692_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_41e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_3732_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_a0fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_2c14_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_1538_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_c1be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2036_c11_51c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_7c49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_3564_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_a40d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_19f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_ba2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_b712_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_01b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_93f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_29da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_67cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_a6af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_c528_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2049_c11_5968_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_c996_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_6586_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_07d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4945_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_e628_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_6fe2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_2ce5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_b7c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_63e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_898f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_e3ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_0d17_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_677b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_80f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_47b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_2ef4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_8300_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_c8dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_2221_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_8baf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2070_c11_238d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_5b2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_b161_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_e564_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_5020_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_7b7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_fcb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_7256_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2078_c11_c1e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_57a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_86b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_5ee8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_c968_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_887d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_3281_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_eda9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_a3d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2087_c11_995d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_5139_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_34c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_d5c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c11_cfa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_66f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_5eb6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_9801_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_472f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2096_c11_f031_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_4875_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_87c3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c7_5a09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2030_c1_2d0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c7_9689] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c7_9689_return_output;
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2030_c1_2d0c_return_output;
     -- jci[uxn_opcodes_h_l2030_c41_6a65] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2030_c41_6a65_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2030_c41_6a65_phase <= VAR_jci_uxn_opcodes_h_l2030_c41_6a65_phase;
     jci_uxn_opcodes_h_l2030_c41_6a65_pc <= VAR_jci_uxn_opcodes_h_l2030_c41_6a65_pc;
     jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_stack_read;
     jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2030_c41_6a65_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2030_c41_6a65_return_output := jci_uxn_opcodes_h_l2030_c41_6a65_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c7_f82b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_e046] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output;
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_e046_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue := VAR_jci_uxn_opcodes_h_l2030_c41_6a65_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c7_fd41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output;

     -- jmi[uxn_opcodes_h_l2031_c41_eb92] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2031_c41_eb92_phase <= VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_phase;
     jmi_uxn_opcodes_h_l2031_c41_eb92_pc <= VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_pc;
     jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read <= VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_stack_read;
     jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_return_output := jmi_uxn_opcodes_h_l2031_c41_eb92_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_9c85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output;
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_9c85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue := VAR_jmi_uxn_opcodes_h_l2031_c41_eb92_return_output;
     -- jsi[uxn_opcodes_h_l2032_c41_9bc2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2032_c41_9bc2_phase <= VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_phase;
     jsi_uxn_opcodes_h_l2032_c41_9bc2_pc <= VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_pc;
     jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read <= VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_stack_read;
     jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output := jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2033_c1_5d94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c7_66f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output;
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2033_c1_5d94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue := VAR_jsi_uxn_opcodes_h_l2032_c41_9bc2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2034_c1_13c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c7_b7e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output;

     -- lit[uxn_opcodes_h_l2033_c41_4bfd] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2033_c41_4bfd_phase <= VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_phase;
     lit_uxn_opcodes_h_l2033_c41_4bfd_pc <= VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_pc;
     lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_stack_read;
     lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_return_output := lit_uxn_opcodes_h_l2033_c41_4bfd_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output;
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2034_c1_13c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue := VAR_lit_uxn_opcodes_h_l2033_c41_4bfd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2035_c1_adb5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c7_2334] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output;

     -- lit2[uxn_opcodes_h_l2034_c41_723f] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2034_c41_723f_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2034_c41_723f_phase <= VAR_lit2_uxn_opcodes_h_l2034_c41_723f_phase;
     lit2_uxn_opcodes_h_l2034_c41_723f_pc <= VAR_lit2_uxn_opcodes_h_l2034_c41_723f_pc;
     lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_stack_read;
     lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2034_c41_723f_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2034_c41_723f_return_output := lit2_uxn_opcodes_h_l2034_c41_723f_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c7_2334_return_output;
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2035_c1_adb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue := VAR_lit2_uxn_opcodes_h_l2034_c41_723f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2036_c1_9332] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output;

     -- lit[uxn_opcodes_h_l2035_c41_d154] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2035_c41_d154_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2035_c41_d154_phase <= VAR_lit_uxn_opcodes_h_l2035_c41_d154_phase;
     lit_uxn_opcodes_h_l2035_c41_d154_pc <= VAR_lit_uxn_opcodes_h_l2035_c41_d154_pc;
     lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read <= VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_stack_read;
     lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2035_c41_d154_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2035_c41_d154_return_output := lit_uxn_opcodes_h_l2035_c41_d154_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c7_8cb4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output;
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2036_c1_9332_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue := VAR_lit_uxn_opcodes_h_l2035_c41_d154_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c7_bc6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output;

     -- lit2[uxn_opcodes_h_l2036_c41_efe1] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2036_c41_efe1_phase <= VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_phase;
     lit2_uxn_opcodes_h_l2036_c41_efe1_pc <= VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_pc;
     lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_stack_read;
     lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_return_output := lit2_uxn_opcodes_h_l2036_c41_efe1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2037_c1_f899] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output;
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2037_c1_f899_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue := VAR_lit2_uxn_opcodes_h_l2036_c41_efe1_return_output;
     -- inc[uxn_opcodes_h_l2037_c41_90d9] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2037_c41_90d9_phase <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_phase;
     inc_uxn_opcodes_h_l2037_c41_90d9_ins <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_ins;
     inc_uxn_opcodes_h_l2037_c41_90d9_pc <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_pc;
     inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_stack_read;
     inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read <= VAR_inc_uxn_opcodes_h_l2037_c41_90d9_previous_ram_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2037_c41_90d9_return_output := inc_uxn_opcodes_h_l2037_c41_90d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_97aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c7_d030] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c7_d030_return_output;
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_97aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue := VAR_inc_uxn_opcodes_h_l2037_c41_90d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2039_c1_2ab0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output;

     -- inc2[uxn_opcodes_h_l2038_c41_7c4c] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2038_c41_7c4c_phase <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_phase;
     inc2_uxn_opcodes_h_l2038_c41_7c4c_ins <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_ins;
     inc2_uxn_opcodes_h_l2038_c41_7c4c_pc <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_pc;
     inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_stack_read;
     inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read <= VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_previous_ram_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output := inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c7_9649] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c7_9649_return_output;
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2039_c1_2ab0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue := VAR_inc2_uxn_opcodes_h_l2038_c41_7c4c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c7_7a6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_4aaf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output;

     -- pop[uxn_opcodes_h_l2039_c41_e2fe] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2039_c41_e2fe_phase <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_phase;
     pop_uxn_opcodes_h_l2039_c41_e2fe_ins <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_ins;
     pop_uxn_opcodes_h_l2039_c41_e2fe_pc <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_pc;
     pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_stack_read;
     pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read <= VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_previous_ram_read;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_return_output := pop_uxn_opcodes_h_l2039_c41_e2fe_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output;
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_4aaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue := VAR_pop_uxn_opcodes_h_l2039_c41_e2fe_return_output;
     -- pop2[uxn_opcodes_h_l2040_c41_cd0b] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2040_c41_cd0b_phase <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_phase;
     pop2_uxn_opcodes_h_l2040_c41_cd0b_ins <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_ins;
     pop2_uxn_opcodes_h_l2040_c41_cd0b_pc <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_pc;
     pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_stack_read;
     pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read <= VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_previous_ram_read;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output := pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2041_c1_c382] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c7_0ead] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output;
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2041_c1_c382_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue := VAR_pop2_uxn_opcodes_h_l2040_c41_cd0b_return_output;
     -- nip[uxn_opcodes_h_l2041_c41_1715] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2041_c41_1715_phase <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_phase;
     nip_uxn_opcodes_h_l2041_c41_1715_ins <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_ins;
     nip_uxn_opcodes_h_l2041_c41_1715_pc <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_pc;
     nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_stack_read;
     nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read <= VAR_nip_uxn_opcodes_h_l2041_c41_1715_previous_ram_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2041_c41_1715_return_output := nip_uxn_opcodes_h_l2041_c41_1715_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c7_66fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2042_c1_05c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output;
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2042_c1_05c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue := VAR_nip_uxn_opcodes_h_l2041_c41_1715_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_80ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c7_ef49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output;

     -- nip2[uxn_opcodes_h_l2042_c41_1b1d] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2042_c41_1b1d_phase <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_phase;
     nip2_uxn_opcodes_h_l2042_c41_1b1d_ins <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_ins;
     nip2_uxn_opcodes_h_l2042_c41_1b1d_pc <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_pc;
     nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_stack_read;
     nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read <= VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_previous_ram_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output := nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output;
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_80ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue := VAR_nip2_uxn_opcodes_h_l2042_c41_1b1d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2044_c1_5071] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c7_9c9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output;

     -- swp[uxn_opcodes_h_l2043_c41_8ffe] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2043_c41_8ffe_phase <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_phase;
     swp_uxn_opcodes_h_l2043_c41_8ffe_ins <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_ins;
     swp_uxn_opcodes_h_l2043_c41_8ffe_pc <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_pc;
     swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_stack_read;
     swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read <= VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_previous_ram_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_return_output := swp_uxn_opcodes_h_l2043_c41_8ffe_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output;
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2044_c1_5071_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue := VAR_swp_uxn_opcodes_h_l2043_c41_8ffe_return_output;
     -- swp2[uxn_opcodes_h_l2044_c41_0bb5] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2044_c41_0bb5_phase <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_phase;
     swp2_uxn_opcodes_h_l2044_c41_0bb5_ins <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_ins;
     swp2_uxn_opcodes_h_l2044_c41_0bb5_pc <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_pc;
     swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_stack_read;
     swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read <= VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_previous_ram_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output := swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_d3d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c7_2e5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output;
     VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_d3d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue := VAR_swp2_uxn_opcodes_h_l2044_c41_0bb5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c7_e769] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output;

     -- printf_uxn_opcodes_h_l2045_c28_7453[uxn_opcodes_h_l2045_c28_7453] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0 <= VAR_printf_uxn_opcodes_h_l2045_c28_7453_uxn_opcodes_h_l2045_c28_7453_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2046_c1_0df0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c7_e769_return_output;
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2046_c1_0df0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c7_1597] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_fa62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output;

     -- rot2[uxn_opcodes_h_l2046_c41_a21c] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2046_c41_a21c_phase <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_phase;
     rot2_uxn_opcodes_h_l2046_c41_a21c_ins <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_ins;
     rot2_uxn_opcodes_h_l2046_c41_a21c_pc <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_pc;
     rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_stack_read;
     rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read <= VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_previous_ram_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_return_output := rot2_uxn_opcodes_h_l2046_c41_a21c_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c7_1597_return_output;
     VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_fa62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue := VAR_rot2_uxn_opcodes_h_l2046_c41_a21c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_5a36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c7_3896] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output;

     -- printf_uxn_opcodes_h_l2047_c28_5422[uxn_opcodes_h_l2047_c28_5422] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0 <= VAR_printf_uxn_opcodes_h_l2047_c28_5422_uxn_opcodes_h_l2047_c28_5422_arg0;
     -- Outputs

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c7_3896_return_output;
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_5a36_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c7_3c78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2049_c1_dc9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output;

     -- dup2[uxn_opcodes_h_l2048_c41_6db9] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2048_c41_6db9_phase <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_phase;
     dup2_uxn_opcodes_h_l2048_c41_6db9_ins <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_ins;
     dup2_uxn_opcodes_h_l2048_c41_6db9_pc <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_pc;
     dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_stack_read;
     dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read <= VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_previous_ram_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_return_output := dup2_uxn_opcodes_h_l2048_c41_6db9_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output;
     VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2049_c1_dc9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue := VAR_dup2_uxn_opcodes_h_l2048_c41_6db9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c7_3978] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2050_c1_8d3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output;

     -- printf_uxn_opcodes_h_l2049_c28_ead0[uxn_opcodes_h_l2049_c28_ead0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0 <= VAR_printf_uxn_opcodes_h_l2049_c28_ead0_uxn_opcodes_h_l2049_c28_ead0_arg0;
     -- Outputs

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c7_3978_return_output;
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2050_c1_8d3b_return_output;
     -- ovr2[uxn_opcodes_h_l2050_c41_41de] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2050_c41_41de_phase <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_phase;
     ovr2_uxn_opcodes_h_l2050_c41_41de_ins <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_ins;
     ovr2_uxn_opcodes_h_l2050_c41_41de_pc <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_pc;
     ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_stack_read;
     ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read <= VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_previous_ram_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_return_output := ovr2_uxn_opcodes_h_l2050_c41_41de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2051_c1_7f45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c7_54da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c7_54da_return_output;
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2051_c1_7f45_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue := VAR_ovr2_uxn_opcodes_h_l2050_c41_41de_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2052_c1_f97e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c7_5073] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output;

     -- equ[uxn_opcodes_h_l2051_c41_b6da] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2051_c41_b6da_phase <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_phase;
     equ_uxn_opcodes_h_l2051_c41_b6da_ins <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_ins;
     equ_uxn_opcodes_h_l2051_c41_b6da_pc <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_pc;
     equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_stack_read;
     equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read <= VAR_equ_uxn_opcodes_h_l2051_c41_b6da_previous_ram_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2051_c41_b6da_return_output := equ_uxn_opcodes_h_l2051_c41_b6da_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c7_5073_return_output;
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2052_c1_f97e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue := VAR_equ_uxn_opcodes_h_l2051_c41_b6da_return_output;
     -- equ2[uxn_opcodes_h_l2052_c41_4c29] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2052_c41_4c29_phase <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_phase;
     equ2_uxn_opcodes_h_l2052_c41_4c29_ins <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_ins;
     equ2_uxn_opcodes_h_l2052_c41_4c29_pc <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_pc;
     equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_stack_read;
     equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read <= VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_previous_ram_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_return_output := equ2_uxn_opcodes_h_l2052_c41_4c29_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c7_dc0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2053_c1_5a5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output;
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2053_c1_5a5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue := VAR_equ2_uxn_opcodes_h_l2052_c41_4c29_return_output;
     -- neq[uxn_opcodes_h_l2053_c41_5f3d] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2053_c41_5f3d_phase <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_phase;
     neq_uxn_opcodes_h_l2053_c41_5f3d_ins <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_ins;
     neq_uxn_opcodes_h_l2053_c41_5f3d_pc <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_pc;
     neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_stack_read;
     neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read <= VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_previous_ram_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_return_output := neq_uxn_opcodes_h_l2053_c41_5f3d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c7_cebf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2054_c1_5499] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output;
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2054_c1_5499_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue := VAR_neq_uxn_opcodes_h_l2053_c41_5f3d_return_output;
     -- neq2[uxn_opcodes_h_l2054_c41_f2d2] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2054_c41_f2d2_phase <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_phase;
     neq2_uxn_opcodes_h_l2054_c41_f2d2_ins <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_ins;
     neq2_uxn_opcodes_h_l2054_c41_f2d2_pc <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_pc;
     neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_stack_read;
     neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read <= VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_previous_ram_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output := neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c7_c40f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_591c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output;
     VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_591c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue := VAR_neq2_uxn_opcodes_h_l2054_c41_f2d2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c7_9b99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2056_c1_fd91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output;

     -- printf_uxn_opcodes_h_l2055_c28_5534[uxn_opcodes_h_l2055_c28_5534] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0 <= VAR_printf_uxn_opcodes_h_l2055_c28_5534_uxn_opcodes_h_l2055_c28_5534_arg0;
     -- Outputs

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output;
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2056_c1_fd91_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2057_c1_a6b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output;

     -- gth2[uxn_opcodes_h_l2056_c41_0b3e] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2056_c41_0b3e_phase <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_phase;
     gth2_uxn_opcodes_h_l2056_c41_0b3e_ins <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_ins;
     gth2_uxn_opcodes_h_l2056_c41_0b3e_pc <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_pc;
     gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_stack_read;
     gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read <= VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_previous_ram_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output := gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c7_0e33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output;
     VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2057_c1_a6b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue := VAR_gth2_uxn_opcodes_h_l2056_c41_0b3e_return_output;
     -- printf_uxn_opcodes_h_l2057_c28_8a36[uxn_opcodes_h_l2057_c28_8a36] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0 <= VAR_printf_uxn_opcodes_h_l2057_c28_8a36_uxn_opcodes_h_l2057_c28_8a36_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2058_c1_b62d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c7_5c44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output;
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2058_c1_b62d_return_output;
     -- lth2[uxn_opcodes_h_l2058_c41_61ac] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2058_c41_61ac_phase <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_phase;
     lth2_uxn_opcodes_h_l2058_c41_61ac_ins <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_ins;
     lth2_uxn_opcodes_h_l2058_c41_61ac_pc <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_pc;
     lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_stack_read;
     lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read <= VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_previous_ram_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_return_output := lth2_uxn_opcodes_h_l2058_c41_61ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2059_c1_1603] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c7_cff5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output;
     VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2059_c1_1603_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue := VAR_lth2_uxn_opcodes_h_l2058_c41_61ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2060_c1_4dd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output;

     -- printf_uxn_opcodes_h_l2059_c28_19d6[uxn_opcodes_h_l2059_c28_19d6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0 <= VAR_printf_uxn_opcodes_h_l2059_c28_19d6_uxn_opcodes_h_l2059_c28_19d6_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c7_fdfd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output;
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2060_c1_4dd7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2061_c1_328a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output;

     -- jmp2[uxn_opcodes_h_l2060_c41_174a] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2060_c41_174a_phase <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_phase;
     jmp2_uxn_opcodes_h_l2060_c41_174a_ins <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_ins;
     jmp2_uxn_opcodes_h_l2060_c41_174a_pc <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_pc;
     jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_stack_read;
     jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read <= VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_previous_ram_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_return_output := jmp2_uxn_opcodes_h_l2060_c41_174a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c7_8488] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c7_8488_return_output;
     VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2061_c1_328a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue := VAR_jmp2_uxn_opcodes_h_l2060_c41_174a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c7_d7f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2062_c1_f146] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output;

     -- printf_uxn_opcodes_h_l2061_c28_bb9f[uxn_opcodes_h_l2061_c28_bb9f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0 <= VAR_printf_uxn_opcodes_h_l2061_c28_bb9f_uxn_opcodes_h_l2061_c28_bb9f_arg0;
     -- Outputs

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output;
     VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2062_c1_f146_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2063_c1_52a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c7_d7b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output;

     -- printf_uxn_opcodes_h_l2062_c28_e3cf[uxn_opcodes_h_l2062_c28_e3cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0 <= VAR_printf_uxn_opcodes_h_l2062_c28_e3cf_uxn_opcodes_h_l2062_c28_e3cf_arg0;
     -- Outputs

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output;
     VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2063_c1_52a6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2064_c1_4712] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output;

     -- printf_uxn_opcodes_h_l2063_c28_329a[uxn_opcodes_h_l2063_c28_329a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0 <= VAR_printf_uxn_opcodes_h_l2063_c28_329a_uxn_opcodes_h_l2063_c28_329a_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c7_5320] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c7_5320_return_output;
     VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2064_c1_4712_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2065_c1_99b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output;

     -- printf_uxn_opcodes_h_l2064_c28_886e[uxn_opcodes_h_l2064_c28_886e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0 <= VAR_printf_uxn_opcodes_h_l2064_c28_886e_uxn_opcodes_h_l2064_c28_886e_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c7_32b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output;
     VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2065_c1_99b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2066_c1_6ffb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c7_afd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output;

     -- printf_uxn_opcodes_h_l2065_c28_b4ea[uxn_opcodes_h_l2065_c28_b4ea] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0 <= VAR_printf_uxn_opcodes_h_l2065_c28_b4ea_uxn_opcodes_h_l2065_c28_b4ea_arg0;
     -- Outputs

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output;
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2066_c1_6ffb_return_output;
     -- sth2[uxn_opcodes_h_l2066_c41_1a4a] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2066_c41_1a4a_phase <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_phase;
     sth2_uxn_opcodes_h_l2066_c41_1a4a_ins <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_ins;
     sth2_uxn_opcodes_h_l2066_c41_1a4a_pc <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_pc;
     sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_stack_read;
     sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read <= VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_previous_ram_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output := sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c7_b47c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2067_c1_89c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output;
     VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2067_c1_89c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue := VAR_sth2_uxn_opcodes_h_l2066_c41_1a4a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c7_e83b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2068_c1_1b5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output;

     -- printf_uxn_opcodes_h_l2067_c28_ea11[uxn_opcodes_h_l2067_c28_ea11] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0 <= VAR_printf_uxn_opcodes_h_l2067_c28_ea11_uxn_opcodes_h_l2067_c28_ea11_arg0;
     -- Outputs

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output;
     VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2068_c1_1b5a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2069_c1_4c78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c7_48a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output;

     -- printf_uxn_opcodes_h_l2068_c28_24a1[uxn_opcodes_h_l2068_c28_24a1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0 <= VAR_printf_uxn_opcodes_h_l2068_c28_24a1_uxn_opcodes_h_l2068_c28_24a1_arg0;
     -- Outputs

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output;
     VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2069_c1_4c78_return_output;
     -- printf_uxn_opcodes_h_l2069_c28_09a2[uxn_opcodes_h_l2069_c28_09a2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0 <= VAR_printf_uxn_opcodes_h_l2069_c28_09a2_uxn_opcodes_h_l2069_c28_09a2_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c7_f77d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2070_c1_1933] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output;
     VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2070_c1_1933_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_97b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c7_9271] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output;

     -- printf_uxn_opcodes_h_l2070_c28_4c44[uxn_opcodes_h_l2070_c28_4c44] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0 <= VAR_printf_uxn_opcodes_h_l2070_c28_4c44_uxn_opcodes_h_l2070_c28_4c44_arg0;
     -- Outputs

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c7_9271_return_output;
     VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_97b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2072_c1_30b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c7_3bd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output;

     -- printf_uxn_opcodes_h_l2071_c28_8e5c[uxn_opcodes_h_l2071_c28_8e5c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0 <= VAR_printf_uxn_opcodes_h_l2071_c28_8e5c_uxn_opcodes_h_l2071_c28_8e5c_arg0;
     -- Outputs

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output;
     VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2072_c1_30b1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c7_6b7c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output;

     -- printf_uxn_opcodes_h_l2072_c28_6ce8[uxn_opcodes_h_l2072_c28_6ce8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0 <= VAR_printf_uxn_opcodes_h_l2072_c28_6ce8_uxn_opcodes_h_l2072_c28_6ce8_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2073_c1_d48c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output;
     VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2073_c1_d48c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2074_c1_b252] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output;

     -- printf_uxn_opcodes_h_l2073_c28_9bb7[uxn_opcodes_h_l2073_c28_9bb7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0 <= VAR_printf_uxn_opcodes_h_l2073_c28_9bb7_uxn_opcodes_h_l2073_c28_9bb7_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c7_eaf3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output;
     VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2074_c1_b252_return_output;
     -- printf_uxn_opcodes_h_l2074_c28_ce73[uxn_opcodes_h_l2074_c28_ce73] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0 <= VAR_printf_uxn_opcodes_h_l2074_c28_ce73_uxn_opcodes_h_l2074_c28_ce73_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c7_aff5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2075_c1_29dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output;
     VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2075_c1_29dc_return_output;
     -- printf_uxn_opcodes_h_l2075_c28_8d26[uxn_opcodes_h_l2075_c28_8d26] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0 <= VAR_printf_uxn_opcodes_h_l2075_c28_8d26_uxn_opcodes_h_l2075_c28_8d26_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c7_67df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2076_c1_382c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c7_67df_return_output;
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2076_c1_382c_return_output;
     -- lda2[uxn_opcodes_h_l2076_c41_5ff0] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2076_c41_5ff0_phase <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_phase;
     lda2_uxn_opcodes_h_l2076_c41_5ff0_ins <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_ins;
     lda2_uxn_opcodes_h_l2076_c41_5ff0_pc <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_pc;
     lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_stack_read;
     lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output := lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2078_c7_5a0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2077_c1_173e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output;
     VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2077_c1_173e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue := VAR_lda2_uxn_opcodes_h_l2076_c41_5ff0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2078_c1_c128] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output;

     -- printf_uxn_opcodes_h_l2077_c28_7679[uxn_opcodes_h_l2077_c28_7679] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0 <= VAR_printf_uxn_opcodes_h_l2077_c28_7679_uxn_opcodes_h_l2077_c28_7679_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2079_c7_b919] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c7_b919_return_output;
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2078_c1_c128_return_output;
     -- sta2[uxn_opcodes_h_l2078_c41_78dc] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2078_c41_78dc_phase <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_phase;
     sta2_uxn_opcodes_h_l2078_c41_78dc_ins <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_ins;
     sta2_uxn_opcodes_h_l2078_c41_78dc_pc <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_pc;
     sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_stack_read;
     sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read <= VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_previous_ram_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_return_output := sta2_uxn_opcodes_h_l2078_c41_78dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2080_c7_0e7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2079_c1_cd2a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output;
     VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2079_c1_cd2a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue := VAR_sta2_uxn_opcodes_h_l2078_c41_78dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2080_c1_26e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output;

     -- printf_uxn_opcodes_h_l2079_c28_bcbd[uxn_opcodes_h_l2079_c28_bcbd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0 <= VAR_printf_uxn_opcodes_h_l2079_c28_bcbd_uxn_opcodes_h_l2079_c28_bcbd_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c7_3da8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output;
     VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2080_c1_26e2_return_output;
     -- printf_uxn_opcodes_h_l2080_c28_5994[uxn_opcodes_h_l2080_c28_5994] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0 <= VAR_printf_uxn_opcodes_h_l2080_c28_5994_uxn_opcodes_h_l2080_c28_5994_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c1_212c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2082_c7_749c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c7_749c_return_output;
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_212c_return_output;
     -- deo[uxn_opcodes_h_l2081_c41_6ea8] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2081_c41_6ea8_phase <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_phase;
     deo_uxn_opcodes_h_l2081_c41_6ea8_ins <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_ins;
     deo_uxn_opcodes_h_l2081_c41_6ea8_pc <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_pc;
     deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_stack_read;
     deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_ram_read;
     deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_return_output := deo_uxn_opcodes_h_l2081_c41_6ea8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2083_c7_7b0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2082_c1_58d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output;
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2082_c1_58d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue := VAR_deo_uxn_opcodes_h_l2081_c41_6ea8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2084_c7_328d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2083_c1_5441] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output;

     -- deo2[uxn_opcodes_h_l2082_c41_682f] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2082_c41_682f_phase <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_phase;
     deo2_uxn_opcodes_h_l2082_c41_682f_ins <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_ins;
     deo2_uxn_opcodes_h_l2082_c41_682f_pc <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_pc;
     deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_stack_read;
     deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_ram_read;
     deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2082_c41_682f_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2082_c41_682f_return_output := deo2_uxn_opcodes_h_l2082_c41_682f_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c7_328d_return_output;
     VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2083_c1_5441_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue := VAR_deo2_uxn_opcodes_h_l2082_c41_682f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2084_c1_99ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c7_5759] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output;

     -- printf_uxn_opcodes_h_l2083_c28_fee7[uxn_opcodes_h_l2083_c28_fee7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0 <= VAR_printf_uxn_opcodes_h_l2083_c28_fee7_uxn_opcodes_h_l2083_c28_fee7_arg0;
     -- Outputs

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c7_5759_return_output;
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2084_c1_99ee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2086_c7_82e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c1_c5f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output;

     -- add2[uxn_opcodes_h_l2084_c41_1895] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2084_c41_1895_phase <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_phase;
     add2_uxn_opcodes_h_l2084_c41_1895_ins <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_ins;
     add2_uxn_opcodes_h_l2084_c41_1895_pc <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_pc;
     add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_stack_read;
     add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read <= VAR_add2_uxn_opcodes_h_l2084_c41_1895_previous_ram_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2084_c41_1895_return_output := add2_uxn_opcodes_h_l2084_c41_1895_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output;
     VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_c5f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue := VAR_add2_uxn_opcodes_h_l2084_c41_1895_return_output;
     -- printf_uxn_opcodes_h_l2085_c28_6d33[uxn_opcodes_h_l2085_c28_6d33] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0 <= VAR_printf_uxn_opcodes_h_l2085_c28_6d33_uxn_opcodes_h_l2085_c28_6d33_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2086_c1_9d0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2087_c7_ecca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output;
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2086_c1_9d0d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2087_c1_bbde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2088_c7_e550] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output;

     -- sub2[uxn_opcodes_h_l2086_c41_472e] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2086_c41_472e_phase <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_phase;
     sub2_uxn_opcodes_h_l2086_c41_472e_ins <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_ins;
     sub2_uxn_opcodes_h_l2086_c41_472e_pc <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_pc;
     sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_stack_read;
     sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read <= VAR_sub2_uxn_opcodes_h_l2086_c41_472e_previous_ram_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2086_c41_472e_return_output := sub2_uxn_opcodes_h_l2086_c41_472e_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c7_e550_return_output;
     VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2087_c1_bbde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue := VAR_sub2_uxn_opcodes_h_l2086_c41_472e_return_output;
     -- printf_uxn_opcodes_h_l2087_c28_342d[uxn_opcodes_h_l2087_c28_342d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0 <= VAR_printf_uxn_opcodes_h_l2087_c28_342d_uxn_opcodes_h_l2087_c28_342d_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2088_c1_6a36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2089_c7_be70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c7_be70_return_output;
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2088_c1_6a36_return_output;
     -- mul2[uxn_opcodes_h_l2088_c41_071c] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2088_c41_071c_phase <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_phase;
     mul2_uxn_opcodes_h_l2088_c41_071c_ins <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_ins;
     mul2_uxn_opcodes_h_l2088_c41_071c_pc <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_pc;
     mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_stack_read;
     mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read <= VAR_mul2_uxn_opcodes_h_l2088_c41_071c_previous_ram_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2088_c41_071c_return_output := mul2_uxn_opcodes_h_l2088_c41_071c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2089_c1_61e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2090_c7_8fca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output;
     VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2089_c1_61e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue := VAR_mul2_uxn_opcodes_h_l2088_c41_071c_return_output;
     -- printf_uxn_opcodes_h_l2089_c28_43bb[uxn_opcodes_h_l2089_c28_43bb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0 <= VAR_printf_uxn_opcodes_h_l2089_c28_43bb_uxn_opcodes_h_l2089_c28_43bb_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2091_c7_5f80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2090_c1_7c42] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output;
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2090_c1_7c42_return_output;
     -- div2[uxn_opcodes_h_l2090_c41_c832] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2090_c41_c832_phase <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_phase;
     div2_uxn_opcodes_h_l2090_c41_c832_ins <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_ins;
     div2_uxn_opcodes_h_l2090_c41_c832_pc <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_pc;
     div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_stack_read;
     div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read <= VAR_div2_uxn_opcodes_h_l2090_c41_c832_previous_ram_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2090_c41_c832_return_output := div2_uxn_opcodes_h_l2090_c41_c832_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2091_c1_9fa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c7_ea51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output;
     VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2091_c1_9fa1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue := VAR_div2_uxn_opcodes_h_l2090_c41_c832_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c7_18a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output;

     -- printf_uxn_opcodes_h_l2091_c28_cab2[uxn_opcodes_h_l2091_c28_cab2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0 <= VAR_printf_uxn_opcodes_h_l2091_c28_cab2_uxn_opcodes_h_l2091_c28_cab2_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2092_c1_31eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output;
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2092_c1_31eb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c1_a0f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output;

     -- and2[uxn_opcodes_h_l2092_c41_38a4] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2092_c41_38a4_phase <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_phase;
     and2_uxn_opcodes_h_l2092_c41_38a4_ins <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_ins;
     and2_uxn_opcodes_h_l2092_c41_38a4_pc <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_pc;
     and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_stack_read;
     and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read <= VAR_and2_uxn_opcodes_h_l2092_c41_38a4_previous_ram_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2092_c41_38a4_return_output := and2_uxn_opcodes_h_l2092_c41_38a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c7_2117] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c7_2117_return_output;
     VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a0f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue := VAR_and2_uxn_opcodes_h_l2092_c41_38a4_return_output;
     -- printf_uxn_opcodes_h_l2093_c28_73bf[uxn_opcodes_h_l2093_c28_73bf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0 <= VAR_printf_uxn_opcodes_h_l2093_c28_73bf_uxn_opcodes_h_l2093_c28_73bf_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c1_9a64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c7_af52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c7_af52_return_output;
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_9a64_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2096_c7_5d63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output;

     -- ora2[uxn_opcodes_h_l2094_c41_01be] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2094_c41_01be_phase <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_phase;
     ora2_uxn_opcodes_h_l2094_c41_01be_ins <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_ins;
     ora2_uxn_opcodes_h_l2094_c41_01be_pc <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_pc;
     ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_stack_read;
     ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read <= VAR_ora2_uxn_opcodes_h_l2094_c41_01be_previous_ram_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2094_c41_01be_return_output := ora2_uxn_opcodes_h_l2094_c41_01be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c1_647d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output;
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_647d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue := VAR_ora2_uxn_opcodes_h_l2094_c41_01be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2096_c1_f3fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2097_c7_454b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output;

     -- eor[uxn_opcodes_h_l2095_c41_1cca] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2095_c41_1cca_phase <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_phase;
     eor_uxn_opcodes_h_l2095_c41_1cca_ins <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_ins;
     eor_uxn_opcodes_h_l2095_c41_1cca_pc <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_pc;
     eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_stack_read;
     eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read <= VAR_eor_uxn_opcodes_h_l2095_c41_1cca_previous_ram_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2095_c41_1cca_return_output := eor_uxn_opcodes_h_l2095_c41_1cca_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c7_454b_return_output;
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2096_c1_f3fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue := VAR_eor_uxn_opcodes_h_l2095_c41_1cca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2098_c7_540a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2097_c1_18b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output;

     -- eor2[uxn_opcodes_h_l2096_c41_f53c] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2096_c41_f53c_phase <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_phase;
     eor2_uxn_opcodes_h_l2096_c41_f53c_ins <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_ins;
     eor2_uxn_opcodes_h_l2096_c41_f53c_pc <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_pc;
     eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_stack_read;
     eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read <= VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_previous_ram_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_return_output := eor2_uxn_opcodes_h_l2096_c41_f53c_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c7_540a_return_output;
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2097_c1_18b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue := VAR_eor2_uxn_opcodes_h_l2096_c41_f53c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2098_c1_58e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2099_c1_596e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output;

     -- sft[uxn_opcodes_h_l2097_c41_0817] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2097_c41_0817_phase <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_phase;
     sft_uxn_opcodes_h_l2097_c41_0817_ins <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_ins;
     sft_uxn_opcodes_h_l2097_c41_0817_pc <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_pc;
     sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_stack_read;
     sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read <= VAR_sft_uxn_opcodes_h_l2097_c41_0817_previous_ram_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2097_c41_0817_return_output := sft_uxn_opcodes_h_l2097_c41_0817_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2099_c1_596e_return_output;
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2098_c1_58e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue := VAR_sft_uxn_opcodes_h_l2097_c41_0817_return_output;
     -- printf_uxn_opcodes_h_l2099_c9_8ae1[uxn_opcodes_h_l2099_c9_8ae1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0 <= VAR_printf_uxn_opcodes_h_l2099_c9_8ae1_uxn_opcodes_h_l2099_c9_8ae1_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2098_c41_7dc2] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2098_c41_7dc2_phase <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_phase;
     sft2_uxn_opcodes_h_l2098_c41_7dc2_ins <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_ins;
     sft2_uxn_opcodes_h_l2098_c41_7dc2_pc <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_pc;
     sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_stack_read;
     sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read <= VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_previous_ram_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output := sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue := VAR_sft2_uxn_opcodes_h_l2098_c41_7dc2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2098_c7_540a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_cond;
     opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output := opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2098_c7_540a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2097_c7_454b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_cond;
     opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output := opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2097_c7_454b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2096_c7_5d63] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_cond;
     opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output := opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2096_c7_5d63_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2095_c7_af52] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_cond;
     opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output := opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2095_c7_af52_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2094_c7_2117] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_cond;
     opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output := opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2094_c7_2117_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2093_c7_18a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output := opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2093_c7_18a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2092_c7_ea51] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_cond;
     opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output := opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2092_c7_ea51_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2091_c7_5f80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_cond;
     opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output := opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2091_c7_5f80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2090_c7_8fca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_cond;
     opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output := opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2090_c7_8fca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2089_c7_be70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_cond;
     opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output := opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2089_c7_be70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2088_c7_e550] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_cond;
     opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output := opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2088_c7_e550_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2087_c7_ecca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_cond;
     opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output := opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2087_c7_ecca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2086_c7_82e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_cond;
     opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output := opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2086_c7_82e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2085_c7_5759] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_cond;
     opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output := opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2085_c7_5759_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2084_c7_328d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_cond;
     opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output := opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2084_c7_328d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2083_c7_7b0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_cond;
     opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output := opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2083_c7_7b0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2082_c7_749c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_cond;
     opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output := opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2082_c7_749c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2081_c7_3da8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_cond;
     opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output := opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2081_c7_3da8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2080_c7_0e7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_cond;
     opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output := opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2080_c7_0e7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2079_c7_b919] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_cond;
     opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output := opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2079_c7_b919_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2078_c7_5a0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_cond;
     opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output := opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2078_c7_5a0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2077_c7_67df] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_cond;
     opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output := opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2077_c7_67df_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2076_c7_aff5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_cond;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output := opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2076_c7_aff5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2075_c7_eaf3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_cond;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output := opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2075_c7_eaf3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2074_c7_6b7c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_cond;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output := opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2074_c7_6b7c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2073_c7_3bd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_cond;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output := opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2073_c7_3bd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2072_c7_9271] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_cond;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output := opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2072_c7_9271_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2071_c7_f77d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_cond;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output := opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2071_c7_f77d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2070_c7_48a1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_cond;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output := opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2070_c7_48a1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2069_c7_e83b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_cond;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output := opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2069_c7_e83b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2068_c7_b47c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_cond;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output := opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2068_c7_b47c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2067_c7_afd9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_cond;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output := opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2067_c7_afd9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2066_c7_32b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_cond;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output := opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2066_c7_32b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2065_c7_5320] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_cond;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output := opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2065_c7_5320_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2064_c7_d7b3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_cond;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output := opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2064_c7_d7b3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2063_c7_d7f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output := opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2063_c7_d7f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2062_c7_8488] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_cond;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output := opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2062_c7_8488_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2061_c7_fdfd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_cond;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output := opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2061_c7_fdfd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2060_c7_cff5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_cond;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output := opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2060_c7_cff5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2059_c7_5c44] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_cond;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output := opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2059_c7_5c44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2058_c7_0e33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_cond;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output := opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2058_c7_0e33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2057_c7_9b99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_cond;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output := opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2057_c7_9b99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2056_c7_c40f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_cond;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output := opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2056_c7_c40f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2055_c7_cebf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_cond;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output := opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2055_c7_cebf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2054_c7_dc0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_cond;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output := opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2054_c7_dc0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2053_c7_5073] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_cond;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output := opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2053_c7_5073_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2052_c7_54da] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_cond;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output := opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2052_c7_54da_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2051_c7_3978] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_cond;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output := opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2051_c7_3978_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2050_c7_3c78] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_cond;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output := opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2050_c7_3c78_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2049_c7_3896] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_cond;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output := opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2049_c7_3896_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2048_c7_1597] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_cond;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output := opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2048_c7_1597_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2047_c7_e769] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_cond;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output := opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2047_c7_e769_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2046_c7_2e5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_cond;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output := opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2046_c7_2e5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2045_c7_9c9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_cond;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output := opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2045_c7_9c9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2044_c7_ef49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_cond;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output := opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2044_c7_ef49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2043_c7_66fb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_cond;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output := opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2043_c7_66fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2042_c7_0ead] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_cond;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output := opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2042_c7_0ead_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2041_c7_7a6c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_cond;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output := opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2041_c7_7a6c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2040_c7_9649] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_cond;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output := opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2040_c7_9649_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2039_c7_d030] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_cond;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output := opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2039_c7_d030_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2038_c7_bc6a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_cond;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output := opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2038_c7_bc6a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2037_c7_8cb4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_cond;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output := opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2037_c7_8cb4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2036_c7_2334] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_cond;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output := opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2036_c7_2334_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2035_c7_b7e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output := opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2035_c7_b7e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2034_c7_66f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output := opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2034_c7_66f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2033_c7_fd41] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_cond;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output := opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2033_c7_fd41_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2032_c7_f82b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_cond;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output := opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2032_c7_f82b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2031_c7_9689] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_cond;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output := opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2031_c7_9689_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2030_c7_5a09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_cond;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output := opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2030_c7_5a09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2029_c2_66e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output := opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l2144_c23_0446] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2144_c23_0446_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2101_c6_445c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_c6_445c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2105_DUPLICATE_a1ca LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2105_DUPLICATE_a1ca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l2140_c3_ec76] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2140_c3_ec76_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2149_c34_1499] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2149_c34_1499_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2150_c33_5568] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2150_c33_5568_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2102_l2114_l2111_DUPLICATE_4bc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2102_l2114_l2111_DUPLICATE_4bc4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2110_c19_1ae9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_c19_1ae9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l2136_c3_6977] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2136_c3_6977_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.device_ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2111_c82_6429] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2111_c82_6429_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l2147_c29_3ae5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2147_c29_3ae5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2139_l2135_DUPLICATE_1ef6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2139_l2135_DUPLICATE_1ef6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l2112_c22_2b90] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2112_c22_2b90_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2137_c3_5327] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2137_c3_5327_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2143_c34_cad7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2143_c34_cad7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2152_c32_4d29] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2152_c32_4d29_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l2109_c18_ecee] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2109_c18_ecee_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l2145_c32_c798] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2145_c32_c798_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_ram_read;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l2151_c31_329d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2151_c31_329d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l2148_c30_04be] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2148_c30_04be_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2146_c33_be9f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2146_c33_be9f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2029_c2_66e8_return_output.is_ram_write;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2105_DUPLICATE_a1ca_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2105_DUPLICATE_a1ca_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2140_c3_ec76_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2137_c3_5327_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_c6_445c_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_c6_445c_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2102_l2114_l2111_DUPLICATE_4bc4_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2109_c18_ecee_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2109_c18_ecee_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2109_c18_ecee_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_c19_1ae9_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_c19_1ae9_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_c19_1ae9_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2139_l2135_DUPLICATE_1ef6_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2139_l2135_DUPLICATE_1ef6_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2136_c3_6977_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2111_c82_6429_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2112_c22_2b90_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2112_c22_2b90_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2112_c22_2b90_return_output;
     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2103_c4_cd6c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output;

     -- device_ram_update[uxn_opcodes_h_l2134_c26_32bd] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0 <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address0;
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_value;
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_write0_enable;
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read0_enable;
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1 <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_address1;
     device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output := device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2105_c4_e0b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2154_l2007_DUPLICATE_6ce7 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2154_l2007_DUPLICATE_6ce7_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2143_c34_cad7_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2144_c23_0446_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2145_c32_c798_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2146_c33_be9f_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2147_c29_3ae5_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2148_c30_04be_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2149_c34_1499_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2150_c33_5568_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2151_c31_329d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2152_c32_4d29_return_output);

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l2103_c4_ef9a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2103_c4_cd6c_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2105_c4_da78 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2105_c4_e0b5_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     VAR_MUX_uxn_opcodes_h_l2111_c19_5862_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2114_l2102_l2111_DUPLICATE_7aeb_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2154_l2007_DUPLICATE_6ce7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2154_l2007_DUPLICATE_6ce7_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l2134_c2_d952 := resize(VAR_device_ram_update_uxn_opcodes_h_l2134_c26_32bd_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l2134_c2_d952;
     VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse := VAR_sp0_uxn_opcodes_h_l2105_c4_da78;
     VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue := VAR_sp1_uxn_opcodes_h_l2103_c4_ef9a;
     -- sp1_MUX[uxn_opcodes_h_l2102_c3_91eb] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_cond;
     sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue;
     sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output := sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2114_c1_e7b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2123_c1_c993] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2102_c3_91eb] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_cond;
     sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iftrue;
     sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output := sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2123_c1_c993_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2114_c1_e7b3_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2102_c3_91eb_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2101_c2_81c7] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_cond;
     sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue;
     sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output := sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2101_c2_81c7] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_cond;
     sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iftrue;
     sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output := sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;
     VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2101_c2_81c7_return_output;
     -- MUX[uxn_opcodes_h_l2111_c19_5862] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2111_c19_5862_cond <= VAR_MUX_uxn_opcodes_h_l2111_c19_5862_cond;
     MUX_uxn_opcodes_h_l2111_c19_5862_iftrue <= VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iftrue;
     MUX_uxn_opcodes_h_l2111_c19_5862_iffalse <= VAR_MUX_uxn_opcodes_h_l2111_c19_5862_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2111_c19_5862_return_output := MUX_uxn_opcodes_h_l2111_c19_5862_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left := VAR_MUX_uxn_opcodes_h_l2111_c19_5862_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2111_c19_327d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l2111_c2_b874 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l2111_c19_327d_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2111_c2_b874;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2111_c2_b874, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2111_c2_b874, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2111_c2_b874, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2111_c2_b874, 8);
     -- stack_r_ram_update[uxn_opcodes_h_l2115_c22_0b96] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address0;
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_address1;
     stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output := stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l2124_c22_391b] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address0;
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_address1;
     stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output := stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l2115_c3_d50e := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l2115_c22_0b96_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l2124_c3_2a3b := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l2124_c22_391b_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue := VAR_stack_read_value_uxn_opcodes_h_l2115_c3_d50e;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse := VAR_stack_read_value_uxn_opcodes_h_l2124_c3_2a3b;
     -- stack_read_value_MUX[uxn_opcodes_h_l2114_c2_21ed] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_cond;
     stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output := stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l2114_c2_21ed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_sp <= REG_VAR_sp;
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
     sp <= REG_COMB_sp;
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
