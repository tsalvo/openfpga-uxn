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
-- Submodules: 376
entity eval_opcode_phased_0CLK_ba8291c2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_ba8291c2;
architecture arch of eval_opcode_phased_0CLK_ba8291c2 is
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
-- BIN_OP_AND[uxn_opcodes_h_l3049_c10_5f65]
signal BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3049_c10_aa12]
signal BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3049_c41_961b]
signal BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3049_c57_6f9e]
signal CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3049_c10_675e]
signal MUX_uxn_opcodes_h_l3049_c10_675e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3049_c10_675e_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3049_c10_675e_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3049_c10_675e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3054_c6_c341]
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_88ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3054_c2_865f]
signal opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_f968]
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_679c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_0b9f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3055_c7_88ab]
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3055_c41_5feb]
signal jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3055_c41_5feb_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3055_c41_5feb_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3055_c41_5feb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_1acd]
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_d242]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_ff33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3056_c7_0b9f]
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3056_c41_f48c]
signal jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3056_c41_f48c_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3056_c41_f48c_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3056_c41_f48c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_6c52]
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_b45f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_f153]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3057_c7_ff33]
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3057_c41_bcfd]
signal jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3057_c41_bcfd_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3057_c41_bcfd_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_e817]
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_b81f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_9adb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3058_c7_f153]
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3058_c41_bd7f]
signal lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3058_c41_bd7f_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3058_c41_bd7f_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3058_c41_bd7f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_da2e]
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_63b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_ae72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3059_c7_9adb]
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3059_c41_b88e]
signal lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3059_c41_b88e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3059_c41_b88e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3059_c41_b88e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_7266]
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_4fe6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_8fb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3060_c7_ae72]
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3060_c41_f67e]
signal lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_f67e_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_f67e_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3060_c41_f67e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_2924]
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_32dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_a1de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3061_c7_8fb9]
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3061_c41_1796]
signal lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_1796_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_1796_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3061_c41_1796_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_e3f6]
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_d8aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_1d2e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3062_c7_a1de]
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3062_c41_200a]
signal inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3062_c41_200a_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3062_c41_200a_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3062_c41_200a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_2db3]
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_7d79]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_d87a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3063_c7_1d2e]
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3063_c41_094c]
signal inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3063_c41_094c_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3063_c41_094c_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3063_c41_094c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_c6e6]
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_a539]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_574b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3064_c7_d87a]
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3064_c41_88fb]
signal pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3064_c41_88fb_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3064_c41_88fb_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3064_c41_88fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_8876]
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_9bf2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_80b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3065_c7_574b]
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3065_c41_a231]
signal pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3065_c41_a231_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3065_c41_a231_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3065_c41_a231_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_0408]
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_fa98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_1c75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3066_c7_80b4]
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3066_c41_c80a]
signal nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3066_c41_c80a_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3066_c41_c80a_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3066_c41_c80a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_9705]
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_e184]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_d29a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3067_c7_1c75]
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3067_c41_6a63]
signal nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3067_c41_6a63_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3067_c41_6a63_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3067_c41_6a63_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_5497]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_5209]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_56ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3068_c7_d29a]
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3068_c41_6ad5]
signal swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3068_c41_6ad5_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3068_c41_6ad5_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3068_c41_6ad5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_eec5]
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_53d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_96ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3069_c7_56ed]
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3069_c41_1242]
signal swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3069_c41_1242_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3069_c41_1242_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3069_c41_1242_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_7d42]
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_0d9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_7cff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3070_c7_96ff]
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3070_c41_a6d5]
signal rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3070_c41_a6d5_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3070_c41_a6d5_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3070_c41_a6d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_fdbe]
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_d622]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_3cdf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3071_c7_7cff]
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3071_c41_619e]
signal rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3071_c41_619e_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3071_c41_619e_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3071_c41_619e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_3b85]
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_9eb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_a112]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3072_c7_3cdf]
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3072_c41_9188]
signal dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3072_c41_9188_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3072_c41_9188_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3072_c41_9188_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_4a36]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_f459]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_09b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3073_c7_a112]
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3073_c41_7a1e]
signal dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3073_c41_7a1e_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3073_c41_7a1e_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_9098]
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_8495]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_5ac3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3074_c7_09b3]
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3074_c41_a601]
signal ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3074_c41_a601_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3074_c41_a601_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3074_c41_a601_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_6769]
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_eb6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_5968]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3075_c7_5ac3]
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3075_c41_76a4]
signal ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3075_c41_76a4_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3075_c41_76a4_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_8dd1]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_a3c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_2094]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3076_c7_5968]
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3076_c41_4152]
signal equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3076_c41_4152_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3076_c41_4152_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3076_c41_4152_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_4a99]
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_898e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_db77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3077_c7_2094]
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3077_c41_a492]
signal equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3077_c41_a492_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3077_c41_a492_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3077_c41_a492_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_4b40]
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_67f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_3005]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3078_c7_db77]
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3078_c41_9de9]
signal neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3078_c41_9de9_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3078_c41_9de9_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3078_c41_9de9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_34e1]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_f4ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_43a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3079_c7_3005]
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3079_c41_b99a]
signal neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3079_c41_b99a_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3079_c41_b99a_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3079_c41_b99a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_960e]
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_7402]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_c15d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3080_c7_43a9]
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3080_c41_a6ed]
signal gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3080_c41_a6ed_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3080_c41_a6ed_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3080_c41_a6ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_e621]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_84b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_593f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3081_c7_c15d]
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3081_c41_9b78]
signal gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3081_c41_9b78_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3081_c41_9b78_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3081_c41_9b78_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_25d0]
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_41cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_93af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3082_c7_593f]
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3082_c41_ef3b]
signal lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3082_c41_ef3b_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3082_c41_ef3b_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3082_c41_ef3b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_0be4]
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_e642]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_aa80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3083_c7_93af]
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3083_c41_63c9]
signal lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3083_c41_63c9_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3083_c41_63c9_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3083_c41_63c9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_6fc7]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_9371]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_4644]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3084_c7_aa80]
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3084_c41_ce9c]
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_35ee]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_4d2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_9bfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3085_c7_4644]
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3085_c41_eded]
signal jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3085_c41_eded_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3085_c41_eded_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3085_c41_eded_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_8522]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_a758]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_22e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3086_c7_9bfc]
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3086_c41_1326]
signal jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3086_c41_1326_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3086_c41_1326_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3086_c41_1326_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3086_c41_1326_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_45ea]
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_5db6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_4b9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3087_c7_22e8]
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3087_c41_0175]
signal jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3087_c41_0175_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3087_c41_0175_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3087_c41_0175_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_0c34]
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_3b7d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_fb9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3088_c7_4b9a]
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3088_c41_c74b]
signal jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3088_c41_c74b_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3088_c41_c74b_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3088_c41_c74b_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3088_c41_c74b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_14d4]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_a163]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_2700]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3089_c7_fb9a]
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3089_c41_ba85]
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_2373]
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_4ad9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_c19c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3090_c7_2700]
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3090_c41_76ba]
signal sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3090_c41_76ba_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3090_c41_76ba_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3090_c41_76ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_e36a]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_23a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_1ae1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3091_c7_c19c]
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3091_c41_c09c]
signal sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3091_c41_c09c_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3091_c41_c09c_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3091_c41_c09c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_9d6e]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_2d27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_f23a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3092_c7_1ae1]
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3092_c41_82d8]
signal ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3092_c41_82d8_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3092_c41_82d8_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3092_c41_82d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_2a0c]
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_a667]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_82ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3093_c7_f23a]
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3093_c41_2202]
signal ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3093_c41_2202_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3093_c41_2202_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3093_c41_2202_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_b677]
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_0689]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_2b5c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3094_c7_82ab]
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3094_c41_3df9]
signal stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3094_c41_3df9_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3094_c41_3df9_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3094_c41_3df9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_cee3]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_4980]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_d22b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3095_c7_2b5c]
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3095_c41_6ad9]
signal stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3095_c41_6ad9_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3095_c41_6ad9_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_c72e]
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_d463]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_cd30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3096_c7_d22b]
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3096_c41_1879]
signal ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3096_c41_1879_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_10ab]
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_c398]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_ae8c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3097_c7_cd30]
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3097_c41_56ff]
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_f2be]
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_a4f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_65ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3098_c7_ae8c]
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3098_c41_d477]
signal str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3098_c41_d477_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3098_c41_d477_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3098_c41_d477_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3098_c41_d477_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_8d3c]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_909e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_377a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3099_c7_65ad]
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3099_c41_8026]
signal str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3099_c41_8026_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3099_c41_8026_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3099_c41_8026_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3099_c41_8026_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_8b2b]
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_5628]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_82e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3100_c7_377a]
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3100_c41_76e0]
signal lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3100_c41_76e0_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3100_c41_76e0_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3100_c41_76e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_4700]
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_137a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_0ff9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3101_c7_82e6]
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3101_c41_e5de]
signal lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3101_c41_e5de_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3101_c41_e5de_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3101_c41_e5de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_5ab3]
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_1f74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_4487]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3102_c7_0ff9]
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3102_c41_a5bb]
signal sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3102_c41_a5bb_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3102_c41_a5bb_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3102_c41_a5bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_e1ab]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_5d3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_60fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3103_c7_4487]
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3103_c41_fdcc]
signal sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3103_c41_fdcc_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3103_c41_fdcc_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_a423]
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_7fc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_3799]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3104_c7_60fb]
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3104_c41_a285]
signal dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3104_c41_a285_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3104_c41_a285_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3104_c41_a285_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_9cf3]
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_2486]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_05f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3105_c7_3799]
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3105_c41_8708]
signal dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3105_c41_8708_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3105_c41_8708_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3105_c41_8708_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_a856]
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_9082]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_6c8f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3106_c7_05f8]
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3106_c41_0642]
signal deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3106_c41_0642_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3106_c41_0642_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3106_c41_0642_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_e722]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_90ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_2c77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3107_c7_6c8f]
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3107_c41_0fdb]
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_1af3]
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_9bbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_05a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3108_c7_2c77]
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3108_c41_ac18]
signal add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3108_c41_ac18_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3108_c41_ac18_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3108_c41_ac18_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_2288]
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_7238]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_f0a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3109_c7_05a8]
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3109_c41_2b09]
signal add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3109_c41_2b09_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3109_c41_2b09_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3109_c41_2b09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_15a2]
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_0607]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_d35a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3110_c7_f0a2]
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3110_c41_8a1d]
signal sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3110_c41_8a1d_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3110_c41_8a1d_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3110_c41_8a1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_c631]
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_2b3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_bfd4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3111_c7_d35a]
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3111_c41_ad08]
signal sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3111_c41_ad08_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3111_c41_ad08_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3111_c41_ad08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_7ce7]
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_94dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_b44f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3112_c7_bfd4]
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3112_c41_9c5a]
signal mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3112_c41_9c5a_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3112_c41_9c5a_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3112_c41_9c5a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_2d0f]
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_4cc9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_c4ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3113_c7_b44f]
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3113_c41_1c79]
signal mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3113_c41_1c79_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3113_c41_1c79_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3113_c41_1c79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_f3b6]
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_c82e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_edda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3114_c7_c4ce]
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3114_c41_1d3a]
signal div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3114_c41_1d3a_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3114_c41_1d3a_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3114_c41_1d3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_88ea]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_035a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_d532]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3115_c7_edda]
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3115_c41_3e66]
signal div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3115_c41_3e66_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3115_c41_3e66_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3115_c41_3e66_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_6bcd]
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_40cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_2ad9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3116_c7_d532]
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3116_c41_f936]
signal and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3116_c41_f936_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3116_c41_f936_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3116_c41_f936_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_db2b]
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_ddcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_4fd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3117_c7_2ad9]
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3117_c41_e14c]
signal and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3117_c41_e14c_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3117_c41_e14c_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3117_c41_e14c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_86d1]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_9fcb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_b139]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3118_c7_4fd0]
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3118_c41_c1af]
signal ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3118_c41_c1af_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3118_c41_c1af_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3118_c41_c1af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_5258]
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_9049]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c7_8f86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3119_c7_b139]
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3119_c41_bc5a]
signal ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3119_c41_bc5a_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3119_c41_bc5a_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3120_c11_db34]
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_387c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c7_c902]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3120_c7_8f86]
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3120_c41_c204]
signal eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3120_c41_c204_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3120_c41_c204_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3120_c41_c204_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_86eb]
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c1_376c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c7_f457]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3121_c7_c902]
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3121_c41_bfc2]
signal eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3121_c41_bfc2_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3121_c41_bfc2_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_cde3]
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c1_8b53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c7_4925]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3122_c7_f457]
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3122_c41_a815]
signal sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3122_c41_a815_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3122_c41_a815_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3122_c41_a815_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3123_c11_4e59]
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c1_ea37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c1_aec6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3123_c7_4925]
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3123_c41_4d22]
signal sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3123_c41_4d22_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3123_c41_4d22_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3123_c41_4d22_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3124_c9_5b17[uxn_opcodes_h_l3124_c9_5b17]
signal printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3126_c18_dd31]
signal BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3126_c18_8f49]
signal BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3126_c18_cd99]
signal MUX_uxn_opcodes_h_l3126_c18_cd99_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3126_c18_cd99_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l3127_c2_8c64]
signal BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3129_c2_2fe1]
signal sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3129_c2_2fe1]
signal sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3130_c3_b258]
signal sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3130_c3_b258]
signal sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3131_c4_fa92]
signal BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3133_c4_2bc3]
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3137_c30_f259]
signal MUX_uxn_opcodes_h_l3137_c30_f259_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3137_c30_f259_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3137_c30_f259_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3137_c30_f259_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3137_c19_eeeb]
signal BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3138_c20_1330]
signal MUX_uxn_opcodes_h_l3138_c20_1330_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3138_c20_1330_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3138_c20_1330_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3138_c20_1330_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3138_c2_8353]
signal BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3140_c21_3172]
signal stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65
BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left,
BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right,
BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12
BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left,
BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right,
BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b
BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left,
BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right,
BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e
CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x,
CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output);

