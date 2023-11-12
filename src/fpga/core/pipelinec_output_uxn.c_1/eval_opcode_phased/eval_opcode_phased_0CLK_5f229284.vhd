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
entity eval_opcode_phased_0CLK_5f229284 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_5f229284;
architecture arch of eval_opcode_phased_0CLK_5f229284 is
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
vram_address => to_unsigned(0, 32),
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
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(11 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2704_c10_8665]
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2704_c10_b535]
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2704_c41_51e8]
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2704_c57_e349]
signal CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2704_c10_f678]
signal MUX_uxn_opcodes_h_l2704_c10_f678_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_f678_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_f678_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_f678_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l2706_c2_33d1[uxn_opcodes_h_l2706_c2_33d1]
signal printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_26f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_12b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_2a13]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2708_c2_c216]
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2708_c2_c216]
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2708_c23_ee3f[uxn_opcodes_h_l2708_c23_ee3f]
signal printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_1418]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_9a7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_0ddc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2709_c7_2a13]
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2709_c41_a2a2]
signal jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_a2a2_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_a2a2_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_a2a2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_9e01]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_094b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_57b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2710_c7_0ddc]
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2710_c41_be3d]
signal jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_be3d_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_be3d_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_be3d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_99f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_b9b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_8a96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2711_c7_57b6]
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2711_c41_6fbb]
signal jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_6fbb_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_6fbb_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_3435]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_425c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_455b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2712_c7_8a96]
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2712_c41_cbd4]
signal lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_cbd4_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_cbd4_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_cbd4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_65ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_370b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_64b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2713_c7_455b]
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2713_c41_4eec]
signal lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_4eec_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_4eec_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_4eec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_cfb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_b4a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_c381]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2714_c7_64b1]
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2714_c41_ea44]
signal lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_ea44_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_ea44_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_ea44_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b52e]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_5ff2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_1a0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2715_c7_c381]
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2715_c41_255f]
signal lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_255f_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_255f_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_255f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_94d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_1843]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_64af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2716_c7_1a0c]
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2716_c41_9b82]
signal inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_9b82_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_9b82_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_9b82_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_41b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_66a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_855e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2717_c7_64af]
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2717_c41_2bb3]
signal inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_2bb3_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_2bb3_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_88e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_79ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_8f9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2718_c7_855e]
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2718_c41_dea0]
signal pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_dea0_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_dea0_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_dea0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_b3a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_437e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_08a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c7_8f9c]
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2719_c41_48d4]
signal pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_48d4_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_48d4_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_48d4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_3f71]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_e799]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_ff3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_08a0]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2720_c41_ffa0]
signal nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_ffa0_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_ffa0_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_ffa0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_4338]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_5156]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_78f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_ff3a]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2721_c41_17aa]
signal nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_17aa_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_17aa_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_17aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_7c69]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_b28b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_67d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_78f9]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2722_c41_2ad9]
signal swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_2ad9_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_2ad9_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_2ad9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_91c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_4c97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_2056]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_67d8]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2723_c41_851d]
signal swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_851d_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_851d_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_851d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_12bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_dce8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_ad64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_2056]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2724_c41_1e16]
signal rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_1e16_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_1e16_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_1e16_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_5c39]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_3527]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_2002]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_ad64]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2725_c41_731d]
signal rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_731d_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_731d_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_731d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_3027]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_4dff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_5fc7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_2002]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2726_c41_43a6]
signal dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_43a6_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_43a6_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_43a6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_57a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_925d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_011d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_5fc7]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2727_c41_415f]
signal dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_415f_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_415f_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_415f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_f32b]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_4e12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_0811]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_011d]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2728_c41_cf3f]
signal ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_cf3f_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_cf3f_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_a14c]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_583f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_0eac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_0811]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2729_c41_5105]
signal ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_5105_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_5105_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_5105_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_cc7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_cda7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_1963]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_0eac]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2730_c41_379c]
signal equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_379c_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_379c_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_379c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0a69]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_c475]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_fd8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_1963]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2731_c41_f68b]
signal equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_f68b_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_f68b_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_f68b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_5a02]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_ce8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_a255]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_fd8e]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2732_c41_fe8b]
signal neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_fe8b_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_fe8b_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_fe8b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_baba]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_00d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_2a26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_a255]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2733_c41_4c5a]
signal neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_4c5a_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_4c5a_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_7d3d]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_23d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_0b2f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_2a26]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2734_c41_133f]
signal gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_133f_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_133f_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_133f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_f0f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_d4cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_d676]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_0b2f]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2735_c41_4aa5]
signal gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_4aa5_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_4aa5_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_22d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_099c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_ae56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_d676]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2736_c41_9b61]
signal lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_9b61_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_9b61_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_9b61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_c479]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_787e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_cf91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_ae56]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2737_c41_d9ed]
signal lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_d9ed_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_d9ed_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_3791]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_e093]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_4a61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_cf91]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2738_c41_3e91]
signal jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_3e91_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_3e91_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_3e91_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_3e91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_f332]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_1e38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_2625]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_4a61]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2739_c41_2726]
signal jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_2726_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_2726_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_2726_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_842f]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_a6de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_6c4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_2625]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2740_c41_294d]
signal jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_294d_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_294d_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_294d_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_294d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_039c]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_7cf0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5bdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_6c4e]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2741_c41_4d83]
signal jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_4d83_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_4d83_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_3028]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_299a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_fc69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_5bdd]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2742_c41_a6d5]
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_3f95]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_625c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_3def]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_fc69]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2743_c41_0aff]
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_1e70]
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_dac0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_0a91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2744_c7_3def]
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2744_c41_c304]
signal sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_c304_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_c304_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_c304_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_cdef]
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_2522]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_44af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2745_c7_0a91]
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2745_c41_047e]
signal sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_047e_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_047e_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_047e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_9e09]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_12ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_d64c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2746_c7_44af]
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2746_c41_59bf]
signal ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_59bf_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_59bf_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_59bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_7656]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_2ad8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_f5f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2747_c7_d64c]
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2747_c41_83b2]
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_5f28]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_2af8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_695d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2748_c7_f5f6]
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2748_c41_df8c]
signal stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_df8c_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_df8c_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_df8c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_90c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_aefa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_6825]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2749_c7_695d]
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2749_c41_cd09]
signal stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_cd09_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_cd09_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_cd09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_f930]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_bda7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_a562]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2750_c7_6825]
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2750_c41_3742]
signal ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_3742_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_fa20]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_0029]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_0617]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2751_c7_a562]
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2751_c41_97ee]
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_183d]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_8d5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_221f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2752_c7_0617]
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2752_c41_4932]
signal str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_4932_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_4932_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_4932_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_4932_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_af80]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_8927]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_7833]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2753_c7_221f]
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2753_c41_fcc7]
signal str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_fcc7_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_fcc7_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_fcc7_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_fcc7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_211d]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_70ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_80e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2754_c7_7833]
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2754_c41_ccf6]
signal lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_ccf6_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_ccf6_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_ccf6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_c4d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_742b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_e91e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2755_c7_80e3]
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2755_c41_c1a6]
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_2a08]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_03b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_ce98]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2756_c7_e91e]
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2756_c41_29d9]
signal sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_29d9_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_29d9_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_29d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_3d60]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_6e4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_94dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2757_c7_ce98]
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2757_c41_0c4f]
signal sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_0c4f_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_0c4f_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_12f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_6e42]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_177f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2758_c7_94dc]
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2758_c41_c641]
signal dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_c641_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_c641_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_c641_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_f156]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_1489]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_de0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2759_c7_177f]
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2759_c41_c0d9]
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_bdc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_aea1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_21ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2760_c7_de0c]
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2760_c41_7fba]
signal deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_7fba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_cd82]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_56d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_5831]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2761_c7_21ae]
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2761_c41_78c6]
signal deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_78c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_87f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_dab2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_c666]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2762_c7_5831]
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2762_c41_7897]
signal add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2762_c41_7897_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_7897_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_7897_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_90cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_7339]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_561b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2763_c7_c666]
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2763_c41_5bc9]
signal add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_5bc9_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_5bc9_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_5bc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_a4d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_9967]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_0048]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2764_c7_561b]
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2764_c41_8871]
signal sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_8871_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_8871_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_8871_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_fda7]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_3107]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_c81a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2765_c7_0048]
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2765_c41_ff9e]
signal sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ff9e_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ff9e_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_45b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_d993]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_e535]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2766_c7_c81a]
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2766_c41_342d]
signal mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_342d_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_342d_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_342d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_a557]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_d474]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_b72f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2767_c7_e535]
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2767_c41_5244]
signal mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_5244_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_5244_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_5244_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_005f]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_f1e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_7303]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2768_c7_b72f]
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2768_c41_88d7]
signal div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2768_c41_88d7_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_88d7_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_88d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_229a]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_2fe7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_df84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2769_c7_7303]
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2769_c41_941d]
signal div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_941d_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_941d_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_941d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_ccbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_3728]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_1b83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2770_c7_df84]
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2770_c41_638f]
signal and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2770_c41_638f_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_638f_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_638f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_24c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_c99f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_e810]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2771_c7_1b83]
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2771_c41_3f58]
signal and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_3f58_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_3f58_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_3f58_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_a701]
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_b3f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_bd7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2772_c7_e810]
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2772_c41_118b]
signal ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_118b_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_118b_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_118b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_6aca]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_7014]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_4a26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2773_c7_bd7b]
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2773_c41_7113]
signal ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_7113_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_7113_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_7113_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_56cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_8b1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_4165]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2774_c7_4a26]
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2774_c41_ba68]
signal eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_ba68_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_ba68_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_ba68_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_4f85]
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_c117]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_f3f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2775_c7_4165]
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2775_c41_e4e4]
signal eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_e4e4_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_e4e4_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_6093]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_c552]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_c111]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2776_c7_f3f9]
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2776_c41_8a6e]
signal sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_8a6e_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_8a6e_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_8a6e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_7525]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_9d06]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_fc49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2777_c7_c111]
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2777_c41_c37b]
signal sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_c37b_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_c37b_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_c37b_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2778_c9_60b2[uxn_opcodes_h_l2778_c9_60b2]
signal printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2780_c18_48dc]
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2780_c18_f524]
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2780_c18_0545]
signal MUX_uxn_opcodes_h_l2780_c18_0545_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_0545_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_0545_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_0545_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2781_c2_854b]
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2783_c2_c08d]
signal sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2783_c2_c08d]
signal sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2784_c3_1694]
signal sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2784_c3_1694]
signal sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2785_c4_c59f]
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2787_c4_071e]
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2791_c30_3435]
signal MUX_uxn_opcodes_h_l2791_c30_3435_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_3435_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_3435_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_3435_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2791_c19_5138]
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2792_c20_9c14]
signal MUX_uxn_opcodes_h_l2792_c20_9c14_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_9c14_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2792_c2_d681]
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2794_c21_a3ef]
signal stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665
BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left,
BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right,
BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535
BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left,
BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right,
BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8
BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left,
BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right,
BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2704_c57_e349
CONST_SL_4_uxn_opcodes_h_l2704_c57_e349 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x,
CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output);

-- MUX_uxn_opcodes_h_l2704_c10_f678
MUX_uxn_opcodes_h_l2704_c10_f678 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2704_c10_f678_cond,
MUX_uxn_opcodes_h_l2704_c10_f678_iftrue,
MUX_uxn_opcodes_h_l2704_c10_f678_iffalse,
MUX_uxn_opcodes_h_l2704_c10_f678_return_output);

-- printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1
printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1 : entity work.printf_uxn_opcodes_h_l2706_c2_33d1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0,
printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1,
printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2708_c2_c216
is_wait_MUX_uxn_opcodes_h_l2708_c2_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond,
is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue,
is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse,
is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2708_c2_c216
opc_result_MUX_uxn_opcodes_h_l2708_c2_c216 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond,
opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue,
opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse,
opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output);

-- printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f
printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f : entity work.printf_uxn_opcodes_h_l2708_c23_ee3f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13
opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond,
opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue,
opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse,
opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output);

-- jci_uxn_opcodes_h_l2709_c41_a2a2
jci_uxn_opcodes_h_l2709_c41_a2a2 : entity work.jci_0CLK_edc09f97 port map (
clk,
jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2709_c41_a2a2_phase,
jci_uxn_opcodes_h_l2709_c41_a2a2_pc,
jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read,
jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read,
jci_uxn_opcodes_h_l2709_c41_a2a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc
opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output);