-- MUX_uxn_opcodes_h_l3049_c10_675e
MUX_uxn_opcodes_h_l3049_c10_675e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3049_c10_675e_cond,
MUX_uxn_opcodes_h_l3049_c10_675e_iftrue,
MUX_uxn_opcodes_h_l3049_c10_675e_iffalse,
MUX_uxn_opcodes_h_l3049_c10_675e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341
BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left,
BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right,
BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3054_c2_865f
opc_result_MUX_uxn_opcodes_h_l3054_c2_865f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond,
opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab
opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond,
opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output);

-- jci_uxn_opcodes_h_l3055_c41_5feb
jci_uxn_opcodes_h_l3055_c41_5feb : entity work.jci_0CLK_af8c339b port map (
clk,
jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3055_c41_5feb_phase,
jci_uxn_opcodes_h_l3055_c41_5feb_pc,
jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read,
jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read,
jci_uxn_opcodes_h_l3055_c41_5feb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f
opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond,
opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output);

-- jmi_uxn_opcodes_h_l3056_c41_f48c
jmi_uxn_opcodes_h_l3056_c41_f48c : entity work.jmi_0CLK_23e8fd15 port map (
clk,
jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3056_c41_f48c_phase,
jmi_uxn_opcodes_h_l3056_c41_f48c_pc,
jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read,
jmi_uxn_opcodes_h_l3056_c41_f48c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33
opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse,
opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output);

-- jsi_uxn_opcodes_h_l3057_c41_bcfd
jsi_uxn_opcodes_h_l3057_c41_bcfd : entity work.jsi_0CLK_fd2391e7 port map (
clk,
jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3057_c41_bcfd_phase,
jsi_uxn_opcodes_h_l3057_c41_bcfd_pc,
jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read,
jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3058_c7_f153
opc_result_MUX_uxn_opcodes_h_l3058_c7_f153 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond,
opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue,
opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse,
opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output);

-- lit_uxn_opcodes_h_l3058_c41_bd7f
lit_uxn_opcodes_h_l3058_c41_bd7f : entity work.lit_0CLK_393f0be6 port map (
clk,
lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3058_c41_bd7f_phase,
lit_uxn_opcodes_h_l3058_c41_bd7f_pc,
lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read,
lit_uxn_opcodes_h_l3058_c41_bd7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb
opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond,
opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output);

-- lit2_uxn_opcodes_h_l3059_c41_b88e
lit2_uxn_opcodes_h_l3059_c41_b88e : entity work.lit2_0CLK_68908aa0 port map (
clk,
lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3059_c41_b88e_phase,
lit2_uxn_opcodes_h_l3059_c41_b88e_pc,
lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read,
lit2_uxn_opcodes_h_l3059_c41_b88e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72
opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond,
opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue,
opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse,
opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output);

-- lit_uxn_opcodes_h_l3060_c41_f67e
lit_uxn_opcodes_h_l3060_c41_f67e : entity work.lit_0CLK_393f0be6 port map (
clk,
lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3060_c41_f67e_phase,
lit_uxn_opcodes_h_l3060_c41_f67e_pc,
lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read,
lit_uxn_opcodes_h_l3060_c41_f67e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9
opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond,
opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output);

-- lit2_uxn_opcodes_h_l3061_c41_1796
lit2_uxn_opcodes_h_l3061_c41_1796 : entity work.lit2_0CLK_68908aa0 port map (
clk,
lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3061_c41_1796_phase,
lit2_uxn_opcodes_h_l3061_c41_1796_pc,
lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read,
lit2_uxn_opcodes_h_l3061_c41_1796_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de
opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond,
opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue,
opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse,
opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output);

-- inc_uxn_opcodes_h_l3062_c41_200a
inc_uxn_opcodes_h_l3062_c41_200a : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3062_c41_200a_phase,
inc_uxn_opcodes_h_l3062_c41_200a_ins,
inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read,
inc_uxn_opcodes_h_l3062_c41_200a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e
opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond,
opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output);

-- inc2_uxn_opcodes_h_l3063_c41_094c
inc2_uxn_opcodes_h_l3063_c41_094c : entity work.inc2_0CLK_e5505ae3 port map (
clk,
inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3063_c41_094c_phase,
inc2_uxn_opcodes_h_l3063_c41_094c_ins,
inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read,
inc2_uxn_opcodes_h_l3063_c41_094c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a
opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond,
opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output);

-- pop_uxn_opcodes_h_l3064_c41_88fb
pop_uxn_opcodes_h_l3064_c41_88fb : entity work.pop_0CLK_d4523e9c port map (
clk,
pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3064_c41_88fb_phase,
pop_uxn_opcodes_h_l3064_c41_88fb_ins,
pop_uxn_opcodes_h_l3064_c41_88fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3065_c7_574b
opc_result_MUX_uxn_opcodes_h_l3065_c7_574b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond,
opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output);

-- pop2_uxn_opcodes_h_l3065_c41_a231
pop2_uxn_opcodes_h_l3065_c41_a231 : entity work.pop2_0CLK_d4523e9c port map (
clk,
pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3065_c41_a231_phase,
pop2_uxn_opcodes_h_l3065_c41_a231_ins,
pop2_uxn_opcodes_h_l3065_c41_a231_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4
opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond,
opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output);

-- nip_uxn_opcodes_h_l3066_c41_c80a
nip_uxn_opcodes_h_l3066_c41_c80a : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3066_c41_c80a_phase,
nip_uxn_opcodes_h_l3066_c41_c80a_ins,
nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read,
nip_uxn_opcodes_h_l3066_c41_c80a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75
opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond,
opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue,
opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse,
opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output);

-- nip2_uxn_opcodes_h_l3067_c41_6a63
nip2_uxn_opcodes_h_l3067_c41_6a63 : entity work.nip2_0CLK_4dee2d7a port map (
clk,
nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3067_c41_6a63_phase,
nip2_uxn_opcodes_h_l3067_c41_6a63_ins,
nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read,
nip2_uxn_opcodes_h_l3067_c41_6a63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a
opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond,
opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output);

-- swp_uxn_opcodes_h_l3068_c41_6ad5
swp_uxn_opcodes_h_l3068_c41_6ad5 : entity work.swp_0CLK_b288bfb7 port map (
clk,
swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3068_c41_6ad5_phase,
swp_uxn_opcodes_h_l3068_c41_6ad5_ins,
swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read,
swp_uxn_opcodes_h_l3068_c41_6ad5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed
opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond,
opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue,
opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse,
opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output);

-- swp2_uxn_opcodes_h_l3069_c41_1242
swp2_uxn_opcodes_h_l3069_c41_1242 : entity work.swp2_0CLK_3cd05a88 port map (
clk,
swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3069_c41_1242_phase,
swp2_uxn_opcodes_h_l3069_c41_1242_ins,
swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read,
swp2_uxn_opcodes_h_l3069_c41_1242_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff
opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond,
opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output);

-- rot_uxn_opcodes_h_l3070_c41_a6d5
rot_uxn_opcodes_h_l3070_c41_a6d5 : entity work.rot_0CLK_870b5434 port map (
clk,
rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3070_c41_a6d5_phase,
rot_uxn_opcodes_h_l3070_c41_a6d5_ins,
rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read,
rot_uxn_opcodes_h_l3070_c41_a6d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff
opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond,
opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue,
opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse,
opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output);

-- rot2_uxn_opcodes_h_l3071_c41_619e
rot2_uxn_opcodes_h_l3071_c41_619e : entity work.rot2_0CLK_025fbec9 port map (
clk,
rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3071_c41_619e_phase,
rot2_uxn_opcodes_h_l3071_c41_619e_ins,
rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read,
rot2_uxn_opcodes_h_l3071_c41_619e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf
opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond,
opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output);

-- dup_uxn_opcodes_h_l3072_c41_9188
dup_uxn_opcodes_h_l3072_c41_9188 : entity work.dup_0CLK_02ab8d09 port map (
clk,
dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3072_c41_9188_phase,
dup_uxn_opcodes_h_l3072_c41_9188_ins,
dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read,
dup_uxn_opcodes_h_l3072_c41_9188_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3073_c7_a112
opc_result_MUX_uxn_opcodes_h_l3073_c7_a112 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond,
opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue,
opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse,
opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output);

-- dup2_uxn_opcodes_h_l3073_c41_7a1e
dup2_uxn_opcodes_h_l3073_c41_7a1e : entity work.dup2_0CLK_406fa002 port map (
clk,
dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3073_c41_7a1e_phase,
dup2_uxn_opcodes_h_l3073_c41_7a1e_ins,
dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read,
dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3
opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond,
opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output);

-- ovr_uxn_opcodes_h_l3074_c41_a601
ovr_uxn_opcodes_h_l3074_c41_a601 : entity work.ovr_0CLK_6da26caa port map (
clk,
ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3074_c41_a601_phase,
ovr_uxn_opcodes_h_l3074_c41_a601_ins,
ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read,
ovr_uxn_opcodes_h_l3074_c41_a601_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3
opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond,
opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output);

-- ovr2_uxn_opcodes_h_l3075_c41_76a4
ovr2_uxn_opcodes_h_l3075_c41_76a4 : entity work.ovr2_0CLK_1a3e18d9 port map (
clk,
ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3075_c41_76a4_phase,
ovr2_uxn_opcodes_h_l3075_c41_76a4_ins,
ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read,
ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3076_c7_5968
opc_result_MUX_uxn_opcodes_h_l3076_c7_5968 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond,
opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue,
opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse,
opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output);

-- equ_uxn_opcodes_h_l3076_c41_4152
equ_uxn_opcodes_h_l3076_c41_4152 : entity work.equ_0CLK_57104a4d port map (
clk,
equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3076_c41_4152_phase,
equ_uxn_opcodes_h_l3076_c41_4152_ins,
equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read,
equ_uxn_opcodes_h_l3076_c41_4152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3077_c7_2094
opc_result_MUX_uxn_opcodes_h_l3077_c7_2094 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond,
opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue,
opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse,
opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output);

-- equ2_uxn_opcodes_h_l3077_c41_a492
equ2_uxn_opcodes_h_l3077_c41_a492 : entity work.equ2_0CLK_27ee032d port map (
clk,
equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3077_c41_a492_phase,
equ2_uxn_opcodes_h_l3077_c41_a492_ins,
equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read,
equ2_uxn_opcodes_h_l3077_c41_a492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3078_c7_db77
opc_result_MUX_uxn_opcodes_h_l3078_c7_db77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond,
opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue,
opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse,
opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output);

-- neq_uxn_opcodes_h_l3078_c41_9de9
neq_uxn_opcodes_h_l3078_c41_9de9 : entity work.neq_0CLK_57104a4d port map (
clk,
neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3078_c41_9de9_phase,
neq_uxn_opcodes_h_l3078_c41_9de9_ins,
neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read,
neq_uxn_opcodes_h_l3078_c41_9de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3079_c7_3005
opc_result_MUX_uxn_opcodes_h_l3079_c7_3005 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse,
opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output);

-- neq2_uxn_opcodes_h_l3079_c41_b99a
neq2_uxn_opcodes_h_l3079_c41_b99a : entity work.neq2_0CLK_27ee032d port map (
clk,
neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3079_c41_b99a_phase,
neq2_uxn_opcodes_h_l3079_c41_b99a_ins,
neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read,
neq2_uxn_opcodes_h_l3079_c41_b99a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9
opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond,
opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output);

-- gth_uxn_opcodes_h_l3080_c41_a6ed
gth_uxn_opcodes_h_l3080_c41_a6ed : entity work.gth_0CLK_57104a4d port map (
clk,
gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3080_c41_a6ed_phase,
gth_uxn_opcodes_h_l3080_c41_a6ed_ins,
gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read,
gth_uxn_opcodes_h_l3080_c41_a6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d
opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond,
opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output);

-- gth2_uxn_opcodes_h_l3081_c41_9b78
gth2_uxn_opcodes_h_l3081_c41_9b78 : entity work.gth2_0CLK_27ee032d port map (
clk,
gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3081_c41_9b78_phase,
gth2_uxn_opcodes_h_l3081_c41_9b78_ins,
gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read,
gth2_uxn_opcodes_h_l3081_c41_9b78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3082_c7_593f
opc_result_MUX_uxn_opcodes_h_l3082_c7_593f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond,
opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output);

-- lth_uxn_opcodes_h_l3082_c41_ef3b
lth_uxn_opcodes_h_l3082_c41_ef3b : entity work.lth_0CLK_57104a4d port map (
clk,
lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3082_c41_ef3b_phase,
lth_uxn_opcodes_h_l3082_c41_ef3b_ins,
lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read,
lth_uxn_opcodes_h_l3082_c41_ef3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3083_c7_93af
opc_result_MUX_uxn_opcodes_h_l3083_c7_93af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond,
opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue,
opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse,
opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output);

-- lth2_uxn_opcodes_h_l3083_c41_63c9
lth2_uxn_opcodes_h_l3083_c41_63c9 : entity work.lth2_0CLK_27ee032d port map (
clk,
lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3083_c41_63c9_phase,
lth2_uxn_opcodes_h_l3083_c41_63c9_ins,
lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read,
lth2_uxn_opcodes_h_l3083_c41_63c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80
opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond,
opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue,
opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse,
opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output);

-- jmp_uxn_opcodes_h_l3084_c41_ce9c
jmp_uxn_opcodes_h_l3084_c41_ce9c : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3084_c41_ce9c_phase,
jmp_uxn_opcodes_h_l3084_c41_ce9c_ins,
jmp_uxn_opcodes_h_l3084_c41_ce9c_pc,
jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read,
jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3085_c7_4644
opc_result_MUX_uxn_opcodes_h_l3085_c7_4644 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond,
opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue,
opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse,
opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output);

-- jmp2_uxn_opcodes_h_l3085_c41_eded
jmp2_uxn_opcodes_h_l3085_c41_eded : entity work.jmp2_0CLK_355c9936 port map (
clk,
jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3085_c41_eded_phase,
jmp2_uxn_opcodes_h_l3085_c41_eded_ins,
jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read,
jmp2_uxn_opcodes_h_l3085_c41_eded_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc
opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond,
opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output);

-- jcn_uxn_opcodes_h_l3086_c41_1326
jcn_uxn_opcodes_h_l3086_c41_1326 : entity work.jcn_0CLK_f62d646e port map (
clk,
jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3086_c41_1326_phase,
jcn_uxn_opcodes_h_l3086_c41_1326_ins,
jcn_uxn_opcodes_h_l3086_c41_1326_pc,
jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read,
jcn_uxn_opcodes_h_l3086_c41_1326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8
opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond,
opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output);

-- jcn2_uxn_opcodes_h_l3087_c41_0175
jcn2_uxn_opcodes_h_l3087_c41_0175 : entity work.jcn2_0CLK_862e49ca port map (
clk,
jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3087_c41_0175_phase,
jcn2_uxn_opcodes_h_l3087_c41_0175_ins,
jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read,
jcn2_uxn_opcodes_h_l3087_c41_0175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a
opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond,
opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output);

-- jsr_uxn_opcodes_h_l3088_c41_c74b
jsr_uxn_opcodes_h_l3088_c41_c74b : entity work.jsr_0CLK_fc1856e0 port map (
clk,
jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3088_c41_c74b_phase,
jsr_uxn_opcodes_h_l3088_c41_c74b_ins,
jsr_uxn_opcodes_h_l3088_c41_c74b_pc,
jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read,
jsr_uxn_opcodes_h_l3088_c41_c74b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a
opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond,
opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output);

-- jsr2_uxn_opcodes_h_l3089_c41_ba85
jsr2_uxn_opcodes_h_l3089_c41_ba85 : entity work.jsr2_0CLK_b41e1b54 port map (
clk,
jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3089_c41_ba85_phase,
jsr2_uxn_opcodes_h_l3089_c41_ba85_ins,
jsr2_uxn_opcodes_h_l3089_c41_ba85_pc,
jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read,
jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3090_c7_2700
opc_result_MUX_uxn_opcodes_h_l3090_c7_2700 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond,
opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue,
opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse,
opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output);

-- sth_uxn_opcodes_h_l3090_c41_76ba
sth_uxn_opcodes_h_l3090_c41_76ba : entity work.sth_0CLK_61914e8d port map (
clk,
sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3090_c41_76ba_phase,
sth_uxn_opcodes_h_l3090_c41_76ba_ins,
sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read,
sth_uxn_opcodes_h_l3090_c41_76ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c
opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond,
opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output);

-- sth2_uxn_opcodes_h_l3091_c41_c09c
sth2_uxn_opcodes_h_l3091_c41_c09c : entity work.sth2_0CLK_862e49ca port map (
clk,
sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3091_c41_c09c_phase,
sth2_uxn_opcodes_h_l3091_c41_c09c_ins,
sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read,
sth2_uxn_opcodes_h_l3091_c41_c09c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output);

-- ldz_uxn_opcodes_h_l3092_c41_82d8
ldz_uxn_opcodes_h_l3092_c41_82d8 : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3092_c41_82d8_phase,
ldz_uxn_opcodes_h_l3092_c41_82d8_ins,
ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read,
ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read,
ldz_uxn_opcodes_h_l3092_c41_82d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a
opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond,
opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output);

-- ldz2_uxn_opcodes_h_l3093_c41_2202
ldz2_uxn_opcodes_h_l3093_c41_2202 : entity work.ldz2_0CLK_188cbc69 port map (
clk,
ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3093_c41_2202_phase,
ldz2_uxn_opcodes_h_l3093_c41_2202_ins,
ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read,
ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read,
ldz2_uxn_opcodes_h_l3093_c41_2202_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab
opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond,
opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output);

-- stz_uxn_opcodes_h_l3094_c41_3df9
stz_uxn_opcodes_h_l3094_c41_3df9 : entity work.stz_0CLK_22fc9fcf port map (
clk,
stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3094_c41_3df9_phase,
stz_uxn_opcodes_h_l3094_c41_3df9_ins,
stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read,
stz_uxn_opcodes_h_l3094_c41_3df9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c
opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond,
opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output);

-- stz2_uxn_opcodes_h_l3095_c41_6ad9
stz2_uxn_opcodes_h_l3095_c41_6ad9 : entity work.stz2_0CLK_469c6534 port map (
clk,
stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3095_c41_6ad9_phase,
stz2_uxn_opcodes_h_l3095_c41_6ad9_ins,
stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read,
stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b
opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond,
opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output);

-- ldr_uxn_opcodes_h_l3096_c41_1879
ldr_uxn_opcodes_h_l3096_c41_1879 : entity work.ldr_0CLK_46731a7b port map (
clk,
ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3096_c41_1879_phase,
ldr_uxn_opcodes_h_l3096_c41_1879_ins,
ldr_uxn_opcodes_h_l3096_c41_1879_pc,
ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read,
ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read,
ldr_uxn_opcodes_h_l3096_c41_1879_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30
opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond,
opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue,
opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse,
opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output);

-- ldr2_uxn_opcodes_h_l3097_c41_56ff
ldr2_uxn_opcodes_h_l3097_c41_56ff : entity work.ldr2_0CLK_188cbc69 port map (
clk,
ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3097_c41_56ff_phase,
ldr2_uxn_opcodes_h_l3097_c41_56ff_ins,
ldr2_uxn_opcodes_h_l3097_c41_56ff_pc,
ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read,
ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read,
ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c
opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond,
opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output);

-- str1_uxn_opcodes_h_l3098_c41_d477
str1_uxn_opcodes_h_l3098_c41_d477 : entity work.str1_0CLK_bf6dd460 port map (
clk,
str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3098_c41_d477_phase,
str1_uxn_opcodes_h_l3098_c41_d477_ins,
str1_uxn_opcodes_h_l3098_c41_d477_pc,
str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read,
str1_uxn_opcodes_h_l3098_c41_d477_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad
opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond,
opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output);

-- str2_uxn_opcodes_h_l3099_c41_8026
str2_uxn_opcodes_h_l3099_c41_8026 : entity work.str2_0CLK_469c6534 port map (
clk,
str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3099_c41_8026_phase,
str2_uxn_opcodes_h_l3099_c41_8026_ins,
str2_uxn_opcodes_h_l3099_c41_8026_pc,
str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read,
str2_uxn_opcodes_h_l3099_c41_8026_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3100_c7_377a
opc_result_MUX_uxn_opcodes_h_l3100_c7_377a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond,
opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output);

-- lda_uxn_opcodes_h_l3100_c41_76e0
lda_uxn_opcodes_h_l3100_c41_76e0 : entity work.lda_0CLK_6d870135 port map (
clk,
lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3100_c41_76e0_phase,
lda_uxn_opcodes_h_l3100_c41_76e0_ins,
lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read,
lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read,
lda_uxn_opcodes_h_l3100_c41_76e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6
opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond,
opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output);

-- lda2_uxn_opcodes_h_l3101_c41_e5de
lda2_uxn_opcodes_h_l3101_c41_e5de : entity work.lda2_0CLK_8a233c30 port map (
clk,
lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3101_c41_e5de_phase,
lda2_uxn_opcodes_h_l3101_c41_e5de_ins,
lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read,
lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read,
lda2_uxn_opcodes_h_l3101_c41_e5de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9
opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond,
opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output);

-- sta_uxn_opcodes_h_l3102_c41_a5bb
sta_uxn_opcodes_h_l3102_c41_a5bb : entity work.sta_0CLK_b9e2e151 port map (
clk,
sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3102_c41_a5bb_phase,
sta_uxn_opcodes_h_l3102_c41_a5bb_ins,
sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read,
sta_uxn_opcodes_h_l3102_c41_a5bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3103_c7_4487
opc_result_MUX_uxn_opcodes_h_l3103_c7_4487 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond,
opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue,
opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse,
opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output);

-- sta2_uxn_opcodes_h_l3103_c41_fdcc
sta2_uxn_opcodes_h_l3103_c41_fdcc : entity work.sta2_0CLK_999c1cf1 port map (
clk,
sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3103_c41_fdcc_phase,
sta2_uxn_opcodes_h_l3103_c41_fdcc_ins,
sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read,
sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb
opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond,
opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output);

-- dei_uxn_opcodes_h_l3104_c41_a285
dei_uxn_opcodes_h_l3104_c41_a285 : entity work.dei_0CLK_96708482 port map (
clk,
dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3104_c41_a285_phase,
dei_uxn_opcodes_h_l3104_c41_a285_ins,
dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read,
dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read,
dei_uxn_opcodes_h_l3104_c41_a285_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3105_c7_3799
opc_result_MUX_uxn_opcodes_h_l3105_c7_3799 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond,
opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue,
opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse,
opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output);

-- dei2_uxn_opcodes_h_l3105_c41_8708
dei2_uxn_opcodes_h_l3105_c41_8708 : entity work.dei2_0CLK_32efc0bf port map (
clk,
dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3105_c41_8708_phase,
dei2_uxn_opcodes_h_l3105_c41_8708_ins,
dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read,
dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read,
dei2_uxn_opcodes_h_l3105_c41_8708_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8
opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond,
opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output);

-- deo_uxn_opcodes_h_l3106_c41_0642
deo_uxn_opcodes_h_l3106_c41_0642 : entity work.deo_0CLK_8de214c4 port map (
clk,
deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3106_c41_0642_phase,
deo_uxn_opcodes_h_l3106_c41_0642_ins,
deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read,
deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read,
deo_uxn_opcodes_h_l3106_c41_0642_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f
opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond,
opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output);

-- deo2_uxn_opcodes_h_l3107_c41_0fdb
deo2_uxn_opcodes_h_l3107_c41_0fdb : entity work.deo2_0CLK_7f713d0a port map (
clk,
deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3107_c41_0fdb_phase,
deo2_uxn_opcodes_h_l3107_c41_0fdb_ins,
deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read,
deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read,
deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77
opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output);

-- add_uxn_opcodes_h_l3108_c41_ac18
add_uxn_opcodes_h_l3108_c41_ac18 : entity work.add_0CLK_fedec265 port map (
clk,
add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE,
add_uxn_opcodes_h_l3108_c41_ac18_phase,
add_uxn_opcodes_h_l3108_c41_ac18_ins,
add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read,
add_uxn_opcodes_h_l3108_c41_ac18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8
opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond,
opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output);

-- add2_uxn_opcodes_h_l3109_c41_2b09
add2_uxn_opcodes_h_l3109_c41_2b09 : entity work.add2_0CLK_e3a03e27 port map (
clk,
add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3109_c41_2b09_phase,
add2_uxn_opcodes_h_l3109_c41_2b09_ins,
add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read,
add2_uxn_opcodes_h_l3109_c41_2b09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2
opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond,
opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output);

-- sub_uxn_opcodes_h_l3110_c41_8a1d
sub_uxn_opcodes_h_l3110_c41_8a1d : entity work.sub_0CLK_fedec265 port map (
clk,
sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3110_c41_8a1d_phase,
sub_uxn_opcodes_h_l3110_c41_8a1d_ins,
sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read,
sub_uxn_opcodes_h_l3110_c41_8a1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a
opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond,
opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output);

-- sub2_uxn_opcodes_h_l3111_c41_ad08
sub2_uxn_opcodes_h_l3111_c41_ad08 : entity work.sub2_0CLK_e3a03e27 port map (
clk,
sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3111_c41_ad08_phase,
sub2_uxn_opcodes_h_l3111_c41_ad08_ins,
sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read,
sub2_uxn_opcodes_h_l3111_c41_ad08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4
opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond,
opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output);

-- mul_uxn_opcodes_h_l3112_c41_9c5a
mul_uxn_opcodes_h_l3112_c41_9c5a : entity work.mul_0CLK_fedec265 port map (
clk,
mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3112_c41_9c5a_phase,
mul_uxn_opcodes_h_l3112_c41_9c5a_ins,
mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read,
mul_uxn_opcodes_h_l3112_c41_9c5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f
opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond,
opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output);

-- mul2_uxn_opcodes_h_l3113_c41_1c79
mul2_uxn_opcodes_h_l3113_c41_1c79 : entity work.mul2_0CLK_e3a03e27 port map (
clk,
mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3113_c41_1c79_phase,
mul2_uxn_opcodes_h_l3113_c41_1c79_ins,
mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read,
mul2_uxn_opcodes_h_l3113_c41_1c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce
opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond,
opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output);