-- jmi_uxn_opcodes_h_l2710_c41_be3d
jmi_uxn_opcodes_h_l2710_c41_be3d : entity work.jmi_0CLK_8f4d4fc5 port map (
clk,
jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2710_c41_be3d_phase,
jmi_uxn_opcodes_h_l2710_c41_be3d_pc,
jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read,
jmi_uxn_opcodes_h_l2710_c41_be3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6
opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond,
opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output);

-- jsi_uxn_opcodes_h_l2711_c41_6fbb
jsi_uxn_opcodes_h_l2711_c41_6fbb : entity work.jsi_0CLK_af8c339b port map (
clk,
jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2711_c41_6fbb_phase,
jsi_uxn_opcodes_h_l2711_c41_6fbb_pc,
jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read,
jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96
opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond,
opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue,
opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse,
opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output);

-- lit_uxn_opcodes_h_l2712_c41_cbd4
lit_uxn_opcodes_h_l2712_c41_cbd4 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2712_c41_cbd4_phase,
lit_uxn_opcodes_h_l2712_c41_cbd4_pc,
lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read,
lit_uxn_opcodes_h_l2712_c41_cbd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2713_c7_455b
opc_result_MUX_uxn_opcodes_h_l2713_c7_455b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond,
opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output);

-- lit2_uxn_opcodes_h_l2713_c41_4eec
lit2_uxn_opcodes_h_l2713_c41_4eec : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2713_c41_4eec_phase,
lit2_uxn_opcodes_h_l2713_c41_4eec_pc,
lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read,
lit2_uxn_opcodes_h_l2713_c41_4eec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1
opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond,
opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output);

-- lit_uxn_opcodes_h_l2714_c41_ea44
lit_uxn_opcodes_h_l2714_c41_ea44 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2714_c41_ea44_phase,
lit_uxn_opcodes_h_l2714_c41_ea44_pc,
lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read,
lit_uxn_opcodes_h_l2714_c41_ea44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2715_c7_c381
opc_result_MUX_uxn_opcodes_h_l2715_c7_c381 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond,
opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue,
opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse,
opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output);

-- lit2_uxn_opcodes_h_l2715_c41_255f
lit2_uxn_opcodes_h_l2715_c41_255f : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2715_c41_255f_phase,
lit2_uxn_opcodes_h_l2715_c41_255f_pc,
lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read,
lit2_uxn_opcodes_h_l2715_c41_255f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c
opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond,
opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output);

-- inc_uxn_opcodes_h_l2716_c41_9b82
inc_uxn_opcodes_h_l2716_c41_9b82 : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2716_c41_9b82_phase,
inc_uxn_opcodes_h_l2716_c41_9b82_ins,
inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read,
inc_uxn_opcodes_h_l2716_c41_9b82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2717_c7_64af
opc_result_MUX_uxn_opcodes_h_l2717_c7_64af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond,
opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output);

-- inc2_uxn_opcodes_h_l2717_c41_2bb3
inc2_uxn_opcodes_h_l2717_c41_2bb3 : entity work.inc2_0CLK_a6885b22 port map (
clk,
inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2717_c41_2bb3_phase,
inc2_uxn_opcodes_h_l2717_c41_2bb3_ins,
inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read,
inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2718_c7_855e
opc_result_MUX_uxn_opcodes_h_l2718_c7_855e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond,
opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output);

-- pop_uxn_opcodes_h_l2718_c41_dea0
pop_uxn_opcodes_h_l2718_c41_dea0 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2718_c41_dea0_phase,
pop_uxn_opcodes_h_l2718_c41_dea0_ins,
pop_uxn_opcodes_h_l2718_c41_dea0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c
opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output);

-- pop2_uxn_opcodes_h_l2719_c41_48d4
pop2_uxn_opcodes_h_l2719_c41_48d4 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2719_c41_48d4_phase,
pop2_uxn_opcodes_h_l2719_c41_48d4_ins,
pop2_uxn_opcodes_h_l2719_c41_48d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0
opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output);

-- nip_uxn_opcodes_h_l2720_c41_ffa0
nip_uxn_opcodes_h_l2720_c41_ffa0 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2720_c41_ffa0_phase,
nip_uxn_opcodes_h_l2720_c41_ffa0_ins,
nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read,
nip_uxn_opcodes_h_l2720_c41_ffa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a
opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output);

-- nip2_uxn_opcodes_h_l2721_c41_17aa
nip2_uxn_opcodes_h_l2721_c41_17aa : entity work.nip2_0CLK_9a874500 port map (
clk,
nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2721_c41_17aa_phase,
nip2_uxn_opcodes_h_l2721_c41_17aa_ins,
nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read,
nip2_uxn_opcodes_h_l2721_c41_17aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9
opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output);

-- swp_uxn_opcodes_h_l2722_c41_2ad9
swp_uxn_opcodes_h_l2722_c41_2ad9 : entity work.swp_0CLK_faaf4b1a port map (
clk,
swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2722_c41_2ad9_phase,
swp_uxn_opcodes_h_l2722_c41_2ad9_ins,
swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read,
swp_uxn_opcodes_h_l2722_c41_2ad9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8
opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output);

-- swp2_uxn_opcodes_h_l2723_c41_851d
swp2_uxn_opcodes_h_l2723_c41_851d : entity work.swp2_0CLK_e768ce5a port map (
clk,
swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2723_c41_851d_phase,
swp2_uxn_opcodes_h_l2723_c41_851d_ins,
swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read,
swp2_uxn_opcodes_h_l2723_c41_851d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_2056
opc_result_MUX_uxn_opcodes_h_l2724_c7_2056 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output);

-- rot_uxn_opcodes_h_l2724_c41_1e16
rot_uxn_opcodes_h_l2724_c41_1e16 : entity work.rot_0CLK_90cbec6a port map (
clk,
rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2724_c41_1e16_phase,
rot_uxn_opcodes_h_l2724_c41_1e16_ins,
rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read,
rot_uxn_opcodes_h_l2724_c41_1e16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64
opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output);

-- rot2_uxn_opcodes_h_l2725_c41_731d
rot2_uxn_opcodes_h_l2725_c41_731d : entity work.rot2_0CLK_6006c90f port map (
clk,
rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2725_c41_731d_phase,
rot2_uxn_opcodes_h_l2725_c41_731d_ins,
rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read,
rot2_uxn_opcodes_h_l2725_c41_731d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_2002
opc_result_MUX_uxn_opcodes_h_l2726_c7_2002 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output);

-- dup_uxn_opcodes_h_l2726_c41_43a6
dup_uxn_opcodes_h_l2726_c41_43a6 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2726_c41_43a6_phase,
dup_uxn_opcodes_h_l2726_c41_43a6_ins,
dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read,
dup_uxn_opcodes_h_l2726_c41_43a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7
opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output);

-- dup2_uxn_opcodes_h_l2727_c41_415f
dup2_uxn_opcodes_h_l2727_c41_415f : entity work.dup2_0CLK_49f2c137 port map (
clk,
dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2727_c41_415f_phase,
dup2_uxn_opcodes_h_l2727_c41_415f_ins,
dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read,
dup2_uxn_opcodes_h_l2727_c41_415f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_011d
opc_result_MUX_uxn_opcodes_h_l2728_c7_011d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output);

-- ovr_uxn_opcodes_h_l2728_c41_cf3f
ovr_uxn_opcodes_h_l2728_c41_cf3f : entity work.ovr_0CLK_6d7675a8 port map (
clk,
ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2728_c41_cf3f_phase,
ovr_uxn_opcodes_h_l2728_c41_cf3f_ins,
ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read,
ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_0811
opc_result_MUX_uxn_opcodes_h_l2729_c7_0811 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output);

-- ovr2_uxn_opcodes_h_l2729_c41_5105
ovr2_uxn_opcodes_h_l2729_c41_5105 : entity work.ovr2_0CLK_946b5f6a port map (
clk,
ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2729_c41_5105_phase,
ovr2_uxn_opcodes_h_l2729_c41_5105_ins,
ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read,
ovr2_uxn_opcodes_h_l2729_c41_5105_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac
opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output);

-- equ_uxn_opcodes_h_l2730_c41_379c
equ_uxn_opcodes_h_l2730_c41_379c : entity work.equ_0CLK_85d5529e port map (
clk,
equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2730_c41_379c_phase,
equ_uxn_opcodes_h_l2730_c41_379c_ins,
equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read,
equ_uxn_opcodes_h_l2730_c41_379c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_1963
opc_result_MUX_uxn_opcodes_h_l2731_c7_1963 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output);

-- equ2_uxn_opcodes_h_l2731_c41_f68b
equ2_uxn_opcodes_h_l2731_c41_f68b : entity work.equ2_0CLK_302e9520 port map (
clk,
equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2731_c41_f68b_phase,
equ2_uxn_opcodes_h_l2731_c41_f68b_ins,
equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read,
equ2_uxn_opcodes_h_l2731_c41_f68b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e
opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output);

-- neq_uxn_opcodes_h_l2732_c41_fe8b
neq_uxn_opcodes_h_l2732_c41_fe8b : entity work.neq_0CLK_85d5529e port map (
clk,
neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2732_c41_fe8b_phase,
neq_uxn_opcodes_h_l2732_c41_fe8b_ins,
neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read,
neq_uxn_opcodes_h_l2732_c41_fe8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_a255
opc_result_MUX_uxn_opcodes_h_l2733_c7_a255 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output);

-- neq2_uxn_opcodes_h_l2733_c41_4c5a
neq2_uxn_opcodes_h_l2733_c41_4c5a : entity work.neq2_0CLK_302e9520 port map (
clk,
neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2733_c41_4c5a_phase,
neq2_uxn_opcodes_h_l2733_c41_4c5a_ins,
neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read,
neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26
opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output);

-- gth_uxn_opcodes_h_l2734_c41_133f
gth_uxn_opcodes_h_l2734_c41_133f : entity work.gth_0CLK_85d5529e port map (
clk,
gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2734_c41_133f_phase,
gth_uxn_opcodes_h_l2734_c41_133f_ins,
gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read,
gth_uxn_opcodes_h_l2734_c41_133f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f
opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output);

-- gth2_uxn_opcodes_h_l2735_c41_4aa5
gth2_uxn_opcodes_h_l2735_c41_4aa5 : entity work.gth2_0CLK_302e9520 port map (
clk,
gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2735_c41_4aa5_phase,
gth2_uxn_opcodes_h_l2735_c41_4aa5_ins,
gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read,
gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_d676
opc_result_MUX_uxn_opcodes_h_l2736_c7_d676 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output);

-- lth_uxn_opcodes_h_l2736_c41_9b61
lth_uxn_opcodes_h_l2736_c41_9b61 : entity work.lth_0CLK_85d5529e port map (
clk,
lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2736_c41_9b61_phase,
lth_uxn_opcodes_h_l2736_c41_9b61_ins,
lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read,
lth_uxn_opcodes_h_l2736_c41_9b61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56
opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output);

-- lth2_uxn_opcodes_h_l2737_c41_d9ed
lth2_uxn_opcodes_h_l2737_c41_d9ed : entity work.lth2_0CLK_302e9520 port map (
clk,
lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2737_c41_d9ed_phase,
lth2_uxn_opcodes_h_l2737_c41_d9ed_ins,
lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read,
lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91
opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output);

-- jmp_uxn_opcodes_h_l2738_c41_3e91
jmp_uxn_opcodes_h_l2738_c41_3e91 : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2738_c41_3e91_phase,
jmp_uxn_opcodes_h_l2738_c41_3e91_ins,
jmp_uxn_opcodes_h_l2738_c41_3e91_pc,
jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read,
jmp_uxn_opcodes_h_l2738_c41_3e91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61
opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output);

-- jmp2_uxn_opcodes_h_l2739_c41_2726
jmp2_uxn_opcodes_h_l2739_c41_2726 : entity work.jmp2_0CLK_0b1ee796 port map (
clk,
jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2739_c41_2726_phase,
jmp2_uxn_opcodes_h_l2739_c41_2726_ins,
jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read,
jmp2_uxn_opcodes_h_l2739_c41_2726_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_2625
opc_result_MUX_uxn_opcodes_h_l2740_c7_2625 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output);

-- jcn_uxn_opcodes_h_l2740_c41_294d
jcn_uxn_opcodes_h_l2740_c41_294d : entity work.jcn_0CLK_85d5529e port map (
clk,
jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2740_c41_294d_phase,
jcn_uxn_opcodes_h_l2740_c41_294d_ins,
jcn_uxn_opcodes_h_l2740_c41_294d_pc,
jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read,
jcn_uxn_opcodes_h_l2740_c41_294d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e
opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output);

-- jcn2_uxn_opcodes_h_l2741_c41_4d83
jcn2_uxn_opcodes_h_l2741_c41_4d83 : entity work.jcn2_0CLK_0226dad5 port map (
clk,
jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2741_c41_4d83_phase,
jcn2_uxn_opcodes_h_l2741_c41_4d83_ins,
jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read,
jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd
opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output);

-- jsr_uxn_opcodes_h_l2742_c41_a6d5
jsr_uxn_opcodes_h_l2742_c41_a6d5 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2742_c41_a6d5_phase,
jsr_uxn_opcodes_h_l2742_c41_a6d5_ins,
jsr_uxn_opcodes_h_l2742_c41_a6d5_pc,
jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read,
jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69
opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output);

-- jsr2_uxn_opcodes_h_l2743_c41_0aff
jsr2_uxn_opcodes_h_l2743_c41_0aff : entity work.jsr2_0CLK_9728fdff port map (
clk,
jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2743_c41_0aff_phase,
jsr2_uxn_opcodes_h_l2743_c41_0aff_ins,
jsr2_uxn_opcodes_h_l2743_c41_0aff_pc,
jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read,
jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2744_c7_3def
opc_result_MUX_uxn_opcodes_h_l2744_c7_3def : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond,
opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue,
opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse,
opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output);

-- sth_uxn_opcodes_h_l2744_c41_c304
sth_uxn_opcodes_h_l2744_c41_c304 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2744_c41_c304_phase,
sth_uxn_opcodes_h_l2744_c41_c304_ins,
sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read,
sth_uxn_opcodes_h_l2744_c41_c304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91
opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond,
opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue,
opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse,
opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output);

-- sth2_uxn_opcodes_h_l2745_c41_047e
sth2_uxn_opcodes_h_l2745_c41_047e : entity work.sth2_0CLK_302e9520 port map (
clk,
sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2745_c41_047e_phase,
sth2_uxn_opcodes_h_l2745_c41_047e_ins,
sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read,
sth2_uxn_opcodes_h_l2745_c41_047e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2746_c7_44af
opc_result_MUX_uxn_opcodes_h_l2746_c7_44af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond,
opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output);

-- ldz_uxn_opcodes_h_l2746_c41_59bf
ldz_uxn_opcodes_h_l2746_c41_59bf : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2746_c41_59bf_phase,
ldz_uxn_opcodes_h_l2746_c41_59bf_ins,
ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read,
ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read,
ldz_uxn_opcodes_h_l2746_c41_59bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c
opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond,
opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output);

-- ldz2_uxn_opcodes_h_l2747_c41_83b2
ldz2_uxn_opcodes_h_l2747_c41_83b2 : entity work.ldz2_0CLK_d662d237 port map (
clk,
ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2747_c41_83b2_phase,
ldz2_uxn_opcodes_h_l2747_c41_83b2_ins,
ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read,
ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read,
ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6
opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond,
opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output);

-- stz_uxn_opcodes_h_l2748_c41_df8c
stz_uxn_opcodes_h_l2748_c41_df8c : entity work.stz_0CLK_ffdfe23b port map (
clk,
stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2748_c41_df8c_phase,
stz_uxn_opcodes_h_l2748_c41_df8c_ins,
stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read,
stz_uxn_opcodes_h_l2748_c41_df8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2749_c7_695d
opc_result_MUX_uxn_opcodes_h_l2749_c7_695d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond,
opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output);

-- stz2_uxn_opcodes_h_l2749_c41_cd09
stz2_uxn_opcodes_h_l2749_c41_cd09 : entity work.stz2_0CLK_4f993427 port map (
clk,
stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2749_c41_cd09_phase,
stz2_uxn_opcodes_h_l2749_c41_cd09_ins,
stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read,
stz2_uxn_opcodes_h_l2749_c41_cd09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2750_c7_6825
opc_result_MUX_uxn_opcodes_h_l2750_c7_6825 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond,
opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue,
opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse,
opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output);

-- ldr_uxn_opcodes_h_l2750_c41_3742
ldr_uxn_opcodes_h_l2750_c41_3742 : entity work.ldr_0CLK_c61094da port map (
clk,
ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2750_c41_3742_phase,
ldr_uxn_opcodes_h_l2750_c41_3742_ins,
ldr_uxn_opcodes_h_l2750_c41_3742_pc,
ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read,
ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read,
ldr_uxn_opcodes_h_l2750_c41_3742_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2751_c7_a562
opc_result_MUX_uxn_opcodes_h_l2751_c7_a562 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond,
opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue,
opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse,
opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output);

-- ldr2_uxn_opcodes_h_l2751_c41_97ee
ldr2_uxn_opcodes_h_l2751_c41_97ee : entity work.ldr2_0CLK_6193b0ef port map (
clk,
ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2751_c41_97ee_phase,
ldr2_uxn_opcodes_h_l2751_c41_97ee_ins,
ldr2_uxn_opcodes_h_l2751_c41_97ee_pc,
ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read,
ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read,
ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2752_c7_0617
opc_result_MUX_uxn_opcodes_h_l2752_c7_0617 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond,
opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue,
opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse,
opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output);

-- str1_uxn_opcodes_h_l2752_c41_4932
str1_uxn_opcodes_h_l2752_c41_4932 : entity work.str1_0CLK_faaf4b1a port map (
clk,
str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2752_c41_4932_phase,
str1_uxn_opcodes_h_l2752_c41_4932_ins,
str1_uxn_opcodes_h_l2752_c41_4932_pc,
str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read,
str1_uxn_opcodes_h_l2752_c41_4932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2753_c7_221f
opc_result_MUX_uxn_opcodes_h_l2753_c7_221f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond,
opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output);

-- str2_uxn_opcodes_h_l2753_c41_fcc7
str2_uxn_opcodes_h_l2753_c41_fcc7 : entity work.str2_0CLK_4f993427 port map (
clk,
str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2753_c41_fcc7_phase,
str2_uxn_opcodes_h_l2753_c41_fcc7_ins,
str2_uxn_opcodes_h_l2753_c41_fcc7_pc,
str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read,
str2_uxn_opcodes_h_l2753_c41_fcc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2754_c7_7833
opc_result_MUX_uxn_opcodes_h_l2754_c7_7833 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output);

-- lda_uxn_opcodes_h_l2754_c41_ccf6
lda_uxn_opcodes_h_l2754_c41_ccf6 : entity work.lda_0CLK_dc46ab2b port map (
clk,
lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2754_c41_ccf6_phase,
lda_uxn_opcodes_h_l2754_c41_ccf6_ins,
lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read,
lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read,
lda_uxn_opcodes_h_l2754_c41_ccf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3
opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond,
opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output);

-- lda2_uxn_opcodes_h_l2755_c41_c1a6
lda2_uxn_opcodes_h_l2755_c41_c1a6 : entity work.lda2_0CLK_0d6e2712 port map (
clk,
lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2755_c41_c1a6_phase,
lda2_uxn_opcodes_h_l2755_c41_c1a6_ins,
lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read,
lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read,
lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e
opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond,
opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output);

-- sta_uxn_opcodes_h_l2756_c41_29d9
sta_uxn_opcodes_h_l2756_c41_29d9 : entity work.sta_0CLK_d2dce55b port map (
clk,
sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2756_c41_29d9_phase,
sta_uxn_opcodes_h_l2756_c41_29d9_ins,
sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read,
sta_uxn_opcodes_h_l2756_c41_29d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98
opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond,
opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue,
opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse,
opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output);

-- sta2_uxn_opcodes_h_l2757_c41_0c4f
sta2_uxn_opcodes_h_l2757_c41_0c4f : entity work.sta2_0CLK_7d7b1f8b port map (
clk,
sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2757_c41_0c4f_phase,
sta2_uxn_opcodes_h_l2757_c41_0c4f_ins,
sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read,
sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc
opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond,
opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output);

-- dei_uxn_opcodes_h_l2758_c41_c641
dei_uxn_opcodes_h_l2758_c41_c641 : entity work.dei_0CLK_1826c28e port map (
clk,
dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2758_c41_c641_phase,
dei_uxn_opcodes_h_l2758_c41_c641_ins,
dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read,
dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read,
dei_uxn_opcodes_h_l2758_c41_c641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2759_c7_177f
opc_result_MUX_uxn_opcodes_h_l2759_c7_177f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond,
opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output);

-- dei2_uxn_opcodes_h_l2759_c41_c0d9
dei2_uxn_opcodes_h_l2759_c41_c0d9 : entity work.dei2_0CLK_82b906b0 port map (
clk,
dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2759_c41_c0d9_phase,
dei2_uxn_opcodes_h_l2759_c41_c0d9_ins,
dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read,
dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read,
dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c
opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond,
opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output);

-- deo_uxn_opcodes_h_l2760_c41_7fba
deo_uxn_opcodes_h_l2760_c41_7fba : entity work.deo_0CLK_0f1297eb port map (
clk,
deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2760_c41_7fba_phase,
deo_uxn_opcodes_h_l2760_c41_7fba_ins,
deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read,
deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read,
deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read,
deo_uxn_opcodes_h_l2760_c41_7fba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae
opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond,
opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue,
opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse,
opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output);

-- deo2_uxn_opcodes_h_l2761_c41_78c6
deo2_uxn_opcodes_h_l2761_c41_78c6 : entity work.deo2_0CLK_0f83c89f port map (
clk,
deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2761_c41_78c6_phase,
deo2_uxn_opcodes_h_l2761_c41_78c6_ins,
deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read,
deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read,
deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read,
deo2_uxn_opcodes_h_l2761_c41_78c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2762_c7_5831
opc_result_MUX_uxn_opcodes_h_l2762_c7_5831 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond,
opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue,
opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse,
opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output);

-- add_uxn_opcodes_h_l2762_c41_7897
add_uxn_opcodes_h_l2762_c41_7897 : entity work.add_0CLK_bacf6a1d port map (
clk,
add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE,
add_uxn_opcodes_h_l2762_c41_7897_phase,
add_uxn_opcodes_h_l2762_c41_7897_ins,
add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read,
add_uxn_opcodes_h_l2762_c41_7897_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2763_c7_c666
opc_result_MUX_uxn_opcodes_h_l2763_c7_c666 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond,
opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue,
opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse,
opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output);

-- add2_uxn_opcodes_h_l2763_c41_5bc9
add2_uxn_opcodes_h_l2763_c41_5bc9 : entity work.add2_0CLK_f74041be port map (
clk,
add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2763_c41_5bc9_phase,
add2_uxn_opcodes_h_l2763_c41_5bc9_ins,
add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read,
add2_uxn_opcodes_h_l2763_c41_5bc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2764_c7_561b
opc_result_MUX_uxn_opcodes_h_l2764_c7_561b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond,
opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output);

-- sub_uxn_opcodes_h_l2764_c41_8871
sub_uxn_opcodes_h_l2764_c41_8871 : entity work.sub_0CLK_bacf6a1d port map (
clk,
sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2764_c41_8871_phase,
sub_uxn_opcodes_h_l2764_c41_8871_ins,
sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read,
sub_uxn_opcodes_h_l2764_c41_8871_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2765_c7_0048
opc_result_MUX_uxn_opcodes_h_l2765_c7_0048 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond,
opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue,
opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse,
opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output);

-- sub2_uxn_opcodes_h_l2765_c41_ff9e
sub2_uxn_opcodes_h_l2765_c41_ff9e : entity work.sub2_0CLK_f74041be port map (
clk,
sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2765_c41_ff9e_phase,
sub2_uxn_opcodes_h_l2765_c41_ff9e_ins,
sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read,
sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a
opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output);

-- mul_uxn_opcodes_h_l2766_c41_342d
mul_uxn_opcodes_h_l2766_c41_342d : entity work.mul_0CLK_bacf6a1d port map (
clk,
mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2766_c41_342d_phase,
mul_uxn_opcodes_h_l2766_c41_342d_ins,
mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read,
mul_uxn_opcodes_h_l2766_c41_342d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2767_c7_e535
opc_result_MUX_uxn_opcodes_h_l2767_c7_e535 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond,
opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue,
opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse,
opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output);

-- mul2_uxn_opcodes_h_l2767_c41_5244
mul2_uxn_opcodes_h_l2767_c41_5244 : entity work.mul2_0CLK_f74041be port map (
clk,
mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2767_c41_5244_phase,
mul2_uxn_opcodes_h_l2767_c41_5244_ins,
mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read,
mul2_uxn_opcodes_h_l2767_c41_5244_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f
opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond,
opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output);