-- div_uxn_opcodes_h_l3114_c41_1d3a
div_uxn_opcodes_h_l3114_c41_1d3a : entity work.div_0CLK_6895eb34 port map (
clk,
div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE,
div_uxn_opcodes_h_l3114_c41_1d3a_phase,
div_uxn_opcodes_h_l3114_c41_1d3a_ins,
div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read,
div_uxn_opcodes_h_l3114_c41_1d3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3115_c7_edda
opc_result_MUX_uxn_opcodes_h_l3115_c7_edda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond,
opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue,
opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse,
opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output);

-- div2_uxn_opcodes_h_l3115_c41_3e66
div2_uxn_opcodes_h_l3115_c41_3e66 : entity work.div2_0CLK_69b108f6 port map (
clk,
div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3115_c41_3e66_phase,
div2_uxn_opcodes_h_l3115_c41_3e66_ins,
div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read,
div2_uxn_opcodes_h_l3115_c41_3e66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3116_c7_d532
opc_result_MUX_uxn_opcodes_h_l3116_c7_d532 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond,
opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue,
opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse,
opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output);

-- and_uxn_opcodes_h_l3116_c41_f936
and_uxn_opcodes_h_l3116_c41_f936 : entity work.and_0CLK_fedec265 port map (
clk,
and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE,
and_uxn_opcodes_h_l3116_c41_f936_phase,
and_uxn_opcodes_h_l3116_c41_f936_ins,
and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read,
and_uxn_opcodes_h_l3116_c41_f936_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9
opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond,
opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output);

-- and2_uxn_opcodes_h_l3117_c41_e14c
and2_uxn_opcodes_h_l3117_c41_e14c : entity work.and2_0CLK_e3a03e27 port map (
clk,
and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3117_c41_e14c_phase,
and2_uxn_opcodes_h_l3117_c41_e14c_ins,
and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read,
and2_uxn_opcodes_h_l3117_c41_e14c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0
opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond,
opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output);

-- ora_uxn_opcodes_h_l3118_c41_c1af
ora_uxn_opcodes_h_l3118_c41_c1af : entity work.ora_0CLK_fedec265 port map (
clk,
ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3118_c41_c1af_phase,
ora_uxn_opcodes_h_l3118_c41_c1af_ins,
ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read,
ora_uxn_opcodes_h_l3118_c41_c1af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3119_c7_b139
opc_result_MUX_uxn_opcodes_h_l3119_c7_b139 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond,
opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue,
opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse,
opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output);

-- ora2_uxn_opcodes_h_l3119_c41_bc5a
ora2_uxn_opcodes_h_l3119_c41_bc5a : entity work.ora2_0CLK_e3a03e27 port map (
clk,
ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3119_c41_bc5a_phase,
ora2_uxn_opcodes_h_l3119_c41_bc5a_ins,
ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read,
ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left,
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right,
BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86
opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond,
opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue,
opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse,
opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output);

-- eor_uxn_opcodes_h_l3120_c41_c204
eor_uxn_opcodes_h_l3120_c41_c204 : entity work.eor_0CLK_fedec265 port map (
clk,
eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3120_c41_c204_phase,
eor_uxn_opcodes_h_l3120_c41_c204_ins,
eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read,
eor_uxn_opcodes_h_l3120_c41_c204_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3121_c7_c902
opc_result_MUX_uxn_opcodes_h_l3121_c7_c902 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond,
opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue,
opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse,
opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output);

-- eor2_uxn_opcodes_h_l3121_c41_bfc2
eor2_uxn_opcodes_h_l3121_c41_bfc2 : entity work.eor2_0CLK_e3a03e27 port map (
clk,
eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3121_c41_bfc2_phase,
eor2_uxn_opcodes_h_l3121_c41_bfc2_ins,
eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read,
eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3122_c7_f457
opc_result_MUX_uxn_opcodes_h_l3122_c7_f457 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond,
opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue,
opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse,
opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output);

-- sft_uxn_opcodes_h_l3122_c41_a815
sft_uxn_opcodes_h_l3122_c41_a815 : entity work.sft_0CLK_007f81f8 port map (
clk,
sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3122_c41_a815_phase,
sft_uxn_opcodes_h_l3122_c41_a815_ins,
sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read,
sft_uxn_opcodes_h_l3122_c41_a815_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left,
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right,
BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3123_c7_4925
opc_result_MUX_uxn_opcodes_h_l3123_c7_4925 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond,
opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue,
opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse,
opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output);

-- sft2_uxn_opcodes_h_l3123_c41_4d22
sft2_uxn_opcodes_h_l3123_c41_4d22 : entity work.sft2_0CLK_e68f2acf port map (
clk,
sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3123_c41_4d22_phase,
sft2_uxn_opcodes_h_l3123_c41_4d22_ins,
sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read,
sft2_uxn_opcodes_h_l3123_c41_4d22_return_output);

-- printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17
printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17 : entity work.printf_uxn_opcodes_h_l3124_c9_5b17_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31
BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left,
BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right,
BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49
BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left,
BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right,
BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output);

-- MUX_uxn_opcodes_h_l3126_c18_cd99
MUX_uxn_opcodes_h_l3126_c18_cd99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3126_c18_cd99_cond,
MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue,
MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse,
MUX_uxn_opcodes_h_l3126_c18_cd99_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64
BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left,
BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right,
BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output);

-- sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1
sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond,
sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue,
sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse,
sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output);

-- sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1
sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond,
sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue,
sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse,
sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output);

-- sp0_MUX_uxn_opcodes_h_l3130_c3_b258
sp0_MUX_uxn_opcodes_h_l3130_c3_b258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond,
sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue,
sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse,
sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output);

-- sp1_MUX_uxn_opcodes_h_l3130_c3_b258
sp1_MUX_uxn_opcodes_h_l3130_c3_b258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond,
sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue,
sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse,
sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92
BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left,
BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right,
BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left,
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right,
BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output);

-- MUX_uxn_opcodes_h_l3137_c30_f259
MUX_uxn_opcodes_h_l3137_c30_f259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3137_c30_f259_cond,
MUX_uxn_opcodes_h_l3137_c30_f259_iftrue,
MUX_uxn_opcodes_h_l3137_c30_f259_iffalse,
MUX_uxn_opcodes_h_l3137_c30_f259_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb
BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left,
BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right,
BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output);

-- MUX_uxn_opcodes_h_l3138_c20_1330
MUX_uxn_opcodes_h_l3138_c20_1330 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3138_c20_1330_cond,
MUX_uxn_opcodes_h_l3138_c20_1330_iftrue,
MUX_uxn_opcodes_h_l3138_c20_1330_iffalse,
MUX_uxn_opcodes_h_l3138_c20_1330_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353
BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353 : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left,
BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right,
BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output);

-- stack_ram_update_uxn_opcodes_h_l3140_c21_3172
stack_ram_update_uxn_opcodes_h_l3140_c21_3172 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address,
stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value,
stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable,
stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output,
 CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output,
 MUX_uxn_opcodes_h_l3049_c10_675e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output,
 jci_uxn_opcodes_h_l3055_c41_5feb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output,
 opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output,
 jmi_uxn_opcodes_h_l3056_c41_f48c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output,
 opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output,
 jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output,
 lit_uxn_opcodes_h_l3058_c41_bd7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output,
 opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output,
 lit2_uxn_opcodes_h_l3059_c41_b88e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output,
 lit_uxn_opcodes_h_l3060_c41_f67e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output,
 opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output,
 lit2_uxn_opcodes_h_l3061_c41_1796_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output,
 inc_uxn_opcodes_h_l3062_c41_200a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output,
 inc2_uxn_opcodes_h_l3063_c41_094c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output,
 pop_uxn_opcodes_h_l3064_c41_88fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output,
 pop2_uxn_opcodes_h_l3065_c41_a231_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output,
 opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output,
 nip_uxn_opcodes_h_l3066_c41_c80a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output,
 nip2_uxn_opcodes_h_l3067_c41_6a63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output,
 opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output,
 swp_uxn_opcodes_h_l3068_c41_6ad5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output,
 swp2_uxn_opcodes_h_l3069_c41_1242_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output,
 opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output,
 rot_uxn_opcodes_h_l3070_c41_a6d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output,
 rot2_uxn_opcodes_h_l3071_c41_619e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output,
 opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output,
 dup_uxn_opcodes_h_l3072_c41_9188_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output,
 dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output,
 ovr_uxn_opcodes_h_l3074_c41_a601_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output,
 opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output,
 ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output,
 opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output,
 equ_uxn_opcodes_h_l3076_c41_4152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output,
 opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output,
 equ2_uxn_opcodes_h_l3077_c41_a492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output,
 opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output,
 neq_uxn_opcodes_h_l3078_c41_9de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output,
 neq2_uxn_opcodes_h_l3079_c41_b99a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output,
 gth_uxn_opcodes_h_l3080_c41_a6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output,
 gth2_uxn_opcodes_h_l3081_c41_9b78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output,
 opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output,
 lth_uxn_opcodes_h_l3082_c41_ef3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output,
 opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output,
 lth2_uxn_opcodes_h_l3083_c41_63c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output,
 opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output,
 jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output,
 jmp2_uxn_opcodes_h_l3085_c41_eded_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output,
 jcn_uxn_opcodes_h_l3086_c41_1326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output,
 jcn2_uxn_opcodes_h_l3087_c41_0175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output,
 jsr_uxn_opcodes_h_l3088_c41_c74b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output,
 opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output,
 jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output,
 sth_uxn_opcodes_h_l3090_c41_76ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output,
 sth2_uxn_opcodes_h_l3091_c41_c09c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output,
 ldz_uxn_opcodes_h_l3092_c41_82d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output,
 ldz2_uxn_opcodes_h_l3093_c41_2202_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output,
 stz_uxn_opcodes_h_l3094_c41_3df9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output,
 stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output,
 opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output,
 ldr_uxn_opcodes_h_l3096_c41_1879_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output,
 ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output,
 str1_uxn_opcodes_h_l3098_c41_d477_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output,
 str2_uxn_opcodes_h_l3099_c41_8026_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output,
 lda_uxn_opcodes_h_l3100_c41_76e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output,
 lda2_uxn_opcodes_h_l3101_c41_e5de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output,
 opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output,
 sta_uxn_opcodes_h_l3102_c41_a5bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output,
 sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output,
 opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output,
 dei_uxn_opcodes_h_l3104_c41_a285_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output,
 dei2_uxn_opcodes_h_l3105_c41_8708_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output,
 deo_uxn_opcodes_h_l3106_c41_0642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output,
 opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output,
 deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output,
 add_uxn_opcodes_h_l3108_c41_ac18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output,
 add2_uxn_opcodes_h_l3109_c41_2b09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output,
 sub_uxn_opcodes_h_l3110_c41_8a1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output,
 sub2_uxn_opcodes_h_l3111_c41_ad08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output,
 mul_uxn_opcodes_h_l3112_c41_9c5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output,
 mul2_uxn_opcodes_h_l3113_c41_1c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output,
 opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output,
 div_uxn_opcodes_h_l3114_c41_1d3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output,
 opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output,
 div2_uxn_opcodes_h_l3115_c41_3e66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output,
 and_uxn_opcodes_h_l3116_c41_f936_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output,
 and2_uxn_opcodes_h_l3117_c41_e14c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output,
 opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output,
 ora_uxn_opcodes_h_l3118_c41_c1af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output,
 opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output,
 ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output,
 opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output,
 eor_uxn_opcodes_h_l3120_c41_c204_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output,
 opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output,
 eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output,
 opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output,
 sft_uxn_opcodes_h_l3122_c41_a815_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output,
 sft2_uxn_opcodes_h_l3123_c41_4d22_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output,
 MUX_uxn_opcodes_h_l3126_c18_cd99_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output,
 sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output,
 sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output,
 sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output,
 sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output,
 MUX_uxn_opcodes_h_l3137_c30_f259_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output,
 MUX_uxn_opcodes_h_l3138_c20_1330_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output,
 stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3049_c2_556a : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3049_c10_675e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c30_32c8_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c57_145b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3049_c10_675e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3054_c2_865f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3055_c41_5feb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_f67e_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_f67e_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3060_c41_f67e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_1796_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_1796_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3061_c41_1796_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3062_c41_200a_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3062_c41_200a_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3062_c41_200a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3063_c41_094c_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3063_c41_094c_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3063_c41_094c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3064_c41_88fb_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3064_c41_88fb_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3064_c41_88fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3065_c41_a231_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3065_c41_a231_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3065_c41_a231_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3066_c41_c80a_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3066_c41_c80a_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3066_c41_c80a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3069_c41_1242_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3069_c41_1242_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3069_c41_1242_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3071_c41_619e_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3071_c41_619e_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3071_c41_619e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3072_c41_9188_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3072_c41_9188_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3072_c41_9188_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3074_c41_a601_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3074_c41_a601_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3074_c41_a601_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3076_c41_4152_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3076_c41_4152_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3076_c41_4152_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3077_c41_a492_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3077_c41_a492_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3077_c41_a492_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3078_c41_9de9_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3078_c41_9de9_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3078_c41_9de9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3086_c41_1326_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3090_c41_76ba_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3090_c41_76ba_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3090_c41_76ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3094_c41_3df9_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3094_c41_3df9_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3094_c41_3df9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3096_c41_1879_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3098_c41_d477_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3099_c41_8026_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3100_c41_76e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3104_c41_a285_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3105_c41_8708_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3106_c41_0642_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3108_c41_ac18_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3108_c41_ac18_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3108_c41_ac18_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3109_c41_2b09_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3109_c41_2b09_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3109_c41_2b09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3114_c41_1d3a_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3114_c41_1d3a_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3114_c41_1d3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3115_c41_3e66_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3115_c41_3e66_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3115_c41_3e66_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3116_c41_f936_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3116_c41_f936_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3116_c41_f936_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3117_c41_e14c_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3117_c41_e14c_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3117_c41_e14c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3118_c41_c1af_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3118_c41_c1af_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3118_c41_c1af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3120_c41_c204_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3120_c41_c204_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3120_c41_c204_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3122_c41_a815_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3122_c41_a815_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3122_c41_a815_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3127_c17_cfae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3129_c6_98f3_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3133_c4_43d4 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3131_c4_8d2f : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c30_f259_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c30_f259_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c19_3e98_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3137_c70_c442_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c59_55cf_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3138_c2_b1e5 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3138_c20_1330_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3138_c20_1330_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3143_c3_05fe_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3146_c39_ce38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3147_c40_2463_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_d009_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_e98f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_325f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_b1bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_a27e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_5743_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_67e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3131_l3133_DUPLICATE_0753_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3131_DUPLICATE_8a5d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3142_l3154_DUPLICATE_b4ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3034_l3157_DUPLICATE_456f_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right := to_unsigned(29, 5);
     VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right := to_unsigned(2560, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right := to_unsigned(61, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right := to_unsigned(64, 7);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right := to_unsigned(39, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right := to_unsigned(1536, 11);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right := to_unsigned(30, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right := to_unsigned(42, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right := to_unsigned(27, 5);
     VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right := to_unsigned(3584, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right := to_unsigned(34, 6);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_device_ram_read_value := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3109_c41_2b09_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3108_c41_ac18_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3117_c41_e14c_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3116_c41_f936_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3115_c41_3e66_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3114_c41_1d3a_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3072_c41_9188_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3120_c41_c204_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3077_c41_a492_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3076_c41_4152_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3063_c41_094c_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3062_c41_200a_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3078_c41_9de9_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3066_c41_c80a_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3118_c41_c1af_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3074_c41_a601_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3065_c41_a231_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3064_c41_88fb_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l3071_c41_619e_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3122_c41_a815_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3090_c41_76ba_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3094_c41_3df9_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3069_c41_1242_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3061_c41_1796_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3060_c41_f67e_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3109_c41_2b09_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3108_c41_ac18_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3117_c41_e14c_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3116_c41_f936_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3115_c41_3e66_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3114_c41_1d3a_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3072_c41_9188_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3120_c41_c204_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3077_c41_a492_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3076_c41_4152_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3063_c41_094c_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3062_c41_200a_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3061_c41_1796_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3060_c41_f67e_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3078_c41_9de9_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3066_c41_c80a_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3118_c41_c1af_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3074_c41_a601_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3065_c41_a231_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3064_c41_88fb_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l3071_c41_619e_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3122_c41_a815_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3090_c41_76ba_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3094_c41_3df9_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3069_c41_1242_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3054_c2_865f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3054_c2_865f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3049_c57_145b] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c57_145b_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l3126_c18_dd31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_left;
     BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output := BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3049_c10_5f65] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_left;
     BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output := BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3049_c41_961b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_left;
     BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output := BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c10_5f65_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3126_c18_dd31_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c57_145b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3054_c2_865f_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3049_c30_32c8] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c30_32c8_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3049_c41_961b_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3126_c18_8f49] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_left;
     BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output := BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3049_c57_6f9e] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output := CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3049_c10_aa12] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_left;
     BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output := BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3049_c10_675e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3049_c10_aa12_return_output;
     VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3126_c18_8f49_return_output;
     VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3049_c30_32c8_return_output;
     VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3049_c57_6f9e_return_output;
     -- MUX[uxn_opcodes_h_l3126_c18_cd99] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3126_c18_cd99_cond <= VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_cond;
     MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue <= VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iftrue;
     MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse <= VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_return_output := MUX_uxn_opcodes_h_l3126_c18_cd99_return_output;

     -- MUX[uxn_opcodes_h_l3049_c10_675e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3049_c10_675e_cond <= VAR_MUX_uxn_opcodes_h_l3049_c10_675e_cond;
     MUX_uxn_opcodes_h_l3049_c10_675e_iftrue <= VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iftrue;
     MUX_uxn_opcodes_h_l3049_c10_675e_iffalse <= VAR_MUX_uxn_opcodes_h_l3049_c10_675e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3049_c10_675e_return_output := MUX_uxn_opcodes_h_l3049_c10_675e_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3049_c2_556a := VAR_MUX_uxn_opcodes_h_l3049_c10_675e_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left := VAR_MUX_uxn_opcodes_h_l3126_c18_cd99_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3049_c2_556a;
     VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0 := resize(VAR_opc_uxn_opcodes_h_l3049_c2_556a, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_25d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_f3b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_e36a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_8b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_9098] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_left;
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output := BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_10ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_c631] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_left;
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output := BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_cde3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_eec5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_34e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_b677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_left;
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output := BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_9d6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_da2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_4700] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_left;
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output := BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_1af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_a423] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_left;
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output := BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_2db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_2d0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_9705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_left;
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output := BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_15a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_86d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3123_c11_4e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_9cf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_e3f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_e722] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_e621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_a856] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_left;
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output := BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_8522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_2373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_left;
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output := BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_7d42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_left;
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output := BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_0c34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_left;
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output := BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_0408] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_left;
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output := BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_c72e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_2924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_left;
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output := BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_4b40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_left;
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output := BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3054_c6_c341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_left;
     BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output := BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_fdbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_7266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_left;
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output := BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_db2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_14d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_cee3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_960e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_6fc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_5258] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_left;
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output := BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_e817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_left;
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output := BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_e1ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_4a36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_8d3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_3b85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_left;
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output := BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_7ce7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_6c52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_left;
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output := BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_2a0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_88ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_8dd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_f968] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_left;
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output := BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_f2be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_left;
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output := BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_0be4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_2288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_left;
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output := BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_5ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_5497] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_6769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_left;
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output := BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_86eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3120_c11_db34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_left;
     BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output := BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_45ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_8876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_left;
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output := BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_1acd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_6bcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_c6e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_4a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_35ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c6_c341_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_f968_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_1acd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_6c52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_e817_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_da2e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_7266_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_2924_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_e3f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_2db3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_c6e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_8876_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_0408_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_9705_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5497_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_eec5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7d42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_fdbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_3b85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_4a36_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_9098_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_6769_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_8dd1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_4a99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_4b40_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_34e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_960e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_e621_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_25d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_0be4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_6fc7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_35ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_8522_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_45ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_0c34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_14d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_2373_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_e36a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_9d6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_2a0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_b677_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cee3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_c72e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_10ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_f2be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8d3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_8b2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_4700_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_5ab3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_e1ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_a423_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_9cf3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_a856_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_e722_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_1af3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_2288_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_15a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_c631_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_7ce7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_2d0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_f3b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_88ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_6bcd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_db2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_86d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5258_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3120_c11_db34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_86eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_cde3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3123_c11_4e59_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_88ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_0b9f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_679c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output;
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_679c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_d242] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output;

     -- jci[uxn_opcodes_h_l3055_c41_5feb] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3055_c41_5feb_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3055_c41_5feb_phase <= VAR_jci_uxn_opcodes_h_l3055_c41_5feb_phase;
     jci_uxn_opcodes_h_l3055_c41_5feb_pc <= VAR_jci_uxn_opcodes_h_l3055_c41_5feb_pc;
     jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_stack_read;
     jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3055_c41_5feb_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3055_c41_5feb_return_output := jci_uxn_opcodes_h_l3055_c41_5feb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_ff33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output;
     VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_d242_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue := VAR_jci_uxn_opcodes_h_l3055_c41_5feb_return_output;
     -- jmi[uxn_opcodes_h_l3056_c41_f48c] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3056_c41_f48c_phase <= VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_phase;
     jmi_uxn_opcodes_h_l3056_c41_f48c_pc <= VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_pc;
     jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_return_output := jmi_uxn_opcodes_h_l3056_c41_f48c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_f153] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_b45f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_f153_return_output;
     VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_b45f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue := VAR_jmi_uxn_opcodes_h_l3056_c41_f48c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_9adb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output;

     -- jsi[uxn_opcodes_h_l3057_c41_bcfd] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3057_c41_bcfd_phase <= VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_phase;
     jsi_uxn_opcodes_h_l3057_c41_bcfd_pc <= VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_pc;
     jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output := jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_b81f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output;
     VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_b81f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue := VAR_jsi_uxn_opcodes_h_l3057_c41_bcfd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_63b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_ae72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output;

     -- lit[uxn_opcodes_h_l3058_c41_bd7f] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3058_c41_bd7f_phase <= VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_phase;
     lit_uxn_opcodes_h_l3058_c41_bd7f_pc <= VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_pc;
     lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_return_output := lit_uxn_opcodes_h_l3058_c41_bd7f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output;
     VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_63b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue := VAR_lit_uxn_opcodes_h_l3058_c41_bd7f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_8fb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output;

     -- lit2[uxn_opcodes_h_l3059_c41_b88e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3059_c41_b88e_phase <= VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_phase;
     lit2_uxn_opcodes_h_l3059_c41_b88e_pc <= VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_pc;
     lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_return_output := lit2_uxn_opcodes_h_l3059_c41_b88e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_4fe6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output;
     VAR_lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_4fe6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue := VAR_lit2_uxn_opcodes_h_l3059_c41_b88e_return_output;
     -- lit[uxn_opcodes_h_l3060_c41_f67e] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3060_c41_f67e_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3060_c41_f67e_phase <= VAR_lit_uxn_opcodes_h_l3060_c41_f67e_phase;
     lit_uxn_opcodes_h_l3060_c41_f67e_pc <= VAR_lit_uxn_opcodes_h_l3060_c41_f67e_pc;
     lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3060_c41_f67e_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3060_c41_f67e_return_output := lit_uxn_opcodes_h_l3060_c41_f67e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_32dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_a1de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output;
     VAR_lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_32dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue := VAR_lit_uxn_opcodes_h_l3060_c41_f67e_return_output;
     -- lit2[uxn_opcodes_h_l3061_c41_1796] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3061_c41_1796_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3061_c41_1796_phase <= VAR_lit2_uxn_opcodes_h_l3061_c41_1796_phase;
     lit2_uxn_opcodes_h_l3061_c41_1796_pc <= VAR_lit2_uxn_opcodes_h_l3061_c41_1796_pc;
     lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3061_c41_1796_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3061_c41_1796_return_output := lit2_uxn_opcodes_h_l3061_c41_1796_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_1d2e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_d8aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output;
     VAR_inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d8aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue := VAR_lit2_uxn_opcodes_h_l3061_c41_1796_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_d87a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_7d79] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output;

     -- inc[uxn_opcodes_h_l3062_c41_200a] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3062_c41_200a_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3062_c41_200a_phase <= VAR_inc_uxn_opcodes_h_l3062_c41_200a_phase;
     inc_uxn_opcodes_h_l3062_c41_200a_ins <= VAR_inc_uxn_opcodes_h_l3062_c41_200a_ins;
     inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3062_c41_200a_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3062_c41_200a_return_output := inc_uxn_opcodes_h_l3062_c41_200a_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output;
     VAR_inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7d79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue := VAR_inc_uxn_opcodes_h_l3062_c41_200a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_574b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_a539] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output;

     -- inc2[uxn_opcodes_h_l3063_c41_094c] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3063_c41_094c_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3063_c41_094c_phase <= VAR_inc2_uxn_opcodes_h_l3063_c41_094c_phase;
     inc2_uxn_opcodes_h_l3063_c41_094c_ins <= VAR_inc2_uxn_opcodes_h_l3063_c41_094c_ins;
     inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3063_c41_094c_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3063_c41_094c_return_output := inc2_uxn_opcodes_h_l3063_c41_094c_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_574b_return_output;
     VAR_pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_a539_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue := VAR_inc2_uxn_opcodes_h_l3063_c41_094c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_9bf2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output;

     -- pop[uxn_opcodes_h_l3064_c41_88fb] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3064_c41_88fb_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3064_c41_88fb_phase <= VAR_pop_uxn_opcodes_h_l3064_c41_88fb_phase;
     pop_uxn_opcodes_h_l3064_c41_88fb_ins <= VAR_pop_uxn_opcodes_h_l3064_c41_88fb_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3064_c41_88fb_return_output := pop_uxn_opcodes_h_l3064_c41_88fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_80b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output;
     VAR_pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_9bf2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue := VAR_pop_uxn_opcodes_h_l3064_c41_88fb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_fa98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output;

     -- pop2[uxn_opcodes_h_l3065_c41_a231] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3065_c41_a231_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3065_c41_a231_phase <= VAR_pop2_uxn_opcodes_h_l3065_c41_a231_phase;
     pop2_uxn_opcodes_h_l3065_c41_a231_ins <= VAR_pop2_uxn_opcodes_h_l3065_c41_a231_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3065_c41_a231_return_output := pop2_uxn_opcodes_h_l3065_c41_a231_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_1c75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output;
     VAR_nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_fa98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue := VAR_pop2_uxn_opcodes_h_l3065_c41_a231_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_d29a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output;

     -- nip[uxn_opcodes_h_l3066_c41_c80a] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3066_c41_c80a_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3066_c41_c80a_phase <= VAR_nip_uxn_opcodes_h_l3066_c41_c80a_phase;
     nip_uxn_opcodes_h_l3066_c41_c80a_ins <= VAR_nip_uxn_opcodes_h_l3066_c41_c80a_ins;
     nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3066_c41_c80a_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3066_c41_c80a_return_output := nip_uxn_opcodes_h_l3066_c41_c80a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_e184] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output;
     VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_e184_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue := VAR_nip_uxn_opcodes_h_l3066_c41_c80a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_5209] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_56ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output;

     -- nip2[uxn_opcodes_h_l3067_c41_6a63] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3067_c41_6a63_phase <= VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_phase;
     nip2_uxn_opcodes_h_l3067_c41_6a63_ins <= VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_ins;
     nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_return_output := nip2_uxn_opcodes_h_l3067_c41_6a63_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output;
     VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_5209_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue := VAR_nip2_uxn_opcodes_h_l3067_c41_6a63_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_53d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_96ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output;

     -- swp[uxn_opcodes_h_l3068_c41_6ad5] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3068_c41_6ad5_phase <= VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_phase;
     swp_uxn_opcodes_h_l3068_c41_6ad5_ins <= VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_ins;
     swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_return_output := swp_uxn_opcodes_h_l3068_c41_6ad5_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output;
     VAR_swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_53d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue := VAR_swp_uxn_opcodes_h_l3068_c41_6ad5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_7cff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_0d9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output;

     -- swp2[uxn_opcodes_h_l3069_c41_1242] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3069_c41_1242_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3069_c41_1242_phase <= VAR_swp2_uxn_opcodes_h_l3069_c41_1242_phase;
     swp2_uxn_opcodes_h_l3069_c41_1242_ins <= VAR_swp2_uxn_opcodes_h_l3069_c41_1242_ins;
     swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3069_c41_1242_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3069_c41_1242_return_output := swp2_uxn_opcodes_h_l3069_c41_1242_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output;
     VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_0d9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue := VAR_swp2_uxn_opcodes_h_l3069_c41_1242_return_output;
     -- rot[uxn_opcodes_h_l3070_c41_a6d5] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3070_c41_a6d5_phase <= VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_phase;
     rot_uxn_opcodes_h_l3070_c41_a6d5_ins <= VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_ins;
     rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_return_output := rot_uxn_opcodes_h_l3070_c41_a6d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_d622] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_3cdf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output;
     VAR_rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_d622_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue := VAR_rot_uxn_opcodes_h_l3070_c41_a6d5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_a112] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_9eb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output;

     -- rot2[uxn_opcodes_h_l3071_c41_619e] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3071_c41_619e_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3071_c41_619e_phase <= VAR_rot2_uxn_opcodes_h_l3071_c41_619e_phase;
     rot2_uxn_opcodes_h_l3071_c41_619e_ins <= VAR_rot2_uxn_opcodes_h_l3071_c41_619e_ins;
     rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3071_c41_619e_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3071_c41_619e_return_output := rot2_uxn_opcodes_h_l3071_c41_619e_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_a112_return_output;
     VAR_dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_9eb2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue := VAR_rot2_uxn_opcodes_h_l3071_c41_619e_return_output;
     -- dup[uxn_opcodes_h_l3072_c41_9188] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3072_c41_9188_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3072_c41_9188_phase <= VAR_dup_uxn_opcodes_h_l3072_c41_9188_phase;
     dup_uxn_opcodes_h_l3072_c41_9188_ins <= VAR_dup_uxn_opcodes_h_l3072_c41_9188_ins;
     dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3072_c41_9188_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3072_c41_9188_return_output := dup_uxn_opcodes_h_l3072_c41_9188_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_09b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_f459] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output;
     VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_f459_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue := VAR_dup_uxn_opcodes_h_l3072_c41_9188_return_output;
     -- dup2[uxn_opcodes_h_l3073_c41_7a1e] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3073_c41_7a1e_phase <= VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_phase;
     dup2_uxn_opcodes_h_l3073_c41_7a1e_ins <= VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_ins;
     dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output := dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_5ac3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_8495] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output;
     VAR_ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_8495_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue := VAR_dup2_uxn_opcodes_h_l3073_c41_7a1e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_eb6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_5968] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output;

     -- ovr[uxn_opcodes_h_l3074_c41_a601] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3074_c41_a601_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3074_c41_a601_phase <= VAR_ovr_uxn_opcodes_h_l3074_c41_a601_phase;
     ovr_uxn_opcodes_h_l3074_c41_a601_ins <= VAR_ovr_uxn_opcodes_h_l3074_c41_a601_ins;
     ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3074_c41_a601_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3074_c41_a601_return_output := ovr_uxn_opcodes_h_l3074_c41_a601_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_5968_return_output;
     VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_eb6b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue := VAR_ovr_uxn_opcodes_h_l3074_c41_a601_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_a3c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output;

     -- ovr2[uxn_opcodes_h_l3075_c41_76a4] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3075_c41_76a4_phase <= VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_phase;
     ovr2_uxn_opcodes_h_l3075_c41_76a4_ins <= VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_ins;
     ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output := ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_2094] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_2094_return_output;
     VAR_equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_a3c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue := VAR_ovr2_uxn_opcodes_h_l3075_c41_76a4_return_output;
     -- equ[uxn_opcodes_h_l3076_c41_4152] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3076_c41_4152_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3076_c41_4152_phase <= VAR_equ_uxn_opcodes_h_l3076_c41_4152_phase;
     equ_uxn_opcodes_h_l3076_c41_4152_ins <= VAR_equ_uxn_opcodes_h_l3076_c41_4152_ins;
     equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3076_c41_4152_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3076_c41_4152_return_output := equ_uxn_opcodes_h_l3076_c41_4152_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_db77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_898e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_db77_return_output;
     VAR_equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_898e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue := VAR_equ_uxn_opcodes_h_l3076_c41_4152_return_output;
     -- equ2[uxn_opcodes_h_l3077_c41_a492] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3077_c41_a492_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3077_c41_a492_phase <= VAR_equ2_uxn_opcodes_h_l3077_c41_a492_phase;
     equ2_uxn_opcodes_h_l3077_c41_a492_ins <= VAR_equ2_uxn_opcodes_h_l3077_c41_a492_ins;
     equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3077_c41_a492_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3077_c41_a492_return_output := equ2_uxn_opcodes_h_l3077_c41_a492_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_67f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_3005] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_3005_return_output;
     VAR_neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_67f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue := VAR_equ2_uxn_opcodes_h_l3077_c41_a492_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_43a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output;

     -- neq[uxn_opcodes_h_l3078_c41_9de9] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3078_c41_9de9_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3078_c41_9de9_phase <= VAR_neq_uxn_opcodes_h_l3078_c41_9de9_phase;
     neq_uxn_opcodes_h_l3078_c41_9de9_ins <= VAR_neq_uxn_opcodes_h_l3078_c41_9de9_ins;
     neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3078_c41_9de9_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3078_c41_9de9_return_output := neq_uxn_opcodes_h_l3078_c41_9de9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_f4ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output;
     VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_f4ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue := VAR_neq_uxn_opcodes_h_l3078_c41_9de9_return_output;
     -- neq2[uxn_opcodes_h_l3079_c41_b99a] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3079_c41_b99a_phase <= VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_phase;
     neq2_uxn_opcodes_h_l3079_c41_b99a_ins <= VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_ins;
     neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_return_output := neq2_uxn_opcodes_h_l3079_c41_b99a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_7402] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_c15d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output;
     VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_7402_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue := VAR_neq2_uxn_opcodes_h_l3079_c41_b99a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_593f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_84b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output;

     -- gth[uxn_opcodes_h_l3080_c41_a6ed] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3080_c41_a6ed_phase <= VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_phase;
     gth_uxn_opcodes_h_l3080_c41_a6ed_ins <= VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_ins;
     gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_return_output := gth_uxn_opcodes_h_l3080_c41_a6ed_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_593f_return_output;
     VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_84b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue := VAR_gth_uxn_opcodes_h_l3080_c41_a6ed_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_41cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_93af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output;

     -- gth2[uxn_opcodes_h_l3081_c41_9b78] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3081_c41_9b78_phase <= VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_phase;
     gth2_uxn_opcodes_h_l3081_c41_9b78_ins <= VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_ins;
     gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_return_output := gth2_uxn_opcodes_h_l3081_c41_9b78_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_93af_return_output;
     VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_41cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue := VAR_gth2_uxn_opcodes_h_l3081_c41_9b78_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_e642] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_aa80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output;

     -- lth[uxn_opcodes_h_l3082_c41_ef3b] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3082_c41_ef3b_phase <= VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_phase;
     lth_uxn_opcodes_h_l3082_c41_ef3b_ins <= VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_ins;
     lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_return_output := lth_uxn_opcodes_h_l3082_c41_ef3b_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output;
     VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_e642_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue := VAR_lth_uxn_opcodes_h_l3082_c41_ef3b_return_output;
     -- lth2[uxn_opcodes_h_l3083_c41_63c9] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3083_c41_63c9_phase <= VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_phase;
     lth2_uxn_opcodes_h_l3083_c41_63c9_ins <= VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_ins;
     lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_return_output := lth2_uxn_opcodes_h_l3083_c41_63c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_4644] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_9371] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_4644_return_output;
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_9371_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue := VAR_lth2_uxn_opcodes_h_l3083_c41_63c9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_4d2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output;

     -- jmp[uxn_opcodes_h_l3084_c41_ce9c] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3084_c41_ce9c_phase <= VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_phase;
     jmp_uxn_opcodes_h_l3084_c41_ce9c_ins <= VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_ins;
     jmp_uxn_opcodes_h_l3084_c41_ce9c_pc <= VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_pc;
     jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output := jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_9bfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output;
     VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_4d2c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue := VAR_jmp_uxn_opcodes_h_l3084_c41_ce9c_return_output;
     -- jmp2[uxn_opcodes_h_l3085_c41_eded] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3085_c41_eded_phase <= VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_phase;
     jmp2_uxn_opcodes_h_l3085_c41_eded_ins <= VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_ins;
     jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_return_output := jmp2_uxn_opcodes_h_l3085_c41_eded_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_22e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_a758] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output;
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_a758_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue := VAR_jmp2_uxn_opcodes_h_l3085_c41_eded_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_4b9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_5db6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output;

     -- jcn[uxn_opcodes_h_l3086_c41_1326] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3086_c41_1326_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3086_c41_1326_phase <= VAR_jcn_uxn_opcodes_h_l3086_c41_1326_phase;
     jcn_uxn_opcodes_h_l3086_c41_1326_ins <= VAR_jcn_uxn_opcodes_h_l3086_c41_1326_ins;
     jcn_uxn_opcodes_h_l3086_c41_1326_pc <= VAR_jcn_uxn_opcodes_h_l3086_c41_1326_pc;
     jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3086_c41_1326_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3086_c41_1326_return_output := jcn_uxn_opcodes_h_l3086_c41_1326_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output;
     VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_5db6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue := VAR_jcn_uxn_opcodes_h_l3086_c41_1326_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_fb9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output;

     -- jcn2[uxn_opcodes_h_l3087_c41_0175] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3087_c41_0175_phase <= VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_phase;
     jcn2_uxn_opcodes_h_l3087_c41_0175_ins <= VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_ins;
     jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_return_output := jcn2_uxn_opcodes_h_l3087_c41_0175_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_3b7d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output;
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_3b7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue := VAR_jcn2_uxn_opcodes_h_l3087_c41_0175_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_2700] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output;

     -- jsr[uxn_opcodes_h_l3088_c41_c74b] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3088_c41_c74b_phase <= VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_phase;
     jsr_uxn_opcodes_h_l3088_c41_c74b_ins <= VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_ins;
     jsr_uxn_opcodes_h_l3088_c41_c74b_pc <= VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_pc;
     jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_return_output := jsr_uxn_opcodes_h_l3088_c41_c74b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_a163] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_2700_return_output;
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_a163_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue := VAR_jsr_uxn_opcodes_h_l3088_c41_c74b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_c19c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_4ad9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output;

     -- jsr2[uxn_opcodes_h_l3089_c41_ba85] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3089_c41_ba85_phase <= VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_phase;
     jsr2_uxn_opcodes_h_l3089_c41_ba85_ins <= VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_ins;
     jsr2_uxn_opcodes_h_l3089_c41_ba85_pc <= VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_pc;
     jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output := jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output;
     VAR_sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_4ad9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue := VAR_jsr2_uxn_opcodes_h_l3089_c41_ba85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_23a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_1ae1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output;

     -- sth[uxn_opcodes_h_l3090_c41_76ba] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3090_c41_76ba_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3090_c41_76ba_phase <= VAR_sth_uxn_opcodes_h_l3090_c41_76ba_phase;
     sth_uxn_opcodes_h_l3090_c41_76ba_ins <= VAR_sth_uxn_opcodes_h_l3090_c41_76ba_ins;
     sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3090_c41_76ba_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3090_c41_76ba_return_output := sth_uxn_opcodes_h_l3090_c41_76ba_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output;
     VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_23a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue := VAR_sth_uxn_opcodes_h_l3090_c41_76ba_return_output;
     -- sth2[uxn_opcodes_h_l3091_c41_c09c] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3091_c41_c09c_phase <= VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_phase;
     sth2_uxn_opcodes_h_l3091_c41_c09c_ins <= VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_ins;
     sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_return_output := sth2_uxn_opcodes_h_l3091_c41_c09c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_2d27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_f23a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output;
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_2d27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue := VAR_sth2_uxn_opcodes_h_l3091_c41_c09c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_a667] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output;

     -- ldz[uxn_opcodes_h_l3092_c41_82d8] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3092_c41_82d8_phase <= VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_phase;
     ldz_uxn_opcodes_h_l3092_c41_82d8_ins <= VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_ins;
     ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_stack_read;
     ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_return_output := ldz_uxn_opcodes_h_l3092_c41_82d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_82ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output;
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_a667_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue := VAR_ldz_uxn_opcodes_h_l3092_c41_82d8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_0689] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output;

     -- ldz2[uxn_opcodes_h_l3093_c41_2202] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3093_c41_2202_phase <= VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_phase;
     ldz2_uxn_opcodes_h_l3093_c41_2202_ins <= VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_ins;
     ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_stack_read;
     ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_return_output := ldz2_uxn_opcodes_h_l3093_c41_2202_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_2b5c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output;
     VAR_stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_0689_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue := VAR_ldz2_uxn_opcodes_h_l3093_c41_2202_return_output;
     -- stz[uxn_opcodes_h_l3094_c41_3df9] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3094_c41_3df9_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3094_c41_3df9_phase <= VAR_stz_uxn_opcodes_h_l3094_c41_3df9_phase;
     stz_uxn_opcodes_h_l3094_c41_3df9_ins <= VAR_stz_uxn_opcodes_h_l3094_c41_3df9_ins;
     stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3094_c41_3df9_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3094_c41_3df9_return_output := stz_uxn_opcodes_h_l3094_c41_3df9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_4980] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_d22b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output;
     VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_4980_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue := VAR_stz_uxn_opcodes_h_l3094_c41_3df9_return_output;
     -- stz2[uxn_opcodes_h_l3095_c41_6ad9] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3095_c41_6ad9_phase <= VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_phase;
     stz2_uxn_opcodes_h_l3095_c41_6ad9_ins <= VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_ins;
     stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output := stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_d463] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_cd30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output;
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_d463_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue := VAR_stz2_uxn_opcodes_h_l3095_c41_6ad9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_c398] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_ae8c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output;

     -- ldr[uxn_opcodes_h_l3096_c41_1879] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3096_c41_1879_phase <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_phase;
     ldr_uxn_opcodes_h_l3096_c41_1879_ins <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_ins;
     ldr_uxn_opcodes_h_l3096_c41_1879_pc <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_pc;
     ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_stack_read;
     ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3096_c41_1879_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3096_c41_1879_return_output := ldr_uxn_opcodes_h_l3096_c41_1879_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output;
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_c398_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue := VAR_ldr_uxn_opcodes_h_l3096_c41_1879_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_a4f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_65ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output;

     -- ldr2[uxn_opcodes_h_l3097_c41_56ff] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3097_c41_56ff_phase <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_phase;
     ldr2_uxn_opcodes_h_l3097_c41_56ff_ins <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_ins;
     ldr2_uxn_opcodes_h_l3097_c41_56ff_pc <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_pc;
     ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_stack_read;
     ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output := ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output;
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_a4f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue := VAR_ldr2_uxn_opcodes_h_l3097_c41_56ff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_909e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output;

     -- str1[uxn_opcodes_h_l3098_c41_d477] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3098_c41_d477_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3098_c41_d477_phase <= VAR_str1_uxn_opcodes_h_l3098_c41_d477_phase;
     str1_uxn_opcodes_h_l3098_c41_d477_ins <= VAR_str1_uxn_opcodes_h_l3098_c41_d477_ins;
     str1_uxn_opcodes_h_l3098_c41_d477_pc <= VAR_str1_uxn_opcodes_h_l3098_c41_d477_pc;
     str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3098_c41_d477_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3098_c41_d477_return_output := str1_uxn_opcodes_h_l3098_c41_d477_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_377a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_377a_return_output;
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_909e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue := VAR_str1_uxn_opcodes_h_l3098_c41_d477_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_5628] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output;

     -- str2[uxn_opcodes_h_l3099_c41_8026] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3099_c41_8026_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3099_c41_8026_phase <= VAR_str2_uxn_opcodes_h_l3099_c41_8026_phase;
     str2_uxn_opcodes_h_l3099_c41_8026_ins <= VAR_str2_uxn_opcodes_h_l3099_c41_8026_ins;
     str2_uxn_opcodes_h_l3099_c41_8026_pc <= VAR_str2_uxn_opcodes_h_l3099_c41_8026_pc;
     str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3099_c41_8026_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3099_c41_8026_return_output := str2_uxn_opcodes_h_l3099_c41_8026_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_82e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output;
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_5628_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue := VAR_str2_uxn_opcodes_h_l3099_c41_8026_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_0ff9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output;

     -- lda[uxn_opcodes_h_l3100_c41_76e0] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3100_c41_76e0_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3100_c41_76e0_phase <= VAR_lda_uxn_opcodes_h_l3100_c41_76e0_phase;
     lda_uxn_opcodes_h_l3100_c41_76e0_ins <= VAR_lda_uxn_opcodes_h_l3100_c41_76e0_ins;
     lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_stack_read;
     lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3100_c41_76e0_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3100_c41_76e0_return_output := lda_uxn_opcodes_h_l3100_c41_76e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_137a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output;
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_137a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue := VAR_lda_uxn_opcodes_h_l3100_c41_76e0_return_output;
     -- lda2[uxn_opcodes_h_l3101_c41_e5de] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3101_c41_e5de_phase <= VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_phase;
     lda2_uxn_opcodes_h_l3101_c41_e5de_ins <= VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_ins;
     lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_stack_read;
     lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_return_output := lda2_uxn_opcodes_h_l3101_c41_e5de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_4487] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_1f74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_4487_return_output;
     VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_1f74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue := VAR_lda2_uxn_opcodes_h_l3101_c41_e5de_return_output;
     -- sta[uxn_opcodes_h_l3102_c41_a5bb] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3102_c41_a5bb_phase <= VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_phase;
     sta_uxn_opcodes_h_l3102_c41_a5bb_ins <= VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_ins;
     sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_return_output := sta_uxn_opcodes_h_l3102_c41_a5bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_60fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_5d3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output;
     VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_5d3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue := VAR_sta_uxn_opcodes_h_l3102_c41_a5bb_return_output;
     -- sta2[uxn_opcodes_h_l3103_c41_fdcc] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3103_c41_fdcc_phase <= VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_phase;
     sta2_uxn_opcodes_h_l3103_c41_fdcc_ins <= VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_ins;
     sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output := sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_3799] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_7fc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_3799_return_output;
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_7fc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue := VAR_sta2_uxn_opcodes_h_l3103_c41_fdcc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_2486] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output;

     -- dei[uxn_opcodes_h_l3104_c41_a285] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3104_c41_a285_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3104_c41_a285_phase <= VAR_dei_uxn_opcodes_h_l3104_c41_a285_phase;
     dei_uxn_opcodes_h_l3104_c41_a285_ins <= VAR_dei_uxn_opcodes_h_l3104_c41_a285_ins;
     dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_stack_read;
     dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3104_c41_a285_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3104_c41_a285_return_output := dei_uxn_opcodes_h_l3104_c41_a285_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_05f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output;
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_2486_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue := VAR_dei_uxn_opcodes_h_l3104_c41_a285_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_9082] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output;

     -- dei2[uxn_opcodes_h_l3105_c41_8708] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3105_c41_8708_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3105_c41_8708_phase <= VAR_dei2_uxn_opcodes_h_l3105_c41_8708_phase;
     dei2_uxn_opcodes_h_l3105_c41_8708_ins <= VAR_dei2_uxn_opcodes_h_l3105_c41_8708_ins;
     dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_stack_read;
     dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3105_c41_8708_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3105_c41_8708_return_output := dei2_uxn_opcodes_h_l3105_c41_8708_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_6c8f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output;
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_9082_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue := VAR_dei2_uxn_opcodes_h_l3105_c41_8708_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_90ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_2c77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output;

     -- deo[uxn_opcodes_h_l3106_c41_0642] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3106_c41_0642_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3106_c41_0642_phase <= VAR_deo_uxn_opcodes_h_l3106_c41_0642_phase;
     deo_uxn_opcodes_h_l3106_c41_0642_ins <= VAR_deo_uxn_opcodes_h_l3106_c41_0642_ins;
     deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_stack_read;
     deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3106_c41_0642_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3106_c41_0642_return_output := deo_uxn_opcodes_h_l3106_c41_0642_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output;
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_90ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue := VAR_deo_uxn_opcodes_h_l3106_c41_0642_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_9bbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_05a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output;

     -- deo2[uxn_opcodes_h_l3107_c41_0fdb] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3107_c41_0fdb_phase <= VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_phase;
     deo2_uxn_opcodes_h_l3107_c41_0fdb_ins <= VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_ins;
     deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_stack_read;
     deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output := deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output;
     VAR_add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_9bbc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue := VAR_deo2_uxn_opcodes_h_l3107_c41_0fdb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_f0a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_7238] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output;

     -- add[uxn_opcodes_h_l3108_c41_ac18] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3108_c41_ac18_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3108_c41_ac18_phase <= VAR_add_uxn_opcodes_h_l3108_c41_ac18_phase;
     add_uxn_opcodes_h_l3108_c41_ac18_ins <= VAR_add_uxn_opcodes_h_l3108_c41_ac18_ins;
     add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read <= VAR_add_uxn_opcodes_h_l3108_c41_ac18_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3108_c41_ac18_return_output := add_uxn_opcodes_h_l3108_c41_ac18_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output;
     VAR_add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_7238_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue := VAR_add_uxn_opcodes_h_l3108_c41_ac18_return_output;
     -- add2[uxn_opcodes_h_l3109_c41_2b09] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3109_c41_2b09_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3109_c41_2b09_phase <= VAR_add2_uxn_opcodes_h_l3109_c41_2b09_phase;
     add2_uxn_opcodes_h_l3109_c41_2b09_ins <= VAR_add2_uxn_opcodes_h_l3109_c41_2b09_ins;
     add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3109_c41_2b09_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3109_c41_2b09_return_output := add2_uxn_opcodes_h_l3109_c41_2b09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_0607] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_d35a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output;
     VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_0607_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue := VAR_add2_uxn_opcodes_h_l3109_c41_2b09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_2b3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output;

     -- sub[uxn_opcodes_h_l3110_c41_8a1d] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3110_c41_8a1d_phase <= VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_phase;
     sub_uxn_opcodes_h_l3110_c41_8a1d_ins <= VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_ins;
     sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_return_output := sub_uxn_opcodes_h_l3110_c41_8a1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_bfd4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output;
     VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_2b3b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue := VAR_sub_uxn_opcodes_h_l3110_c41_8a1d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_b44f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output;

     -- sub2[uxn_opcodes_h_l3111_c41_ad08] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3111_c41_ad08_phase <= VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_phase;
     sub2_uxn_opcodes_h_l3111_c41_ad08_ins <= VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_ins;
     sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_return_output := sub2_uxn_opcodes_h_l3111_c41_ad08_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_94dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output;
     VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_94dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue := VAR_sub2_uxn_opcodes_h_l3111_c41_ad08_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_4cc9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_c4ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output;

     -- mul[uxn_opcodes_h_l3112_c41_9c5a] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3112_c41_9c5a_phase <= VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_phase;
     mul_uxn_opcodes_h_l3112_c41_9c5a_ins <= VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_ins;
     mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_return_output := mul_uxn_opcodes_h_l3112_c41_9c5a_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output;
     VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_4cc9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue := VAR_mul_uxn_opcodes_h_l3112_c41_9c5a_return_output;
     -- mul2[uxn_opcodes_h_l3113_c41_1c79] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3113_c41_1c79_phase <= VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_phase;
     mul2_uxn_opcodes_h_l3113_c41_1c79_ins <= VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_ins;
     mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_return_output := mul2_uxn_opcodes_h_l3113_c41_1c79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_edda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_c82e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_edda_return_output;
     VAR_div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_c82e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue := VAR_mul2_uxn_opcodes_h_l3113_c41_1c79_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_035a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_d532] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output;

     -- div[uxn_opcodes_h_l3114_c41_1d3a] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3114_c41_1d3a_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3114_c41_1d3a_phase <= VAR_div_uxn_opcodes_h_l3114_c41_1d3a_phase;
     div_uxn_opcodes_h_l3114_c41_1d3a_ins <= VAR_div_uxn_opcodes_h_l3114_c41_1d3a_ins;
     div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read <= VAR_div_uxn_opcodes_h_l3114_c41_1d3a_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3114_c41_1d3a_return_output := div_uxn_opcodes_h_l3114_c41_1d3a_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_d532_return_output;
     VAR_div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_035a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue := VAR_div_uxn_opcodes_h_l3114_c41_1d3a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_40cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output;

     -- div2[uxn_opcodes_h_l3115_c41_3e66] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3115_c41_3e66_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3115_c41_3e66_phase <= VAR_div2_uxn_opcodes_h_l3115_c41_3e66_phase;
     div2_uxn_opcodes_h_l3115_c41_3e66_ins <= VAR_div2_uxn_opcodes_h_l3115_c41_3e66_ins;
     div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3115_c41_3e66_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3115_c41_3e66_return_output := div2_uxn_opcodes_h_l3115_c41_3e66_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_2ad9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output;
     VAR_and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_40cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue := VAR_div2_uxn_opcodes_h_l3115_c41_3e66_return_output;
     -- and[uxn_opcodes_h_l3116_c41_f936] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3116_c41_f936_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3116_c41_f936_phase <= VAR_and_uxn_opcodes_h_l3116_c41_f936_phase;
     and_uxn_opcodes_h_l3116_c41_f936_ins <= VAR_and_uxn_opcodes_h_l3116_c41_f936_ins;
     and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read <= VAR_and_uxn_opcodes_h_l3116_c41_f936_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3116_c41_f936_return_output := and_uxn_opcodes_h_l3116_c41_f936_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_ddcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_4fd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output;
     VAR_and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_ddcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue := VAR_and_uxn_opcodes_h_l3116_c41_f936_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_b139] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_9fcb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output;

     -- and2[uxn_opcodes_h_l3117_c41_e14c] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3117_c41_e14c_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3117_c41_e14c_phase <= VAR_and2_uxn_opcodes_h_l3117_c41_e14c_phase;
     and2_uxn_opcodes_h_l3117_c41_e14c_ins <= VAR_and2_uxn_opcodes_h_l3117_c41_e14c_ins;
     and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3117_c41_e14c_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3117_c41_e14c_return_output := and2_uxn_opcodes_h_l3117_c41_e14c_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_b139_return_output;
     VAR_ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_9fcb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue := VAR_and2_uxn_opcodes_h_l3117_c41_e14c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_9049] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output;

     -- ora[uxn_opcodes_h_l3118_c41_c1af] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3118_c41_c1af_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3118_c41_c1af_phase <= VAR_ora_uxn_opcodes_h_l3118_c41_c1af_phase;
     ora_uxn_opcodes_h_l3118_c41_c1af_ins <= VAR_ora_uxn_opcodes_h_l3118_c41_c1af_ins;
     ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3118_c41_c1af_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3118_c41_c1af_return_output := ora_uxn_opcodes_h_l3118_c41_c1af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c7_8f86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output;
     VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_9049_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue := VAR_ora_uxn_opcodes_h_l3118_c41_c1af_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_387c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c7_c902] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output;

     -- ora2[uxn_opcodes_h_l3119_c41_bc5a] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3119_c41_bc5a_phase <= VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_phase;
     ora2_uxn_opcodes_h_l3119_c41_bc5a_ins <= VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_ins;
     ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output := ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c7_c902_return_output;
     VAR_eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_387c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue := VAR_ora2_uxn_opcodes_h_l3119_c41_bc5a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3121_c1_376c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c7_f457] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output;

     -- eor[uxn_opcodes_h_l3120_c41_c204] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3120_c41_c204_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3120_c41_c204_phase <= VAR_eor_uxn_opcodes_h_l3120_c41_c204_phase;
     eor_uxn_opcodes_h_l3120_c41_c204_ins <= VAR_eor_uxn_opcodes_h_l3120_c41_c204_ins;
     eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3120_c41_c204_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3120_c41_c204_return_output := eor_uxn_opcodes_h_l3120_c41_c204_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c7_f457_return_output;
     VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3121_c1_376c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue := VAR_eor_uxn_opcodes_h_l3120_c41_c204_return_output;
     -- eor2[uxn_opcodes_h_l3121_c41_bfc2] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3121_c41_bfc2_phase <= VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_phase;
     eor2_uxn_opcodes_h_l3121_c41_bfc2_ins <= VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_ins;
     eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output := eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3122_c1_8b53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c7_4925] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c7_4925_return_output;
     VAR_sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3122_c1_8b53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue := VAR_eor2_uxn_opcodes_h_l3121_c41_bfc2_return_output;
     -- sft[uxn_opcodes_h_l3122_c41_a815] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3122_c41_a815_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3122_c41_a815_phase <= VAR_sft_uxn_opcodes_h_l3122_c41_a815_phase;
     sft_uxn_opcodes_h_l3122_c41_a815_ins <= VAR_sft_uxn_opcodes_h_l3122_c41_a815_ins;
     sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3122_c41_a815_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3122_c41_a815_return_output := sft_uxn_opcodes_h_l3122_c41_a815_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3124_c1_aec6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3123_c1_ea37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3124_c1_aec6_return_output;
     VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3123_c1_ea37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue := VAR_sft_uxn_opcodes_h_l3122_c41_a815_return_output;
     -- sft2[uxn_opcodes_h_l3123_c41_4d22] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3123_c41_4d22_phase <= VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_phase;
     sft2_uxn_opcodes_h_l3123_c41_4d22_ins <= VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_ins;
     sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_return_output := sft2_uxn_opcodes_h_l3123_c41_4d22_return_output;

     -- printf_uxn_opcodes_h_l3124_c9_5b17[uxn_opcodes_h_l3124_c9_5b17] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0 <= VAR_printf_uxn_opcodes_h_l3124_c9_5b17_uxn_opcodes_h_l3124_c9_5b17_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue := VAR_sft2_uxn_opcodes_h_l3123_c41_4d22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3123_c7_4925] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_cond;
     opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output := opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3123_c7_4925_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3122_c7_f457] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_cond;
     opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output := opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3122_c7_f457_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3121_c7_c902] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_cond;
     opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output := opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3121_c7_c902_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3120_c7_8f86] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_cond;
     opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output := opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3120_c7_8f86_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3119_c7_b139] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_cond;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output := opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_b139_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3118_c7_4fd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_cond;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output := opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_4fd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3117_c7_2ad9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_cond;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output := opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_2ad9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3116_c7_d532] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_cond;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output := opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_d532_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3115_c7_edda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_cond;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output := opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_edda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3114_c7_c4ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_cond;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output := opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_c4ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3113_c7_b44f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_cond;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output := opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_b44f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3112_c7_bfd4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_cond;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output := opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_bfd4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3111_c7_d35a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_cond;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output := opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_d35a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3110_c7_f0a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_cond;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output := opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_f0a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3109_c7_05a8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_cond;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output := opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_05a8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3108_c7_2c77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_cond;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output := opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2c77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3107_c7_6c8f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_cond;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output := opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_6c8f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3106_c7_05f8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_cond;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output := opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_05f8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3105_c7_3799] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_cond;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output := opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_3799_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3104_c7_60fb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_cond;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output := opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_60fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3103_c7_4487] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_cond;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output := opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_4487_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3102_c7_0ff9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_cond;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output := opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_0ff9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3101_c7_82e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_cond;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output := opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_82e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3100_c7_377a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_cond;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output := opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_377a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3099_c7_65ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_cond;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output := opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_65ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3098_c7_ae8c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_cond;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output := opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_ae8c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3097_c7_cd30] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_cond;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output := opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_cd30_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3096_c7_d22b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_cond;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output := opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_d22b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3095_c7_2b5c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_cond;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output := opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_2b5c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3094_c7_82ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_cond;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output := opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_82ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3093_c7_f23a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_cond;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output := opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_f23a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3092_c7_1ae1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_cond;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output := opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_1ae1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3091_c7_c19c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_cond;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output := opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_c19c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3090_c7_2700] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_cond;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output := opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_2700_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3089_c7_fb9a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_cond;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output := opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_fb9a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3088_c7_4b9a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_cond;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output := opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_4b9a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3087_c7_22e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_cond;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output := opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_22e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3086_c7_9bfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_cond;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output := opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_9bfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3085_c7_4644] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_cond;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output := opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_4644_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3084_c7_aa80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_cond;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output := opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_aa80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3083_c7_93af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_cond;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output := opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_93af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3082_c7_593f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_cond;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output := opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_593f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3081_c7_c15d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_cond;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output := opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_c15d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3080_c7_43a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_cond;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output := opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_43a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3079_c7_3005] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_cond;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output := opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_3005_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3078_c7_db77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_cond;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output := opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_db77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3077_c7_2094] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_cond;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output := opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_2094_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3076_c7_5968] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_cond;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output := opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_5968_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3075_c7_5ac3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_cond;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output := opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_5ac3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3074_c7_09b3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_cond;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output := opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_09b3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3073_c7_a112] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_cond;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output := opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_a112_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3072_c7_3cdf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_cond;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output := opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_3cdf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3071_c7_7cff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_cond;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output := opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_7cff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3070_c7_96ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_cond;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output := opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_96ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3069_c7_56ed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_cond;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output := opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_56ed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3068_c7_d29a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_cond;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output := opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_d29a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3067_c7_1c75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_cond;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output := opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_1c75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3066_c7_80b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_cond;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output := opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_80b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3065_c7_574b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_cond;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output := opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_574b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3064_c7_d87a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_cond;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output := opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_d87a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3063_c7_1d2e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_cond;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output := opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_1d2e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3062_c7_a1de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_cond;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output := opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_a1de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3061_c7_8fb9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_cond;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output := opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_8fb9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3060_c7_ae72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_cond;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output := opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_ae72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3059_c7_9adb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_cond;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output := opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_9adb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3058_c7_f153] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_cond;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output := opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_f153_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3057_c7_ff33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_cond;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output := opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_ff33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3056_c7_0b9f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_cond;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output := opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_0b9f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3055_c7_88ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_cond;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output := opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_88ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3054_c2_865f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_cond;
     opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output := opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3142_l3154_DUPLICATE_b4ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3142_l3154_DUPLICATE_b4ef_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3148_c34_d009] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_d009_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_pc_updated;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3153_c33_5743] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_5743_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3151_c34_b1bb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_b1bb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3150_c33_325f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_325f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3152_c37_a27e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_a27e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l3127_c17_cfae] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3127_c17_cfae_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3131_l3133_DUPLICATE_0753 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3131_l3133_DUPLICATE_0753_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3155_c32_67e0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_67e0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3146_c39_ce38] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3146_c39_ce38_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3137_c70_c442] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3137_c70_c442_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l3149_c30_e98f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_e98f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3147_c40_2463] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3147_c40_2463_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3129_c6_98f3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3129_c6_98f3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3143_c3_05fe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3143_c3_05fe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c2_865f_return_output.is_stack_write;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3129_c6_98f3_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3129_c6_98f3_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3127_c17_cfae_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3143_c3_05fe_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3142_l3154_DUPLICATE_b4ef_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l3127_c2_8c64] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_left;
     BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output := BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3034_l3157_DUPLICATE_456f LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3034_l3157_DUPLICATE_456f_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53(
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3146_c39_ce38_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3147_c40_2463_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_d009_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_e98f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_325f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_b1bb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_a27e_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_5743_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3142_l3154_DUPLICATE_b4ef_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_67e0_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3131_DUPLICATE_8a5d LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3131_DUPLICATE_8a5d_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3131_l3133_DUPLICATE_0753_return_output);

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3137_c59_55cf] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c59_55cf_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3137_c70_c442_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l3137_c30_f259_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;
     VAR_MUX_uxn_opcodes_h_l3138_c20_1330_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l3127_c2_8c64_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3131_DUPLICATE_8a5d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3133_l3131_DUPLICATE_8a5d_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c59_55cf_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3034_l3157_DUPLICATE_456f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_aa53_uxn_opcodes_h_l3034_l3157_DUPLICATE_456f_return_output;
     -- MUX[uxn_opcodes_h_l3138_c20_1330] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3138_c20_1330_cond <= VAR_MUX_uxn_opcodes_h_l3138_c20_1330_cond;
     MUX_uxn_opcodes_h_l3138_c20_1330_iftrue <= VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iftrue;
     MUX_uxn_opcodes_h_l3138_c20_1330_iffalse <= VAR_MUX_uxn_opcodes_h_l3138_c20_1330_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3138_c20_1330_return_output := MUX_uxn_opcodes_h_l3138_c20_1330_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3131_c4_fa92] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3133_c4_2bc3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l3131_c4_8d2f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3131_c4_fa92_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3133_c4_43d4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3133_c4_2bc3_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right := VAR_MUX_uxn_opcodes_h_l3138_c20_1330_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse := VAR_sp0_uxn_opcodes_h_l3133_c4_43d4;
     VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue := VAR_sp1_uxn_opcodes_h_l3131_c4_8d2f;
     -- sp0_MUX[uxn_opcodes_h_l3130_c3_b258] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_cond;
     sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue;
     sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output := sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3130_c3_b258] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_cond;
     sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iftrue;
     sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output := sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3130_c3_b258_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3130_c3_b258_return_output;
     -- sp0_MUX[uxn_opcodes_h_l3129_c2_2fe1] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond;
     sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue;
     sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output := sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3129_c2_2fe1] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_cond;
     sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iftrue;
     sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output := sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;
     VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3129_c2_2fe1_return_output;
     -- MUX[uxn_opcodes_h_l3137_c30_f259] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3137_c30_f259_cond <= VAR_MUX_uxn_opcodes_h_l3137_c30_f259_cond;
     MUX_uxn_opcodes_h_l3137_c30_f259_iftrue <= VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iftrue;
     MUX_uxn_opcodes_h_l3137_c30_f259_iffalse <= VAR_MUX_uxn_opcodes_h_l3137_c30_f259_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3137_c30_f259_return_output := MUX_uxn_opcodes_h_l3137_c30_f259_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3137_c19_3e98] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c19_3e98_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l3137_c30_f259_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3137_c19_3e98_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3137_c19_eeeb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l3137_c19_eeeb_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3138_c2_8353] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l3138_c2_b1e5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3138_c2_8353_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3138_c2_b1e5;
     VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address := VAR_stack_address_uxn_opcodes_h_l3138_c2_b1e5;
     -- stack_ram_update[uxn_opcodes_h_l3140_c21_3172] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_stack_address;
     stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value <= VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_value;
     stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output := stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3140_c21_3172_return_output;
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