-- div_uxn_opcodes_h_l2768_c41_88d7
div_uxn_opcodes_h_l2768_c41_88d7 : entity work.div_0CLK_a35230ee port map (
clk,
div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE,
div_uxn_opcodes_h_l2768_c41_88d7_phase,
div_uxn_opcodes_h_l2768_c41_88d7_ins,
div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read,
div_uxn_opcodes_h_l2768_c41_88d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2769_c7_7303
opc_result_MUX_uxn_opcodes_h_l2769_c7_7303 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond,
opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue,
opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse,
opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output);

-- div2_uxn_opcodes_h_l2769_c41_941d
div2_uxn_opcodes_h_l2769_c41_941d : entity work.div2_0CLK_6d03de33 port map (
clk,
div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2769_c41_941d_phase,
div2_uxn_opcodes_h_l2769_c41_941d_ins,
div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read,
div2_uxn_opcodes_h_l2769_c41_941d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2770_c7_df84
opc_result_MUX_uxn_opcodes_h_l2770_c7_df84 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond,
opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue,
opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse,
opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output);

-- and_uxn_opcodes_h_l2770_c41_638f
and_uxn_opcodes_h_l2770_c41_638f : entity work.and_0CLK_bacf6a1d port map (
clk,
and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE,
and_uxn_opcodes_h_l2770_c41_638f_phase,
and_uxn_opcodes_h_l2770_c41_638f_ins,
and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read,
and_uxn_opcodes_h_l2770_c41_638f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83
opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond,
opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue,
opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse,
opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output);

-- and2_uxn_opcodes_h_l2771_c41_3f58
and2_uxn_opcodes_h_l2771_c41_3f58 : entity work.and2_0CLK_f74041be port map (
clk,
and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2771_c41_3f58_phase,
and2_uxn_opcodes_h_l2771_c41_3f58_ins,
and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read,
and2_uxn_opcodes_h_l2771_c41_3f58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2772_c7_e810
opc_result_MUX_uxn_opcodes_h_l2772_c7_e810 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond,
opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue,
opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse,
opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output);

-- ora_uxn_opcodes_h_l2772_c41_118b
ora_uxn_opcodes_h_l2772_c41_118b : entity work.ora_0CLK_bacf6a1d port map (
clk,
ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2772_c41_118b_phase,
ora_uxn_opcodes_h_l2772_c41_118b_ins,
ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read,
ora_uxn_opcodes_h_l2772_c41_118b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b
opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond,
opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output);

-- ora2_uxn_opcodes_h_l2773_c41_7113
ora2_uxn_opcodes_h_l2773_c41_7113 : entity work.ora2_0CLK_f74041be port map (
clk,
ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2773_c41_7113_phase,
ora2_uxn_opcodes_h_l2773_c41_7113_ins,
ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read,
ora2_uxn_opcodes_h_l2773_c41_7113_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26
opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond,
opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue,
opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse,
opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output);

-- eor_uxn_opcodes_h_l2774_c41_ba68
eor_uxn_opcodes_h_l2774_c41_ba68 : entity work.eor_0CLK_bacf6a1d port map (
clk,
eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2774_c41_ba68_phase,
eor_uxn_opcodes_h_l2774_c41_ba68_ins,
eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read,
eor_uxn_opcodes_h_l2774_c41_ba68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2775_c7_4165
opc_result_MUX_uxn_opcodes_h_l2775_c7_4165 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond,
opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue,
opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse,
opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output);

-- eor2_uxn_opcodes_h_l2775_c41_e4e4
eor2_uxn_opcodes_h_l2775_c41_e4e4 : entity work.eor2_0CLK_f74041be port map (
clk,
eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2775_c41_e4e4_phase,
eor2_uxn_opcodes_h_l2775_c41_e4e4_ins,
eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read,
eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9
opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond,
opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output);

-- sft_uxn_opcodes_h_l2776_c41_8a6e
sft_uxn_opcodes_h_l2776_c41_8a6e : entity work.sft_0CLK_10aab3e1 port map (
clk,
sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2776_c41_8a6e_phase,
sft_uxn_opcodes_h_l2776_c41_8a6e_ins,
sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read,
sft_uxn_opcodes_h_l2776_c41_8a6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2777_c7_c111
opc_result_MUX_uxn_opcodes_h_l2777_c7_c111 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond,
opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue,
opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse,
opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output);

-- sft2_uxn_opcodes_h_l2777_c41_c37b
sft2_uxn_opcodes_h_l2777_c41_c37b : entity work.sft2_0CLK_77062510 port map (
clk,
sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2777_c41_c37b_phase,
sft2_uxn_opcodes_h_l2777_c41_c37b_ins,
sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read,
sft2_uxn_opcodes_h_l2777_c41_c37b_return_output);

-- printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2
printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2 : entity work.printf_uxn_opcodes_h_l2778_c9_60b2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc
BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left,
BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right,
BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524
BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left,
BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right,
BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output);

-- MUX_uxn_opcodes_h_l2780_c18_0545
MUX_uxn_opcodes_h_l2780_c18_0545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2780_c18_0545_cond,
MUX_uxn_opcodes_h_l2780_c18_0545_iftrue,
MUX_uxn_opcodes_h_l2780_c18_0545_iffalse,
MUX_uxn_opcodes_h_l2780_c18_0545_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left,
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right,
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output);

-- sp1_MUX_uxn_opcodes_h_l2783_c2_c08d
sp1_MUX_uxn_opcodes_h_l2783_c2_c08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond,
sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue,
sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse,
sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output);

-- sp0_MUX_uxn_opcodes_h_l2783_c2_c08d
sp0_MUX_uxn_opcodes_h_l2783_c2_c08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond,
sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue,
sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse,
sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output);

-- sp1_MUX_uxn_opcodes_h_l2784_c3_1694
sp1_MUX_uxn_opcodes_h_l2784_c3_1694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond,
sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue,
sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse,
sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output);

-- sp0_MUX_uxn_opcodes_h_l2784_c3_1694
sp0_MUX_uxn_opcodes_h_l2784_c3_1694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond,
sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue,
sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse,
sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left,
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right,
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left,
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right,
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output);

-- MUX_uxn_opcodes_h_l2791_c30_3435
MUX_uxn_opcodes_h_l2791_c30_3435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2791_c30_3435_cond,
MUX_uxn_opcodes_h_l2791_c30_3435_iftrue,
MUX_uxn_opcodes_h_l2791_c30_3435_iffalse,
MUX_uxn_opcodes_h_l2791_c30_3435_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138 : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left,
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right,
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output);

-- MUX_uxn_opcodes_h_l2792_c20_9c14
MUX_uxn_opcodes_h_l2792_c20_9c14 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2792_c20_9c14_cond,
MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue,
MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse,
MUX_uxn_opcodes_h_l2792_c20_9c14_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681 : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left,
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right,
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output);

-- stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address,
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value,
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable,
stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output,
 CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output,
 MUX_uxn_opcodes_h_l2704_c10_f678_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output,
 is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output,
 opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output,
 jci_uxn_opcodes_h_l2709_c41_a2a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output,
 jmi_uxn_opcodes_h_l2710_c41_be3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output,
 opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output,
 jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output,
 lit_uxn_opcodes_h_l2712_c41_cbd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output,
 lit2_uxn_opcodes_h_l2713_c41_4eec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output,
 opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output,
 lit_uxn_opcodes_h_l2714_c41_ea44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output,
 lit2_uxn_opcodes_h_l2715_c41_255f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output,
 inc_uxn_opcodes_h_l2716_c41_9b82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output,
 inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output,
 pop_uxn_opcodes_h_l2718_c41_dea0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output,
 pop2_uxn_opcodes_h_l2719_c41_48d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output,
 nip_uxn_opcodes_h_l2720_c41_ffa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output,
 nip2_uxn_opcodes_h_l2721_c41_17aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output,
 swp_uxn_opcodes_h_l2722_c41_2ad9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output,
 swp2_uxn_opcodes_h_l2723_c41_851d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output,
 rot_uxn_opcodes_h_l2724_c41_1e16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output,
 rot2_uxn_opcodes_h_l2725_c41_731d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output,
 dup_uxn_opcodes_h_l2726_c41_43a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output,
 dup2_uxn_opcodes_h_l2727_c41_415f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output,
 ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output,
 ovr2_uxn_opcodes_h_l2729_c41_5105_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output,
 equ_uxn_opcodes_h_l2730_c41_379c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output,
 equ2_uxn_opcodes_h_l2731_c41_f68b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output,
 neq_uxn_opcodes_h_l2732_c41_fe8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output,
 neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output,
 gth_uxn_opcodes_h_l2734_c41_133f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output,
 gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output,
 lth_uxn_opcodes_h_l2736_c41_9b61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output,
 lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output,
 jmp_uxn_opcodes_h_l2738_c41_3e91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output,
 jmp2_uxn_opcodes_h_l2739_c41_2726_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output,
 jcn_uxn_opcodes_h_l2740_c41_294d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output,
 jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output,
 jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output,
 jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output,
 opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output,
 sth_uxn_opcodes_h_l2744_c41_c304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output,
 sth2_uxn_opcodes_h_l2745_c41_047e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output,
 ldz_uxn_opcodes_h_l2746_c41_59bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output,
 ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output,
 stz_uxn_opcodes_h_l2748_c41_df8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output,
 opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output,
 stz2_uxn_opcodes_h_l2749_c41_cd09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output,
 opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output,
 ldr_uxn_opcodes_h_l2750_c41_3742_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output,
 opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output,
 ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output,
 str1_uxn_opcodes_h_l2752_c41_4932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output,
 opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output,
 str2_uxn_opcodes_h_l2753_c41_fcc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output,
 lda_uxn_opcodes_h_l2754_c41_ccf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output,
 lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output,
 opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output,
 sta_uxn_opcodes_h_l2756_c41_29d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output,
 sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output,
 dei_uxn_opcodes_h_l2758_c41_c641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output,
 dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output,
 opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output,
 deo_uxn_opcodes_h_l2760_c41_7fba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output,
 opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output,
 deo2_uxn_opcodes_h_l2761_c41_78c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output,
 opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output,
 add_uxn_opcodes_h_l2762_c41_7897_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output,
 add2_uxn_opcodes_h_l2763_c41_5bc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output,
 opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output,
 sub_uxn_opcodes_h_l2764_c41_8871_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output,
 sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output,
 opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output,
 mul_uxn_opcodes_h_l2766_c41_342d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output,
 mul2_uxn_opcodes_h_l2767_c41_5244_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output,
 opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output,
 div_uxn_opcodes_h_l2768_c41_88d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output,
 opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output,
 div2_uxn_opcodes_h_l2769_c41_941d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output,
 opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output,
 and_uxn_opcodes_h_l2770_c41_638f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output,
 opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output,
 and2_uxn_opcodes_h_l2771_c41_3f58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output,
 ora_uxn_opcodes_h_l2772_c41_118b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output,
 opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output,
 ora2_uxn_opcodes_h_l2773_c41_7113_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output,
 opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output,
 eor_uxn_opcodes_h_l2774_c41_ba68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output,
 eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output,
 opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output,
 sft_uxn_opcodes_h_l2776_c41_8a6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output,
 sft2_uxn_opcodes_h_l2777_c41_c37b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output,
 MUX_uxn_opcodes_h_l2780_c18_0545_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output,
 sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output,
 sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output,
 sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output,
 sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output,
 MUX_uxn_opcodes_h_l2791_c30_3435_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output,
 MUX_uxn_opcodes_h_l2792_c20_9c14_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output,
 stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2704_c2_5d29 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_f678_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_f7bb_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_2777_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_f678_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_c216_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_ea44_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_ea44_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_ea44_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_255f_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_255f_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_255f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_9b82_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_9b82_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_9b82_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_dea0_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_dea0_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_dea0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_851d_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_851d_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_851d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_1e16_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_1e16_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_1e16_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_731d_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_731d_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_731d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_43a6_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_43a6_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_43a6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_415f_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_415f_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_415f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_379c_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_379c_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_379c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_133f_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_133f_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_133f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_9b61_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_9b61_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_9b61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_294d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_c304_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_c304_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_c304_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_047e_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_047e_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_047e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_df8c_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_df8c_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_df8c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_3742_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_4932_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_29d9_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_29d9_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_29d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_c641_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_7fba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_7897_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_7897_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_7897_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_8871_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_8871_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_8871_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_342d_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_342d_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_342d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_5244_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_5244_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_5244_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_88d7_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_88d7_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_88d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_941d_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_941d_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_941d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_638f_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_638f_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_638f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_3f58_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_3f58_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_3f58_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_118b_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_118b_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_118b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_7113_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_7113_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_7113_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_ba68_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_ba68_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_ba68_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_0545_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_0545_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_311b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_31b1_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2785_c4_361c : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2787_c4_b97b : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_3435_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_3435_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_620c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_60e9_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_629e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2792_c2_1a01 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_76f7_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_e71b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_a0d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_5498_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_626c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_df3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_5760_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_54f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_defe_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_bd5d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_5ae3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_1631_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_453c_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right := to_unsigned(2048, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right := to_unsigned(54, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right := to_unsigned(30, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right := to_unsigned(22, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right := to_unsigned(38, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right := to_unsigned(57, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right := to_unsigned(26, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right := to_unsigned(47, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right := to_unsigned(23, 5);
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right := to_unsigned(512, 10);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right := to_unsigned(3072, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right := to_unsigned(25, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2762_c41_7897_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2771_c41_3f58_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2770_c41_638f_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2769_c41_941d_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2768_c41_88d7_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2727_c41_415f_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2726_c41_43a6_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2774_c41_ba68_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2730_c41_379c_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2734_c41_133f_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2716_c41_9b82_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2736_c41_9b61_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2767_c41_5244_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2766_c41_342d_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2773_c41_7113_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2772_c41_118b_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2718_c41_dea0_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2725_c41_731d_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2724_c41_1e16_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2756_c41_29d9_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2745_c41_047e_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2744_c41_c304_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2748_c41_df8c_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2764_c41_8871_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2723_c41_851d_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2715_c41_255f_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2714_c41_ea44_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2762_c41_7897_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2771_c41_3f58_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2770_c41_638f_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2769_c41_941d_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2768_c41_88d7_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2727_c41_415f_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2726_c41_43a6_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2774_c41_ba68_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2730_c41_379c_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2734_c41_133f_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2716_c41_9b82_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2715_c41_255f_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2714_c41_ea44_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2736_c41_9b61_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2767_c41_5244_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2766_c41_342d_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2773_c41_7113_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2772_c41_118b_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2718_c41_dea0_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2725_c41_731d_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2724_c41_1e16_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2756_c41_29d9_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2745_c41_047e_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2744_c41_c304_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2748_c41_df8c_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2764_c41_8871_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2723_c41_851d_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read := stack_read_value;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2704_c57_2777] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_2777_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2708_c2_c216] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_c216_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2704_c10_8665] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_left;
     BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output := BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2780_c18_48dc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_left;
     BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output := BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2704_c41_51e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_left;
     BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output := BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_8665_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_48dc_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_2777_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_c216_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2704_c10_b535] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_left;
     BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output := BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2704_c30_f7bb] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_f7bb_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_51e8_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2780_c18_f524] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_left;
     BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output := BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l2704_c57_e349] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output := CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2704_c10_f678_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_b535_return_output;
     VAR_MUX_uxn_opcodes_h_l2780_c18_0545_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_f524_return_output;
     VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_f7bb_return_output;
     VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_e349_return_output;
     -- MUX[uxn_opcodes_h_l2780_c18_0545] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2780_c18_0545_cond <= VAR_MUX_uxn_opcodes_h_l2780_c18_0545_cond;
     MUX_uxn_opcodes_h_l2780_c18_0545_iftrue <= VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iftrue;
     MUX_uxn_opcodes_h_l2780_c18_0545_iffalse <= VAR_MUX_uxn_opcodes_h_l2780_c18_0545_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2780_c18_0545_return_output := MUX_uxn_opcodes_h_l2780_c18_0545_return_output;

     -- MUX[uxn_opcodes_h_l2704_c10_f678] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2704_c10_f678_cond <= VAR_MUX_uxn_opcodes_h_l2704_c10_f678_cond;
     MUX_uxn_opcodes_h_l2704_c10_f678_iftrue <= VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iftrue;
     MUX_uxn_opcodes_h_l2704_c10_f678_iffalse <= VAR_MUX_uxn_opcodes_h_l2704_c10_f678_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2704_c10_f678_return_output := MUX_uxn_opcodes_h_l2704_c10_f678_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2704_c2_5d29 := VAR_MUX_uxn_opcodes_h_l2704_c10_f678_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left := VAR_MUX_uxn_opcodes_h_l2780_c18_0545_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2704_c2_5d29;
     VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1 := resize(VAR_opc_uxn_opcodes_h_l2704_c2_5d29, 32);
     VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0 := resize(VAR_opc_uxn_opcodes_h_l2704_c2_5d29, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_039c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_57a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_842f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_90c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_ccbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_c479] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_99f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_26f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_183d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_cfb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_3028] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_cc7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_a701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_left;
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output := BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_9e09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_5f28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_af80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_12bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_6aca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_f32b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_a4d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_fa20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_6093] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_2a08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_f0f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_3027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_7656] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_3d60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_f930] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_f156] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_a557] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_005f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_7d3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_22d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_4338] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_f332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_211d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_baba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_fda7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_3791] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_3f71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_4f85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_bdc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_5a02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_94d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_a14c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_87f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_3f95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_24c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_cd82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_229a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_90cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_1e70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_c4d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_5c39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_65ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_b3a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_9e01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_45b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_cdef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_1418] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_7c69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_12f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b52e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_41b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_88e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_3435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_56cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_7525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output;

     -- printf_uxn_opcodes_h_l2706_c2_33d1[uxn_opcodes_h_l2706_c2_33d1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0 <= VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg0;
     printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1 <= VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg1;
     printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2 <= VAR_printf_uxn_opcodes_h_l2706_c2_33d1_uxn_opcodes_h_l2706_c2_33d1_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0a69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_91c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_26f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_1418_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_9e01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_99f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_3435_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_65ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_cfb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b52e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_94d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_41b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_88e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_b3a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_3f71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_4338_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_7c69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_91c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_12bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_5c39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3027_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_57a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_f32b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_a14c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_cc7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0a69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_5a02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_baba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_7d3d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f0f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_22d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_c479_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_3791_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_f332_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_842f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_039c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_3028_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_3f95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_1e70_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_cdef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9e09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_7656_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_5f28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_90c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_f930_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_fa20_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_183d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_af80_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_211d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_c4d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_2a08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_12f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_f156_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_bdc2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_cd82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_87f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_90cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_a4d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_fda7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_45b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_a557_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_005f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_229a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_ccbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_24c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_a701_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_6aca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_56cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_4f85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6093_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_7525_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2708_c2_c216] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_cond;
     is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output := is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_12b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_2a13] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output;
     VAR_printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_12b5_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_9a7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output;

     -- printf_uxn_opcodes_h_l2708_c23_ee3f[uxn_opcodes_h_l2708_c23_ee3f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2708_c23_ee3f_uxn_opcodes_h_l2708_c23_ee3f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_0ddc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output;
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_9a7e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_094b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_57b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output;

     -- jci[uxn_opcodes_h_l2709_c41_a2a2] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2709_c41_a2a2_phase <= VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_phase;
     jci_uxn_opcodes_h_l2709_c41_a2a2_pc <= VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_pc;
     jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_stack_read;
     jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_return_output := jci_uxn_opcodes_h_l2709_c41_a2a2_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output;
     VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_094b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue := VAR_jci_uxn_opcodes_h_l2709_c41_a2a2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_8a96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_b9b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output;

     -- jmi[uxn_opcodes_h_l2710_c41_be3d] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2710_c41_be3d_phase <= VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_phase;
     jmi_uxn_opcodes_h_l2710_c41_be3d_pc <= VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_pc;
     jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_return_output := jmi_uxn_opcodes_h_l2710_c41_be3d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output;
     VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_b9b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue := VAR_jmi_uxn_opcodes_h_l2710_c41_be3d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_455b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_425c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output;

     -- jsi[uxn_opcodes_h_l2711_c41_6fbb] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2711_c41_6fbb_phase <= VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_phase;
     jsi_uxn_opcodes_h_l2711_c41_6fbb_pc <= VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_pc;
     jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output := jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_455b_return_output;
     VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_425c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue := VAR_jsi_uxn_opcodes_h_l2711_c41_6fbb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_64b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_370b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output;

     -- lit[uxn_opcodes_h_l2712_c41_cbd4] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2712_c41_cbd4_phase <= VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_phase;
     lit_uxn_opcodes_h_l2712_c41_cbd4_pc <= VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_pc;
     lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_return_output := lit_uxn_opcodes_h_l2712_c41_cbd4_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output;
     VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_370b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue := VAR_lit_uxn_opcodes_h_l2712_c41_cbd4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_c381] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_b4a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output;

     -- lit2[uxn_opcodes_h_l2713_c41_4eec] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2713_c41_4eec_phase <= VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_phase;
     lit2_uxn_opcodes_h_l2713_c41_4eec_pc <= VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_pc;
     lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_return_output := lit2_uxn_opcodes_h_l2713_c41_4eec_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_c381_return_output;
     VAR_lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_b4a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue := VAR_lit2_uxn_opcodes_h_l2713_c41_4eec_return_output;
     -- lit[uxn_opcodes_h_l2714_c41_ea44] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2714_c41_ea44_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2714_c41_ea44_phase <= VAR_lit_uxn_opcodes_h_l2714_c41_ea44_phase;
     lit_uxn_opcodes_h_l2714_c41_ea44_pc <= VAR_lit_uxn_opcodes_h_l2714_c41_ea44_pc;
     lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2714_c41_ea44_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2714_c41_ea44_return_output := lit_uxn_opcodes_h_l2714_c41_ea44_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_1a0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_5ff2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output;
     VAR_lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_5ff2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue := VAR_lit_uxn_opcodes_h_l2714_c41_ea44_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_64af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_1843] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output;

     -- lit2[uxn_opcodes_h_l2715_c41_255f] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2715_c41_255f_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2715_c41_255f_phase <= VAR_lit2_uxn_opcodes_h_l2715_c41_255f_phase;
     lit2_uxn_opcodes_h_l2715_c41_255f_pc <= VAR_lit2_uxn_opcodes_h_l2715_c41_255f_pc;
     lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2715_c41_255f_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2715_c41_255f_return_output := lit2_uxn_opcodes_h_l2715_c41_255f_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_64af_return_output;
     VAR_inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_1843_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue := VAR_lit2_uxn_opcodes_h_l2715_c41_255f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_855e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_66a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output;

     -- inc[uxn_opcodes_h_l2716_c41_9b82] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2716_c41_9b82_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2716_c41_9b82_phase <= VAR_inc_uxn_opcodes_h_l2716_c41_9b82_phase;
     inc_uxn_opcodes_h_l2716_c41_9b82_ins <= VAR_inc_uxn_opcodes_h_l2716_c41_9b82_ins;
     inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2716_c41_9b82_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2716_c41_9b82_return_output := inc_uxn_opcodes_h_l2716_c41_9b82_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_855e_return_output;
     VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_66a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue := VAR_inc_uxn_opcodes_h_l2716_c41_9b82_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_8f9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_79ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output;

     -- inc2[uxn_opcodes_h_l2717_c41_2bb3] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2717_c41_2bb3_phase <= VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_phase;
     inc2_uxn_opcodes_h_l2717_c41_2bb3_ins <= VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_ins;
     inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output := inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output;
     VAR_pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_79ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue := VAR_inc2_uxn_opcodes_h_l2717_c41_2bb3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_08a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output;

     -- pop[uxn_opcodes_h_l2718_c41_dea0] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2718_c41_dea0_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2718_c41_dea0_phase <= VAR_pop_uxn_opcodes_h_l2718_c41_dea0_phase;
     pop_uxn_opcodes_h_l2718_c41_dea0_ins <= VAR_pop_uxn_opcodes_h_l2718_c41_dea0_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2718_c41_dea0_return_output := pop_uxn_opcodes_h_l2718_c41_dea0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_437e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output;
     VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_437e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue := VAR_pop_uxn_opcodes_h_l2718_c41_dea0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_ff3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_e799] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output;

     -- pop2[uxn_opcodes_h_l2719_c41_48d4] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2719_c41_48d4_phase <= VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_phase;
     pop2_uxn_opcodes_h_l2719_c41_48d4_ins <= VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_return_output := pop2_uxn_opcodes_h_l2719_c41_48d4_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output;
     VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_e799_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue := VAR_pop2_uxn_opcodes_h_l2719_c41_48d4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_5156] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_78f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output;

     -- nip[uxn_opcodes_h_l2720_c41_ffa0] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2720_c41_ffa0_phase <= VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_phase;
     nip_uxn_opcodes_h_l2720_c41_ffa0_ins <= VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_ins;
     nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_return_output := nip_uxn_opcodes_h_l2720_c41_ffa0_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output;
     VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_5156_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue := VAR_nip_uxn_opcodes_h_l2720_c41_ffa0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_b28b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output;

     -- nip2[uxn_opcodes_h_l2721_c41_17aa] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2721_c41_17aa_phase <= VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_phase;
     nip2_uxn_opcodes_h_l2721_c41_17aa_ins <= VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_ins;
     nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_return_output := nip2_uxn_opcodes_h_l2721_c41_17aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_67d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output;
     VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b28b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue := VAR_nip2_uxn_opcodes_h_l2721_c41_17aa_return_output;
     -- swp[uxn_opcodes_h_l2722_c41_2ad9] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2722_c41_2ad9_phase <= VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_phase;
     swp_uxn_opcodes_h_l2722_c41_2ad9_ins <= VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_ins;
     swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_return_output := swp_uxn_opcodes_h_l2722_c41_2ad9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_4c97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_2056] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_2056_return_output;
     VAR_swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4c97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue := VAR_swp_uxn_opcodes_h_l2722_c41_2ad9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_dce8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output;

     -- swp2[uxn_opcodes_h_l2723_c41_851d] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2723_c41_851d_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2723_c41_851d_phase <= VAR_swp2_uxn_opcodes_h_l2723_c41_851d_phase;
     swp2_uxn_opcodes_h_l2723_c41_851d_ins <= VAR_swp2_uxn_opcodes_h_l2723_c41_851d_ins;
     swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2723_c41_851d_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2723_c41_851d_return_output := swp2_uxn_opcodes_h_l2723_c41_851d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_ad64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output;
     VAR_rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_dce8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue := VAR_swp2_uxn_opcodes_h_l2723_c41_851d_return_output;
     -- rot[uxn_opcodes_h_l2724_c41_1e16] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2724_c41_1e16_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2724_c41_1e16_phase <= VAR_rot_uxn_opcodes_h_l2724_c41_1e16_phase;
     rot_uxn_opcodes_h_l2724_c41_1e16_ins <= VAR_rot_uxn_opcodes_h_l2724_c41_1e16_ins;
     rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2724_c41_1e16_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2724_c41_1e16_return_output := rot_uxn_opcodes_h_l2724_c41_1e16_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_2002] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_3527] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_2002_return_output;
     VAR_rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_3527_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue := VAR_rot_uxn_opcodes_h_l2724_c41_1e16_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_4dff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output;

     -- rot2[uxn_opcodes_h_l2725_c41_731d] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2725_c41_731d_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2725_c41_731d_phase <= VAR_rot2_uxn_opcodes_h_l2725_c41_731d_phase;
     rot2_uxn_opcodes_h_l2725_c41_731d_ins <= VAR_rot2_uxn_opcodes_h_l2725_c41_731d_ins;
     rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2725_c41_731d_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2725_c41_731d_return_output := rot2_uxn_opcodes_h_l2725_c41_731d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_5fc7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output;
     VAR_dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_4dff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue := VAR_rot2_uxn_opcodes_h_l2725_c41_731d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_925d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output;

     -- dup[uxn_opcodes_h_l2726_c41_43a6] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2726_c41_43a6_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2726_c41_43a6_phase <= VAR_dup_uxn_opcodes_h_l2726_c41_43a6_phase;
     dup_uxn_opcodes_h_l2726_c41_43a6_ins <= VAR_dup_uxn_opcodes_h_l2726_c41_43a6_ins;
     dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2726_c41_43a6_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2726_c41_43a6_return_output := dup_uxn_opcodes_h_l2726_c41_43a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_011d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_011d_return_output;
     VAR_dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_925d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue := VAR_dup_uxn_opcodes_h_l2726_c41_43a6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_0811] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output;

     -- dup2[uxn_opcodes_h_l2727_c41_415f] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2727_c41_415f_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2727_c41_415f_phase <= VAR_dup2_uxn_opcodes_h_l2727_c41_415f_phase;
     dup2_uxn_opcodes_h_l2727_c41_415f_ins <= VAR_dup2_uxn_opcodes_h_l2727_c41_415f_ins;
     dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2727_c41_415f_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2727_c41_415f_return_output := dup2_uxn_opcodes_h_l2727_c41_415f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_4e12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_0811_return_output;
     VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_4e12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue := VAR_dup2_uxn_opcodes_h_l2727_c41_415f_return_output;
     -- ovr[uxn_opcodes_h_l2728_c41_cf3f] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2728_c41_cf3f_phase <= VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_phase;
     ovr_uxn_opcodes_h_l2728_c41_cf3f_ins <= VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_ins;
     ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output := ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_0eac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_583f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_583f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue := VAR_ovr_uxn_opcodes_h_l2728_c41_cf3f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_1963] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_cda7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output;

     -- ovr2[uxn_opcodes_h_l2729_c41_5105] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2729_c41_5105_phase <= VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_phase;
     ovr2_uxn_opcodes_h_l2729_c41_5105_ins <= VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_ins;
     ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_return_output := ovr2_uxn_opcodes_h_l2729_c41_5105_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_1963_return_output;
     VAR_equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_cda7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue := VAR_ovr2_uxn_opcodes_h_l2729_c41_5105_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_fd8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output;

     -- equ[uxn_opcodes_h_l2730_c41_379c] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2730_c41_379c_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2730_c41_379c_phase <= VAR_equ_uxn_opcodes_h_l2730_c41_379c_phase;
     equ_uxn_opcodes_h_l2730_c41_379c_ins <= VAR_equ_uxn_opcodes_h_l2730_c41_379c_ins;
     equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2730_c41_379c_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2730_c41_379c_return_output := equ_uxn_opcodes_h_l2730_c41_379c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_c475] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output;
     VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_c475_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue := VAR_equ_uxn_opcodes_h_l2730_c41_379c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_a255] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_ce8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output;

     -- equ2[uxn_opcodes_h_l2731_c41_f68b] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2731_c41_f68b_phase <= VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_phase;
     equ2_uxn_opcodes_h_l2731_c41_f68b_ins <= VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_ins;
     equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_return_output := equ2_uxn_opcodes_h_l2731_c41_f68b_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_a255_return_output;
     VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_ce8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue := VAR_equ2_uxn_opcodes_h_l2731_c41_f68b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_00d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output;

     -- neq[uxn_opcodes_h_l2732_c41_fe8b] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2732_c41_fe8b_phase <= VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_phase;
     neq_uxn_opcodes_h_l2732_c41_fe8b_ins <= VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_ins;
     neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_return_output := neq_uxn_opcodes_h_l2732_c41_fe8b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_2a26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output;
     VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_00d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue := VAR_neq_uxn_opcodes_h_l2732_c41_fe8b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_23d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_0b2f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output;

     -- neq2[uxn_opcodes_h_l2733_c41_4c5a] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2733_c41_4c5a_phase <= VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_phase;
     neq2_uxn_opcodes_h_l2733_c41_4c5a_ins <= VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_ins;
     neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output := neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output;
     VAR_gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_23d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue := VAR_neq2_uxn_opcodes_h_l2733_c41_4c5a_return_output;
     -- gth[uxn_opcodes_h_l2734_c41_133f] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2734_c41_133f_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2734_c41_133f_phase <= VAR_gth_uxn_opcodes_h_l2734_c41_133f_phase;
     gth_uxn_opcodes_h_l2734_c41_133f_ins <= VAR_gth_uxn_opcodes_h_l2734_c41_133f_ins;
     gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2734_c41_133f_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2734_c41_133f_return_output := gth_uxn_opcodes_h_l2734_c41_133f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_d4cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_d676] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_d676_return_output;
     VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_d4cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue := VAR_gth_uxn_opcodes_h_l2734_c41_133f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_ae56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output;

     -- gth2[uxn_opcodes_h_l2735_c41_4aa5] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2735_c41_4aa5_phase <= VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_phase;
     gth2_uxn_opcodes_h_l2735_c41_4aa5_ins <= VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_ins;
     gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output := gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_099c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output;
     VAR_lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_099c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue := VAR_gth2_uxn_opcodes_h_l2735_c41_4aa5_return_output;
     -- lth[uxn_opcodes_h_l2736_c41_9b61] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2736_c41_9b61_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2736_c41_9b61_phase <= VAR_lth_uxn_opcodes_h_l2736_c41_9b61_phase;
     lth_uxn_opcodes_h_l2736_c41_9b61_ins <= VAR_lth_uxn_opcodes_h_l2736_c41_9b61_ins;
     lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2736_c41_9b61_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2736_c41_9b61_return_output := lth_uxn_opcodes_h_l2736_c41_9b61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_787e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_cf91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output;
     VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_787e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue := VAR_lth_uxn_opcodes_h_l2736_c41_9b61_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_4a61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output;

     -- lth2[uxn_opcodes_h_l2737_c41_d9ed] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2737_c41_d9ed_phase <= VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_phase;
     lth2_uxn_opcodes_h_l2737_c41_d9ed_ins <= VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_ins;
     lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output := lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_e093] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output;
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_e093_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue := VAR_lth2_uxn_opcodes_h_l2737_c41_d9ed_return_output;
     -- jmp[uxn_opcodes_h_l2738_c41_3e91] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2738_c41_3e91_phase <= VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_phase;
     jmp_uxn_opcodes_h_l2738_c41_3e91_ins <= VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_ins;
     jmp_uxn_opcodes_h_l2738_c41_3e91_pc <= VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_pc;
     jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_return_output := jmp_uxn_opcodes_h_l2738_c41_3e91_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_2625] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_1e38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_2625_return_output;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_1e38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue := VAR_jmp_uxn_opcodes_h_l2738_c41_3e91_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_a6de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output;

     -- jmp2[uxn_opcodes_h_l2739_c41_2726] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2739_c41_2726_phase <= VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_phase;
     jmp2_uxn_opcodes_h_l2739_c41_2726_ins <= VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_ins;
     jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_return_output := jmp2_uxn_opcodes_h_l2739_c41_2726_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_6c4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output;
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_a6de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue := VAR_jmp2_uxn_opcodes_h_l2739_c41_2726_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5bdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output;

     -- jcn[uxn_opcodes_h_l2740_c41_294d] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2740_c41_294d_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2740_c41_294d_phase <= VAR_jcn_uxn_opcodes_h_l2740_c41_294d_phase;
     jcn_uxn_opcodes_h_l2740_c41_294d_ins <= VAR_jcn_uxn_opcodes_h_l2740_c41_294d_ins;
     jcn_uxn_opcodes_h_l2740_c41_294d_pc <= VAR_jcn_uxn_opcodes_h_l2740_c41_294d_pc;
     jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2740_c41_294d_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2740_c41_294d_return_output := jcn_uxn_opcodes_h_l2740_c41_294d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_7cf0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_7cf0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue := VAR_jcn_uxn_opcodes_h_l2740_c41_294d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_299a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output;

     -- jcn2[uxn_opcodes_h_l2741_c41_4d83] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2741_c41_4d83_phase <= VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_phase;
     jcn2_uxn_opcodes_h_l2741_c41_4d83_ins <= VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_ins;
     jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output := jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_fc69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output;
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_299a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue := VAR_jcn2_uxn_opcodes_h_l2741_c41_4d83_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_625c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_3def] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output;

     -- jsr[uxn_opcodes_h_l2742_c41_a6d5] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2742_c41_a6d5_phase <= VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_phase;
     jsr_uxn_opcodes_h_l2742_c41_a6d5_ins <= VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_ins;
     jsr_uxn_opcodes_h_l2742_c41_a6d5_pc <= VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_pc;
     jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output := jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_3def_return_output;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_625c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue := VAR_jsr_uxn_opcodes_h_l2742_c41_a6d5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_dac0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output;

     -- jsr2[uxn_opcodes_h_l2743_c41_0aff] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2743_c41_0aff_phase <= VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_phase;
     jsr2_uxn_opcodes_h_l2743_c41_0aff_ins <= VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_ins;
     jsr2_uxn_opcodes_h_l2743_c41_0aff_pc <= VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_pc;
     jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output := jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_0a91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output;
     VAR_sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_dac0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue := VAR_jsr2_uxn_opcodes_h_l2743_c41_0aff_return_output;
     -- sth[uxn_opcodes_h_l2744_c41_c304] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2744_c41_c304_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2744_c41_c304_phase <= VAR_sth_uxn_opcodes_h_l2744_c41_c304_phase;
     sth_uxn_opcodes_h_l2744_c41_c304_ins <= VAR_sth_uxn_opcodes_h_l2744_c41_c304_ins;
     sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2744_c41_c304_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2744_c41_c304_return_output := sth_uxn_opcodes_h_l2744_c41_c304_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_44af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_2522] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_44af_return_output;
     VAR_sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_2522_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue := VAR_sth_uxn_opcodes_h_l2744_c41_c304_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_12ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output;

     -- sth2[uxn_opcodes_h_l2745_c41_047e] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2745_c41_047e_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2745_c41_047e_phase <= VAR_sth2_uxn_opcodes_h_l2745_c41_047e_phase;
     sth2_uxn_opcodes_h_l2745_c41_047e_ins <= VAR_sth2_uxn_opcodes_h_l2745_c41_047e_ins;
     sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2745_c41_047e_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2745_c41_047e_return_output := sth2_uxn_opcodes_h_l2745_c41_047e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_d64c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output;
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_12ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue := VAR_sth2_uxn_opcodes_h_l2745_c41_047e_return_output;
     -- ldz[uxn_opcodes_h_l2746_c41_59bf] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2746_c41_59bf_phase <= VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_phase;
     ldz_uxn_opcodes_h_l2746_c41_59bf_ins <= VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_ins;
     ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_stack_read;
     ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_return_output := ldz_uxn_opcodes_h_l2746_c41_59bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_f5f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_2ad8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_2ad8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue := VAR_ldz_uxn_opcodes_h_l2746_c41_59bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_695d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output;

     -- ldz2[uxn_opcodes_h_l2747_c41_83b2] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2747_c41_83b2_phase <= VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_phase;
     ldz2_uxn_opcodes_h_l2747_c41_83b2_ins <= VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_ins;
     ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_stack_read;
     ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output := ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_2af8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_695d_return_output;
     VAR_stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_2af8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue := VAR_ldz2_uxn_opcodes_h_l2747_c41_83b2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_6825] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output;

     -- stz[uxn_opcodes_h_l2748_c41_df8c] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2748_c41_df8c_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2748_c41_df8c_phase <= VAR_stz_uxn_opcodes_h_l2748_c41_df8c_phase;
     stz_uxn_opcodes_h_l2748_c41_df8c_ins <= VAR_stz_uxn_opcodes_h_l2748_c41_df8c_ins;
     stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2748_c41_df8c_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2748_c41_df8c_return_output := stz_uxn_opcodes_h_l2748_c41_df8c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_aefa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_6825_return_output;
     VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_aefa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue := VAR_stz_uxn_opcodes_h_l2748_c41_df8c_return_output;
     -- stz2[uxn_opcodes_h_l2749_c41_cd09] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2749_c41_cd09_phase <= VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_phase;
     stz2_uxn_opcodes_h_l2749_c41_cd09_ins <= VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_ins;
     stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_return_output := stz2_uxn_opcodes_h_l2749_c41_cd09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_a562] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_bda7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_a562_return_output;
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_bda7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue := VAR_stz2_uxn_opcodes_h_l2749_c41_cd09_return_output;
     -- ldr[uxn_opcodes_h_l2750_c41_3742] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2750_c41_3742_phase <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_phase;
     ldr_uxn_opcodes_h_l2750_c41_3742_ins <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_ins;
     ldr_uxn_opcodes_h_l2750_c41_3742_pc <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_pc;
     ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_stack_read;
     ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2750_c41_3742_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2750_c41_3742_return_output := ldr_uxn_opcodes_h_l2750_c41_3742_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_0029] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_0617] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_0617_return_output;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_0029_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue := VAR_ldr_uxn_opcodes_h_l2750_c41_3742_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_8d5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_221f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output;

     -- ldr2[uxn_opcodes_h_l2751_c41_97ee] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2751_c41_97ee_phase <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_phase;
     ldr2_uxn_opcodes_h_l2751_c41_97ee_ins <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_ins;
     ldr2_uxn_opcodes_h_l2751_c41_97ee_pc <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_pc;
     ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_stack_read;
     ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output := ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_221f_return_output;
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_8d5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue := VAR_ldr2_uxn_opcodes_h_l2751_c41_97ee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_7833] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_8927] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output;

     -- str1[uxn_opcodes_h_l2752_c41_4932] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2752_c41_4932_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2752_c41_4932_phase <= VAR_str1_uxn_opcodes_h_l2752_c41_4932_phase;
     str1_uxn_opcodes_h_l2752_c41_4932_ins <= VAR_str1_uxn_opcodes_h_l2752_c41_4932_ins;
     str1_uxn_opcodes_h_l2752_c41_4932_pc <= VAR_str1_uxn_opcodes_h_l2752_c41_4932_pc;
     str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2752_c41_4932_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2752_c41_4932_return_output := str1_uxn_opcodes_h_l2752_c41_4932_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7833_return_output;
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_8927_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue := VAR_str1_uxn_opcodes_h_l2752_c41_4932_return_output;
     -- str2[uxn_opcodes_h_l2753_c41_fcc7] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2753_c41_fcc7_phase <= VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_phase;
     str2_uxn_opcodes_h_l2753_c41_fcc7_ins <= VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_ins;
     str2_uxn_opcodes_h_l2753_c41_fcc7_pc <= VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_pc;
     str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_return_output := str2_uxn_opcodes_h_l2753_c41_fcc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_80e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_70ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output;
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_70ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue := VAR_str2_uxn_opcodes_h_l2753_c41_fcc7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_e91e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output;

     -- lda[uxn_opcodes_h_l2754_c41_ccf6] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2754_c41_ccf6_phase <= VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_phase;
     lda_uxn_opcodes_h_l2754_c41_ccf6_ins <= VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_ins;
     lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_stack_read;
     lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_return_output := lda_uxn_opcodes_h_l2754_c41_ccf6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_742b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output;
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_742b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue := VAR_lda_uxn_opcodes_h_l2754_c41_ccf6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_ce98] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output;

     -- lda2[uxn_opcodes_h_l2755_c41_c1a6] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2755_c41_c1a6_phase <= VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_phase;
     lda2_uxn_opcodes_h_l2755_c41_c1a6_ins <= VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_ins;
     lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_stack_read;
     lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output := lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_03b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output;
     VAR_sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_03b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue := VAR_lda2_uxn_opcodes_h_l2755_c41_c1a6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_94dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_6e4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output;

     -- sta[uxn_opcodes_h_l2756_c41_29d9] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2756_c41_29d9_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2756_c41_29d9_phase <= VAR_sta_uxn_opcodes_h_l2756_c41_29d9_phase;
     sta_uxn_opcodes_h_l2756_c41_29d9_ins <= VAR_sta_uxn_opcodes_h_l2756_c41_29d9_ins;
     sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2756_c41_29d9_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2756_c41_29d9_return_output := sta_uxn_opcodes_h_l2756_c41_29d9_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output;
     VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_6e4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue := VAR_sta_uxn_opcodes_h_l2756_c41_29d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_6e42] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output;

     -- sta2[uxn_opcodes_h_l2757_c41_0c4f] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2757_c41_0c4f_phase <= VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_phase;
     sta2_uxn_opcodes_h_l2757_c41_0c4f_ins <= VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_ins;
     sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output := sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_177f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_177f_return_output;
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_6e42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue := VAR_sta2_uxn_opcodes_h_l2757_c41_0c4f_return_output;
     -- dei[uxn_opcodes_h_l2758_c41_c641] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2758_c41_c641_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2758_c41_c641_phase <= VAR_dei_uxn_opcodes_h_l2758_c41_c641_phase;
     dei_uxn_opcodes_h_l2758_c41_c641_ins <= VAR_dei_uxn_opcodes_h_l2758_c41_c641_ins;
     dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_stack_read;
     dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2758_c41_c641_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2758_c41_c641_return_output := dei_uxn_opcodes_h_l2758_c41_c641_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_de0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_1489] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output;
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_1489_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue := VAR_dei_uxn_opcodes_h_l2758_c41_c641_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_21ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output;

     -- dei2[uxn_opcodes_h_l2759_c41_c0d9] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2759_c41_c0d9_phase <= VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_phase;
     dei2_uxn_opcodes_h_l2759_c41_c0d9_ins <= VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_ins;
     dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_stack_read;
     dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output := dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_aea1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output;
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_aea1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue := VAR_dei2_uxn_opcodes_h_l2759_c41_c0d9_return_output;
     -- deo[uxn_opcodes_h_l2760_c41_7fba] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2760_c41_7fba_phase <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_phase;
     deo_uxn_opcodes_h_l2760_c41_7fba_ins <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_ins;
     deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_stack_read;
     deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_device_ram_read;
     deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2760_c41_7fba_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2760_c41_7fba_return_output := deo_uxn_opcodes_h_l2760_c41_7fba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_56d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_5831] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_5831_return_output;
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_56d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue := VAR_deo_uxn_opcodes_h_l2760_c41_7fba_return_output;
     -- deo2[uxn_opcodes_h_l2761_c41_78c6] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2761_c41_78c6_phase <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_phase;
     deo2_uxn_opcodes_h_l2761_c41_78c6_ins <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_ins;
     deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_stack_read;
     deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_return_output := deo2_uxn_opcodes_h_l2761_c41_78c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_c666] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_dab2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_c666_return_output;
     VAR_add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_dab2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue := VAR_deo2_uxn_opcodes_h_l2761_c41_78c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_7339] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_561b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output;

     -- add[uxn_opcodes_h_l2762_c41_7897] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2762_c41_7897_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2762_c41_7897_phase <= VAR_add_uxn_opcodes_h_l2762_c41_7897_phase;
     add_uxn_opcodes_h_l2762_c41_7897_ins <= VAR_add_uxn_opcodes_h_l2762_c41_7897_ins;
     add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read <= VAR_add_uxn_opcodes_h_l2762_c41_7897_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2762_c41_7897_return_output := add_uxn_opcodes_h_l2762_c41_7897_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_561b_return_output;
     VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_7339_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue := VAR_add_uxn_opcodes_h_l2762_c41_7897_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_0048] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output;

     -- add2[uxn_opcodes_h_l2763_c41_5bc9] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2763_c41_5bc9_phase <= VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_phase;
     add2_uxn_opcodes_h_l2763_c41_5bc9_ins <= VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_ins;
     add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_return_output := add2_uxn_opcodes_h_l2763_c41_5bc9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_9967] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_0048_return_output;
     VAR_sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_9967_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue := VAR_add2_uxn_opcodes_h_l2763_c41_5bc9_return_output;
     -- sub[uxn_opcodes_h_l2764_c41_8871] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2764_c41_8871_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2764_c41_8871_phase <= VAR_sub_uxn_opcodes_h_l2764_c41_8871_phase;
     sub_uxn_opcodes_h_l2764_c41_8871_ins <= VAR_sub_uxn_opcodes_h_l2764_c41_8871_ins;
     sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2764_c41_8871_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2764_c41_8871_return_output := sub_uxn_opcodes_h_l2764_c41_8871_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_c81a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_3107] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3107_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue := VAR_sub_uxn_opcodes_h_l2764_c41_8871_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_d993] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_e535] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output;

     -- sub2[uxn_opcodes_h_l2765_c41_ff9e] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2765_c41_ff9e_phase <= VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_phase;
     sub2_uxn_opcodes_h_l2765_c41_ff9e_ins <= VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_ins;
     sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output := sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_e535_return_output;
     VAR_mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_d993_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue := VAR_sub2_uxn_opcodes_h_l2765_c41_ff9e_return_output;
     -- mul[uxn_opcodes_h_l2766_c41_342d] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2766_c41_342d_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2766_c41_342d_phase <= VAR_mul_uxn_opcodes_h_l2766_c41_342d_phase;
     mul_uxn_opcodes_h_l2766_c41_342d_ins <= VAR_mul_uxn_opcodes_h_l2766_c41_342d_ins;
     mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2766_c41_342d_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2766_c41_342d_return_output := mul_uxn_opcodes_h_l2766_c41_342d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_d474] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_b72f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output;
     VAR_mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_d474_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue := VAR_mul_uxn_opcodes_h_l2766_c41_342d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_f1e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output;

     -- mul2[uxn_opcodes_h_l2767_c41_5244] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2767_c41_5244_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2767_c41_5244_phase <= VAR_mul2_uxn_opcodes_h_l2767_c41_5244_phase;
     mul2_uxn_opcodes_h_l2767_c41_5244_ins <= VAR_mul2_uxn_opcodes_h_l2767_c41_5244_ins;
     mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2767_c41_5244_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2767_c41_5244_return_output := mul2_uxn_opcodes_h_l2767_c41_5244_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_7303] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_7303_return_output;
     VAR_div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_f1e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue := VAR_mul2_uxn_opcodes_h_l2767_c41_5244_return_output;
     -- div[uxn_opcodes_h_l2768_c41_88d7] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2768_c41_88d7_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2768_c41_88d7_phase <= VAR_div_uxn_opcodes_h_l2768_c41_88d7_phase;
     div_uxn_opcodes_h_l2768_c41_88d7_ins <= VAR_div_uxn_opcodes_h_l2768_c41_88d7_ins;
     div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read <= VAR_div_uxn_opcodes_h_l2768_c41_88d7_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2768_c41_88d7_return_output := div_uxn_opcodes_h_l2768_c41_88d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_df84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_2fe7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_df84_return_output;
     VAR_div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_2fe7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue := VAR_div_uxn_opcodes_h_l2768_c41_88d7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_3728] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_1b83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output;

     -- div2[uxn_opcodes_h_l2769_c41_941d] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2769_c41_941d_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2769_c41_941d_phase <= VAR_div2_uxn_opcodes_h_l2769_c41_941d_phase;
     div2_uxn_opcodes_h_l2769_c41_941d_ins <= VAR_div2_uxn_opcodes_h_l2769_c41_941d_ins;
     div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2769_c41_941d_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2769_c41_941d_return_output := div2_uxn_opcodes_h_l2769_c41_941d_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output;
     VAR_and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_3728_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue := VAR_div2_uxn_opcodes_h_l2769_c41_941d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_c99f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_e810] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output;

     -- and[uxn_opcodes_h_l2770_c41_638f] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2770_c41_638f_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2770_c41_638f_phase <= VAR_and_uxn_opcodes_h_l2770_c41_638f_phase;
     and_uxn_opcodes_h_l2770_c41_638f_ins <= VAR_and_uxn_opcodes_h_l2770_c41_638f_ins;
     and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read <= VAR_and_uxn_opcodes_h_l2770_c41_638f_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2770_c41_638f_return_output := and_uxn_opcodes_h_l2770_c41_638f_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_e810_return_output;
     VAR_and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_c99f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue := VAR_and_uxn_opcodes_h_l2770_c41_638f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_bd7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output;

     -- and2[uxn_opcodes_h_l2771_c41_3f58] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2771_c41_3f58_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2771_c41_3f58_phase <= VAR_and2_uxn_opcodes_h_l2771_c41_3f58_phase;
     and2_uxn_opcodes_h_l2771_c41_3f58_ins <= VAR_and2_uxn_opcodes_h_l2771_c41_3f58_ins;
     and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2771_c41_3f58_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2771_c41_3f58_return_output := and2_uxn_opcodes_h_l2771_c41_3f58_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_b3f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output;
     VAR_ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_b3f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue := VAR_and2_uxn_opcodes_h_l2771_c41_3f58_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_4a26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output;

     -- ora[uxn_opcodes_h_l2772_c41_118b] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2772_c41_118b_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2772_c41_118b_phase <= VAR_ora_uxn_opcodes_h_l2772_c41_118b_phase;
     ora_uxn_opcodes_h_l2772_c41_118b_ins <= VAR_ora_uxn_opcodes_h_l2772_c41_118b_ins;
     ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2772_c41_118b_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2772_c41_118b_return_output := ora_uxn_opcodes_h_l2772_c41_118b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_7014] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output;
     VAR_ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_7014_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue := VAR_ora_uxn_opcodes_h_l2772_c41_118b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_8b1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_4165] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output;

     -- ora2[uxn_opcodes_h_l2773_c41_7113] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2773_c41_7113_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2773_c41_7113_phase <= VAR_ora2_uxn_opcodes_h_l2773_c41_7113_phase;
     ora2_uxn_opcodes_h_l2773_c41_7113_ins <= VAR_ora2_uxn_opcodes_h_l2773_c41_7113_ins;
     ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2773_c41_7113_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2773_c41_7113_return_output := ora2_uxn_opcodes_h_l2773_c41_7113_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_4165_return_output;
     VAR_eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8b1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue := VAR_ora2_uxn_opcodes_h_l2773_c41_7113_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_c117] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output;

     -- eor[uxn_opcodes_h_l2774_c41_ba68] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2774_c41_ba68_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2774_c41_ba68_phase <= VAR_eor_uxn_opcodes_h_l2774_c41_ba68_phase;
     eor_uxn_opcodes_h_l2774_c41_ba68_ins <= VAR_eor_uxn_opcodes_h_l2774_c41_ba68_ins;
     eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2774_c41_ba68_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2774_c41_ba68_return_output := eor_uxn_opcodes_h_l2774_c41_ba68_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_f3f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output;
     VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_c117_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue := VAR_eor_uxn_opcodes_h_l2774_c41_ba68_return_output;
     -- eor2[uxn_opcodes_h_l2775_c41_e4e4] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2775_c41_e4e4_phase <= VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_phase;
     eor2_uxn_opcodes_h_l2775_c41_e4e4_ins <= VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_ins;
     eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output := eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_c552] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_c111] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_c111_return_output;
     VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_c552_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue := VAR_eor2_uxn_opcodes_h_l2775_c41_e4e4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_fc49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_9d06] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output;

     -- sft[uxn_opcodes_h_l2776_c41_8a6e] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2776_c41_8a6e_phase <= VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_phase;
     sft_uxn_opcodes_h_l2776_c41_8a6e_ins <= VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_ins;
     sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_return_output := sft_uxn_opcodes_h_l2776_c41_8a6e_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_fc49_return_output;
     VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_9d06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue := VAR_sft_uxn_opcodes_h_l2776_c41_8a6e_return_output;
     -- sft2[uxn_opcodes_h_l2777_c41_c37b] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2777_c41_c37b_phase <= VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_phase;
     sft2_uxn_opcodes_h_l2777_c41_c37b_ins <= VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_ins;
     sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_return_output := sft2_uxn_opcodes_h_l2777_c41_c37b_return_output;

     -- printf_uxn_opcodes_h_l2778_c9_60b2[uxn_opcodes_h_l2778_c9_60b2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0 <= VAR_printf_uxn_opcodes_h_l2778_c9_60b2_uxn_opcodes_h_l2778_c9_60b2_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue := VAR_sft2_uxn_opcodes_h_l2777_c41_c37b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2777_c7_c111] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_cond;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output := opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_c111_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2776_c7_f3f9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_cond;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output := opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_f3f9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2775_c7_4165] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_cond;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output := opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_4165_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2774_c7_4a26] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_cond;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output := opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_4a26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2773_c7_bd7b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_cond;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output := opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_bd7b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2772_c7_e810] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_cond;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output := opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_e810_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2771_c7_1b83] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_cond;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output := opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_1b83_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2770_c7_df84] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_cond;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output := opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_df84_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2769_c7_7303] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_cond;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output := opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_7303_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2768_c7_b72f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_cond;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output := opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_b72f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2767_c7_e535] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_cond;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output := opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_e535_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2766_c7_c81a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_cond;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output := opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c81a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2765_c7_0048] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_cond;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output := opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_0048_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2764_c7_561b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_cond;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output := opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_561b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2763_c7_c666] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_cond;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output := opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_c666_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2762_c7_5831] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_cond;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output := opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_5831_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2761_c7_21ae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_cond;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output := opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_21ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2760_c7_de0c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_cond;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output := opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_de0c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2759_c7_177f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_cond;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output := opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_177f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2758_c7_94dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_cond;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output := opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_94dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2757_c7_ce98] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_cond;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output := opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_ce98_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2756_c7_e91e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_cond;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output := opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_e91e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2755_c7_80e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_cond;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output := opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_80e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2754_c7_7833] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_cond;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output := opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7833_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2753_c7_221f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_cond;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output := opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_221f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2752_c7_0617] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_cond;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output := opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_0617_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2751_c7_a562] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_cond;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output := opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_a562_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2750_c7_6825] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_cond;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output := opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_6825_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2749_c7_695d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_cond;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output := opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_695d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2748_c7_f5f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output := opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_f5f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2747_c7_d64c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_cond;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output := opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_d64c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2746_c7_44af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_cond;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output := opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_44af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2745_c7_0a91] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_cond;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output := opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_0a91_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2744_c7_3def] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_cond;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output := opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_3def_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_fc69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_fc69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_5bdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5bdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_6c4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_6c4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_2625] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_2625_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_4a61] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_4a61_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_cf91] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_cf91_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_ae56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_ae56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_d676] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_d676_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_0b2f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_0b2f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_2a26] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_2a26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_a255] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_a255_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_fd8e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_fd8e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_1963] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_1963_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_0eac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0eac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_0811] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_0811_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_011d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_011d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_5fc7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_5fc7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_2002] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_2002_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_ad64] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_ad64_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_2056] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_2056_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_67d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_67d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_78f9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_78f9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_ff3a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ff3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_08a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_08a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c7_8f9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_8f9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2718_c7_855e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_cond;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output := opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_855e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2717_c7_64af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_cond;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output := opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_64af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2716_c7_1a0c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_cond;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output := opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_1a0c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2715_c7_c381] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_cond;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output := opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_c381_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2714_c7_64b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output := opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_64b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2713_c7_455b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_cond;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output := opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_455b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2712_c7_8a96] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_cond;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output := opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_8a96_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2711_c7_57b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_cond;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output := opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_57b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2710_c7_0ddc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_cond;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output := opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_0ddc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2709_c7_2a13] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_cond;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output := opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_2a13_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2708_c2_c216] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_cond;
     opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output := opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2791_c70_60e9] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_60e9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2806_c34_5760] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_5760_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2802_c40_a0d0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_a0d0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2801_c39_e71b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_e71b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2797_c3_76f7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_76f7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_stack_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2808_c33_defe] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_defe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_1631 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_1631_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2803_c34_5498] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_5498_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2783_c6_31b1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_31b1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_bd5d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_bd5d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2781_c17_311b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_311b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2807_c37_54f9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_54f9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2805_c33_df3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_df3b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2804_c30_626c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_626c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2810_c32_a9ef] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_a9ef_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_c216_return_output.is_opc_done;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_31b1_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_31b1_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_311b_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_76f7_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_1631_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_5ae3 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_5ae3_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_bd5d_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2781_c2_854b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_left;
     BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output := BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2791_c59_629e] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_629e_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_60e9_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_453c LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_453c_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9(
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_c216_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_e71b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_a0d0_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_5498_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_626c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_df3b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_5760_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_54f9_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_defe_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_1631_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_a9ef_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l2791_c30_3435_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;
     VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_854b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_5ae3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_5ae3_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_629e_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_453c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_453c_return_output;
     -- MUX[uxn_opcodes_h_l2792_c20_9c14] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2792_c20_9c14_cond <= VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_cond;
     MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue <= VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iftrue;
     MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse <= VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_return_output := MUX_uxn_opcodes_h_l2792_c20_9c14_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2785_c4_c59f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2787_c4_071e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l2785_c4_361c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_c59f_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2787_c4_b97b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_071e_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right := VAR_MUX_uxn_opcodes_h_l2792_c20_9c14_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse := VAR_sp0_uxn_opcodes_h_l2787_c4_b97b;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue := VAR_sp1_uxn_opcodes_h_l2785_c4_361c;
     -- sp0_MUX[uxn_opcodes_h_l2784_c3_1694] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_cond;
     sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue;
     sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output := sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2784_c3_1694] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_cond;
     sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iftrue;
     sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output := sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_1694_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_1694_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2783_c2_c08d] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_cond;
     sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue;
     sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output := sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2783_c2_c08d] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_cond;
     sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iftrue;
     sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output := sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;
     VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_c08d_return_output;
     -- MUX[uxn_opcodes_h_l2791_c30_3435] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2791_c30_3435_cond <= VAR_MUX_uxn_opcodes_h_l2791_c30_3435_cond;
     MUX_uxn_opcodes_h_l2791_c30_3435_iftrue <= VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iftrue;
     MUX_uxn_opcodes_h_l2791_c30_3435_iffalse <= VAR_MUX_uxn_opcodes_h_l2791_c30_3435_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2791_c30_3435_return_output := MUX_uxn_opcodes_h_l2791_c30_3435_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2791_c19_620c] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_620c_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2791_c30_3435_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_620c_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2791_c19_5138] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_5138_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2792_c2_d681] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l2792_c2_1a01 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_d681_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2792_c2_1a01;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address := VAR_stack_address_uxn_opcodes_h_l2792_c2_1a01;
     -- stack_ram_update[uxn_opcodes_h_l2794_c21_a3ef] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_stack_address;
     stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_value;
     stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output := stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_a3ef_return_output;
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
