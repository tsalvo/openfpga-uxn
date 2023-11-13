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
-- BIN_OP_AND[uxn_opcodes_h_l2704_c10_e916]
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2704_c10_90ca]
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2704_c41_58f1]
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2704_c57_304c]
signal CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2704_c10_27dc]
signal MUX_uxn_opcodes_h_l2704_c10_27dc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2704_c10_27dc_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l2706_c2_8670[uxn_opcodes_h_l2706_c2_8670]
signal printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_441b]
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_bc23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_7b5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2708_c2_b1d5]
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2708_c2_b1d5]
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2708_c23_dca8[uxn_opcodes_h_l2708_c23_dca8]
signal printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_cebc]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_0aab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_580c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2709_c7_7b5d]
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2709_c41_0665]
signal jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_0665_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_0665_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2709_c41_0665_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_ed7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_fd64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_c13d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2710_c7_580c]
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2710_c41_1f91]
signal jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_1f91_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_1f91_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2710_c41_1f91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_d736]
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_036e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_f381]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2711_c7_c13d]
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2711_c41_aaef]
signal jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_aaef_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_aaef_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2711_c41_aaef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_1fe7]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_cdd0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_6150]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2712_c7_f381]
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2712_c41_a531]
signal lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_a531_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_a531_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2712_c41_a531_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_ee03]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_e0ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_2502]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2713_c7_6150]
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2713_c41_6ced]
signal lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_6ced_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_6ced_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2713_c41_6ced_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_4f39]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_dab8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_abd3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2714_c7_2502]
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2714_c41_c04c]
signal lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_c04c_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_c04c_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2714_c41_c04c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_9dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_6c43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_4a95]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2715_c7_abd3]
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2715_c41_9153]
signal lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_9153_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_9153_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2715_c41_9153_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_f602]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_36bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_ccd7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2716_c7_4a95]
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2716_c41_fe0d]
signal inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_fe0d_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_fe0d_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2716_c41_fe0d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_7b0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_47b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_3d19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2717_c7_ccd7]
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2717_c41_d1cb]
signal inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_d1cb_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_d1cb_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_aa54]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_c865]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_46d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2718_c7_3d19]
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2718_c41_aaf3]
signal pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_aaf3_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_aaf3_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2718_c41_aaf3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_cd65]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_cc75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_3c44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c7_46d1]
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2719_c41_a872]
signal pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_a872_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_a872_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2719_c41_a872_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_40de]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_080c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_b932]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_3c44]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2720_c41_491c]
signal nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_491c_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_491c_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2720_c41_491c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_136f]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_ce66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_a601]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_b932]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2721_c41_48ba]
signal nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_48ba_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_48ba_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2721_c41_48ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_d248]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_7ec3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_0fe1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_a601]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2722_c41_391a]
signal swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_391a_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_391a_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2722_c41_391a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_d85f]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_de59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_b6b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_0fe1]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2723_c41_934d]
signal swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_934d_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_934d_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2723_c41_934d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_5cbc]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_d928]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_e732]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_b6b0]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2724_c41_6e38]
signal rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_6e38_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_6e38_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2724_c41_6e38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_69c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_5fee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_5c49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_e732]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2725_c41_2659]
signal rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_2659_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_2659_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2725_c41_2659_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_b045]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_2617]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_fc65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_5c49]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2726_c41_c0af]
signal dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_c0af_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_c0af_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2726_c41_c0af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_a512]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_d34f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_e024]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_fc65]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2727_c41_4986]
signal dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_4986_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_4986_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2727_c41_4986_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_5451]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_35d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_2b47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_e024]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2728_c41_e2b1]
signal ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_e2b1_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_e2b1_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_4e49]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_0d58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_7606]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_2b47]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2729_c41_0aa9]
signal ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_7bea]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_1217]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_b9a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_7606]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2730_c41_76b8]
signal equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_76b8_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_76b8_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2730_c41_76b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_b3b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_17e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_9b69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_b9a6]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2731_c41_0992]
signal equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_0992_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_0992_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2731_c41_0992_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_ce49]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_5d72]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_3086]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_9b69]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2732_c41_a19f]
signal neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_a19f_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_a19f_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2732_c41_a19f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_de6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_2f5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_439f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_3086]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2733_c41_434c]
signal neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_434c_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_434c_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2733_c41_434c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_4324]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_7504]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_09ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_439f]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2734_c41_687d]
signal gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_687d_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_687d_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2734_c41_687d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_3f4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_388d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_7381]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_09ef]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2735_c41_8f3d]
signal gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_8f3d_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_8f3d_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_789d]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_469b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_5dbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_7381]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2736_c41_7ca9]
signal lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_7ca9_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_7ca9_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2736_c41_7ca9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_211f]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_06fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_6cfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_5dbb]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2737_c41_23a9]
signal lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_23a9_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_23a9_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2737_c41_23a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_08af]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_b0b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_650b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_6cfc]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2738_c41_efa4]
signal jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_efa4_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_efa4_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_efa4_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2738_c41_efa4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_feda]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_309f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_75c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_650b]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2739_c41_208f]
signal jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_208f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_208f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2739_c41_208f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_d4ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_51ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_3662]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_75c9]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2740_c41_c99b]
signal jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_c99b_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_c99b_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_c99b_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2740_c41_c99b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_1640]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_ac66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_bb5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_3662]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2741_c41_f823]
signal jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_f823_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_f823_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2741_c41_f823_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_7330]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_f48a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_b75e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_bb5d]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2742_c41_7762]
signal jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_7762_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_7762_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_7762_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2742_c41_7762_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_5e47]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_d6e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_4d1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_b75e]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2743_c41_331d]
signal jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_331d_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_331d_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_331d_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2743_c41_331d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_fc46]
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_1542]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_cfaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2744_c7_4d1c]
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2744_c41_ad10]
signal sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_ad10_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_ad10_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2744_c41_ad10_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_068a]
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_c289]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_668d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2745_c7_cfaf]
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2745_c41_c165]
signal sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_c165_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_c165_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2745_c41_c165_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_3253]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_03d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_e513]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2746_c7_668d]
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2746_c41_2bc9]
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_3466]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_a5f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_22ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2747_c7_e513]
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2747_c41_8b6a]
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_04bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_78af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_fcba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2748_c7_22ef]
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2748_c41_56da]
signal stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_56da_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_56da_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2748_c41_56da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_bb64]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_125e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_e82b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2749_c7_fcba]
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2749_c41_0bea]
signal stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_0bea_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_0bea_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2749_c41_0bea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_99c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_0d34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_17e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2750_c7_e82b]
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2750_c41_dc44]
signal ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2750_c41_dc44_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_b797]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_11d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_4c5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2751_c7_17e0]
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2751_c41_39fa]
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_2de5]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_99c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_891a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2752_c7_4c5e]
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2752_c41_dfd3]
signal str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_dfd3_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_dfd3_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_dfd3_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2752_c41_dfd3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_4078]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_10e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_7a9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2753_c7_891a]
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2753_c41_d977]
signal str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_d977_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_d977_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_d977_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2753_c41_d977_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_4c2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_9dd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_eade]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2754_c7_7a9d]
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2754_c41_acf5]
signal lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_acf5_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_acf5_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2754_c41_acf5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_1276]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_c237]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_8fc4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2755_c7_eade]
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2755_c41_9017]
signal lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_9017_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_9017_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2755_c41_9017_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_e66c]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_bf8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_0da4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2756_c7_8fc4]
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2756_c41_84c3]
signal sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_84c3_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_84c3_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2756_c41_84c3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_3d58]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_02d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_75e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2757_c7_0da4]
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2757_c41_da54]
signal sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_da54_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_da54_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2757_c41_da54_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_b87f]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_4b64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_1f49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2758_c7_75e8]
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2758_c41_9a15]
signal dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_9a15_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_9a15_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2758_c41_9a15_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_154c]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_a849]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_20f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2759_c7_1f49]
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2759_c41_68eb]
signal dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_68eb_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_68eb_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2759_c41_68eb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_b12a]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_afb1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_1fdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2760_c7_20f0]
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2760_c41_fddb]
signal deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2760_c41_fddb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_d3dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_380f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_449e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2761_c7_1fdd]
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2761_c41_716b]
signal deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2761_c41_716b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_bb6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_6cc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_0e2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2762_c7_449e]
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2762_c41_a806]
signal add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2762_c41_a806_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_a806_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2762_c41_a806_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_a2b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_852e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_8897]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2763_c7_0e2a]
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2763_c41_aa94]
signal add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_aa94_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_aa94_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2763_c41_aa94_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_513e]
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_7bb3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_e2ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2764_c7_8897]
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2764_c41_9e31]
signal sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_9e31_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_9e31_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2764_c41_9e31_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_9dcd]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_c36f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_7e02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2765_c7_e2ff]
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2765_c41_ce76]
signal sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ce76_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ce76_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2765_c41_ce76_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_47de]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_dc80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_9a1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2766_c7_7e02]
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2766_c41_fb6e]
signal mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_fb6e_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_fb6e_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2766_c41_fb6e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_46ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_602f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_4cd7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2767_c7_9a1a]
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2767_c41_0a10]
signal mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_0a10_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_0a10_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2767_c41_0a10_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_6ebd]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d36d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_5c49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2768_c7_4cd7]
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2768_c41_782d]
signal div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2768_c41_782d_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_782d_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2768_c41_782d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_8943]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_7a53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_3dec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2769_c7_5c49]
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2769_c41_d310]
signal div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_d310_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_d310_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2769_c41_d310_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_46b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_741a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_d65e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2770_c7_3dec]
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2770_c41_e3cf]
signal and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2770_c41_e3cf_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_e3cf_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2770_c41_e3cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_d74f]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_43aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_fead]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2771_c7_d65e]
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2771_c41_dfe1]
signal and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_dfe1_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_dfe1_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2771_c41_dfe1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_1502]
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_52b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_b89e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2772_c7_fead]
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2772_c41_9d8d]
signal ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_9d8d_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_9d8d_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2772_c41_9d8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_ab3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_d9f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_1485]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2773_c7_b89e]
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2773_c41_b350]
signal ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_b350_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_b350_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2773_c41_b350_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_fc11]
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_dc7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_e7a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2774_c7_1485]
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2774_c41_4189]
signal eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_4189_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_4189_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2774_c41_4189_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_6e34]
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_67d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_612f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2775_c7_e7a0]
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2775_c41_6ee3]
signal eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_6ee3_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_6ee3_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_0f70]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_1289]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_fd76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2776_c7_612f]
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2776_c41_6482]
signal sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_6482_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_6482_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2776_c41_6482_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_d795]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_b2be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_ab00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2777_c7_fd76]
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2777_c41_6665]
signal sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_6665_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_6665_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2777_c41_6665_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2778_c9_961b[uxn_opcodes_h_l2778_c9_961b]
signal printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2780_c18_7faa]
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2780_c18_3a82]
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2780_c18_9c4c]
signal MUX_uxn_opcodes_h_l2780_c18_9c4c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2781_c2_e864]
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2783_c2_93b8]
signal sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2783_c2_93b8]
signal sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2784_c3_acd8]
signal sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2784_c3_acd8]
signal sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2785_c4_b331]
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2787_c4_5a65]
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2791_c30_caa5]
signal MUX_uxn_opcodes_h_l2791_c30_caa5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2791_c30_caa5_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2791_c19_b06b]
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2792_c20_556d]
signal MUX_uxn_opcodes_h_l2792_c20_556d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_556d_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_556d_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2792_c20_556d_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2792_c2_df4e]
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2794_c21_6fdf]
signal stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916
BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left,
BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right,
BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca
BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left,
BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right,
BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1
BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left,
BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right,
BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2704_c57_304c
CONST_SL_4_uxn_opcodes_h_l2704_c57_304c : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x,
CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output);

-- MUX_uxn_opcodes_h_l2704_c10_27dc
MUX_uxn_opcodes_h_l2704_c10_27dc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2704_c10_27dc_cond,
MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue,
MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse,
MUX_uxn_opcodes_h_l2704_c10_27dc_return_output);

-- printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670
printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670 : entity work.printf_uxn_opcodes_h_l2706_c2_8670_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0,
printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1,
printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5
opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond,
opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5
is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond,
is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue,
is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse,
is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output);

-- printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8
printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8 : entity work.printf_uxn_opcodes_h_l2708_c23_dca8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d
opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond,
opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output);

-- jci_uxn_opcodes_h_l2709_c41_0665
jci_uxn_opcodes_h_l2709_c41_0665 : entity work.jci_0CLK_edc09f97 port map (
clk,
jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2709_c41_0665_phase,
jci_uxn_opcodes_h_l2709_c41_0665_pc,
jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read,
jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read,
jci_uxn_opcodes_h_l2709_c41_0665_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2710_c7_580c
opc_result_MUX_uxn_opcodes_h_l2710_c7_580c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond,
opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output);

-- jmi_uxn_opcodes_h_l2710_c41_1f91
jmi_uxn_opcodes_h_l2710_c41_1f91 : entity work.jmi_0CLK_8f4d4fc5 port map (
clk,
jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2710_c41_1f91_phase,
jmi_uxn_opcodes_h_l2710_c41_1f91_pc,
jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read,
jmi_uxn_opcodes_h_l2710_c41_1f91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d
opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond,
opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output);

-- jsi_uxn_opcodes_h_l2711_c41_aaef
jsi_uxn_opcodes_h_l2711_c41_aaef : entity work.jsi_0CLK_af8c339b port map (
clk,
jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2711_c41_aaef_phase,
jsi_uxn_opcodes_h_l2711_c41_aaef_pc,
jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read,
jsi_uxn_opcodes_h_l2711_c41_aaef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2712_c7_f381
opc_result_MUX_uxn_opcodes_h_l2712_c7_f381 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond,
opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue,
opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse,
opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output);

-- lit_uxn_opcodes_h_l2712_c41_a531
lit_uxn_opcodes_h_l2712_c41_a531 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2712_c41_a531_phase,
lit_uxn_opcodes_h_l2712_c41_a531_pc,
lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read,
lit_uxn_opcodes_h_l2712_c41_a531_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2713_c7_6150
opc_result_MUX_uxn_opcodes_h_l2713_c7_6150 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond,
opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue,
opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse,
opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output);

-- lit2_uxn_opcodes_h_l2713_c41_6ced
lit2_uxn_opcodes_h_l2713_c41_6ced : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2713_c41_6ced_phase,
lit2_uxn_opcodes_h_l2713_c41_6ced_pc,
lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read,
lit2_uxn_opcodes_h_l2713_c41_6ced_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2714_c7_2502
opc_result_MUX_uxn_opcodes_h_l2714_c7_2502 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond,
opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue,
opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse,
opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output);

-- lit_uxn_opcodes_h_l2714_c41_c04c
lit_uxn_opcodes_h_l2714_c41_c04c : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2714_c41_c04c_phase,
lit_uxn_opcodes_h_l2714_c41_c04c_pc,
lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read,
lit_uxn_opcodes_h_l2714_c41_c04c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3
opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond,
opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output);

-- lit2_uxn_opcodes_h_l2715_c41_9153
lit2_uxn_opcodes_h_l2715_c41_9153 : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2715_c41_9153_phase,
lit2_uxn_opcodes_h_l2715_c41_9153_pc,
lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read,
lit2_uxn_opcodes_h_l2715_c41_9153_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95
opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond,
opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue,
opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse,
opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output);

-- inc_uxn_opcodes_h_l2716_c41_fe0d
inc_uxn_opcodes_h_l2716_c41_fe0d : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2716_c41_fe0d_phase,
inc_uxn_opcodes_h_l2716_c41_fe0d_ins,
inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read,
inc_uxn_opcodes_h_l2716_c41_fe0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7
opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond,
opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output);

-- inc2_uxn_opcodes_h_l2717_c41_d1cb
inc2_uxn_opcodes_h_l2717_c41_d1cb : entity work.inc2_0CLK_a6885b22 port map (
clk,
inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2717_c41_d1cb_phase,
inc2_uxn_opcodes_h_l2717_c41_d1cb_ins,
inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read,
inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19
opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond,
opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output);

-- pop_uxn_opcodes_h_l2718_c41_aaf3
pop_uxn_opcodes_h_l2718_c41_aaf3 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2718_c41_aaf3_phase,
pop_uxn_opcodes_h_l2718_c41_aaf3_ins,
pop_uxn_opcodes_h_l2718_c41_aaf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1
opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output);

-- pop2_uxn_opcodes_h_l2719_c41_a872
pop2_uxn_opcodes_h_l2719_c41_a872 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2719_c41_a872_phase,
pop2_uxn_opcodes_h_l2719_c41_a872_ins,
pop2_uxn_opcodes_h_l2719_c41_a872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44
opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output);

-- nip_uxn_opcodes_h_l2720_c41_491c
nip_uxn_opcodes_h_l2720_c41_491c : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2720_c41_491c_phase,
nip_uxn_opcodes_h_l2720_c41_491c_ins,
nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read,
nip_uxn_opcodes_h_l2720_c41_491c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_b932
opc_result_MUX_uxn_opcodes_h_l2721_c7_b932 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output);

-- nip2_uxn_opcodes_h_l2721_c41_48ba
nip2_uxn_opcodes_h_l2721_c41_48ba : entity work.nip2_0CLK_9a874500 port map (
clk,
nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2721_c41_48ba_phase,
nip2_uxn_opcodes_h_l2721_c41_48ba_ins,
nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read,
nip2_uxn_opcodes_h_l2721_c41_48ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_a601
opc_result_MUX_uxn_opcodes_h_l2722_c7_a601 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output);

-- swp_uxn_opcodes_h_l2722_c41_391a
swp_uxn_opcodes_h_l2722_c41_391a : entity work.swp_0CLK_faaf4b1a port map (
clk,
swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2722_c41_391a_phase,
swp_uxn_opcodes_h_l2722_c41_391a_ins,
swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read,
swp_uxn_opcodes_h_l2722_c41_391a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1
opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output);

-- swp2_uxn_opcodes_h_l2723_c41_934d
swp2_uxn_opcodes_h_l2723_c41_934d : entity work.swp2_0CLK_e768ce5a port map (
clk,
swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2723_c41_934d_phase,
swp2_uxn_opcodes_h_l2723_c41_934d_ins,
swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read,
swp2_uxn_opcodes_h_l2723_c41_934d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0
opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output);

-- rot_uxn_opcodes_h_l2724_c41_6e38
rot_uxn_opcodes_h_l2724_c41_6e38 : entity work.rot_0CLK_90cbec6a port map (
clk,
rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2724_c41_6e38_phase,
rot_uxn_opcodes_h_l2724_c41_6e38_ins,
rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read,
rot_uxn_opcodes_h_l2724_c41_6e38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_e732
opc_result_MUX_uxn_opcodes_h_l2725_c7_e732 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output);

-- rot2_uxn_opcodes_h_l2725_c41_2659
rot2_uxn_opcodes_h_l2725_c41_2659 : entity work.rot2_0CLK_6006c90f port map (
clk,
rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2725_c41_2659_phase,
rot2_uxn_opcodes_h_l2725_c41_2659_ins,
rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read,
rot2_uxn_opcodes_h_l2725_c41_2659_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49
opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output);

-- dup_uxn_opcodes_h_l2726_c41_c0af
dup_uxn_opcodes_h_l2726_c41_c0af : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2726_c41_c0af_phase,
dup_uxn_opcodes_h_l2726_c41_c0af_ins,
dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read,
dup_uxn_opcodes_h_l2726_c41_c0af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65
opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output);

-- dup2_uxn_opcodes_h_l2727_c41_4986
dup2_uxn_opcodes_h_l2727_c41_4986 : entity work.dup2_0CLK_49f2c137 port map (
clk,
dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2727_c41_4986_phase,
dup2_uxn_opcodes_h_l2727_c41_4986_ins,
dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read,
dup2_uxn_opcodes_h_l2727_c41_4986_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_e024
opc_result_MUX_uxn_opcodes_h_l2728_c7_e024 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output);

-- ovr_uxn_opcodes_h_l2728_c41_e2b1
ovr_uxn_opcodes_h_l2728_c41_e2b1 : entity work.ovr_0CLK_6d7675a8 port map (
clk,
ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2728_c41_e2b1_phase,
ovr_uxn_opcodes_h_l2728_c41_e2b1_ins,
ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read,
ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47
opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output);

-- ovr2_uxn_opcodes_h_l2729_c41_0aa9
ovr2_uxn_opcodes_h_l2729_c41_0aa9 : entity work.ovr2_0CLK_946b5f6a port map (
clk,
ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase,
ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins,
ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read,
ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_7606
opc_result_MUX_uxn_opcodes_h_l2730_c7_7606 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output);

-- equ_uxn_opcodes_h_l2730_c41_76b8
equ_uxn_opcodes_h_l2730_c41_76b8 : entity work.equ_0CLK_85d5529e port map (
clk,
equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2730_c41_76b8_phase,
equ_uxn_opcodes_h_l2730_c41_76b8_ins,
equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read,
equ_uxn_opcodes_h_l2730_c41_76b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6
opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output);

-- equ2_uxn_opcodes_h_l2731_c41_0992
equ2_uxn_opcodes_h_l2731_c41_0992 : entity work.equ2_0CLK_302e9520 port map (
clk,
equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2731_c41_0992_phase,
equ2_uxn_opcodes_h_l2731_c41_0992_ins,
equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read,
equ2_uxn_opcodes_h_l2731_c41_0992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69
opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output);

-- neq_uxn_opcodes_h_l2732_c41_a19f
neq_uxn_opcodes_h_l2732_c41_a19f : entity work.neq_0CLK_85d5529e port map (
clk,
neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2732_c41_a19f_phase,
neq_uxn_opcodes_h_l2732_c41_a19f_ins,
neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read,
neq_uxn_opcodes_h_l2732_c41_a19f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_3086
opc_result_MUX_uxn_opcodes_h_l2733_c7_3086 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output);

-- neq2_uxn_opcodes_h_l2733_c41_434c
neq2_uxn_opcodes_h_l2733_c41_434c : entity work.neq2_0CLK_302e9520 port map (
clk,
neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2733_c41_434c_phase,
neq2_uxn_opcodes_h_l2733_c41_434c_ins,
neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read,
neq2_uxn_opcodes_h_l2733_c41_434c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_439f
opc_result_MUX_uxn_opcodes_h_l2734_c7_439f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output);

-- gth_uxn_opcodes_h_l2734_c41_687d
gth_uxn_opcodes_h_l2734_c41_687d : entity work.gth_0CLK_85d5529e port map (
clk,
gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2734_c41_687d_phase,
gth_uxn_opcodes_h_l2734_c41_687d_ins,
gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read,
gth_uxn_opcodes_h_l2734_c41_687d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef
opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output);

-- gth2_uxn_opcodes_h_l2735_c41_8f3d
gth2_uxn_opcodes_h_l2735_c41_8f3d : entity work.gth2_0CLK_302e9520 port map (
clk,
gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2735_c41_8f3d_phase,
gth2_uxn_opcodes_h_l2735_c41_8f3d_ins,
gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read,
gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_7381
opc_result_MUX_uxn_opcodes_h_l2736_c7_7381 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output);

-- lth_uxn_opcodes_h_l2736_c41_7ca9
lth_uxn_opcodes_h_l2736_c41_7ca9 : entity work.lth_0CLK_85d5529e port map (
clk,
lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2736_c41_7ca9_phase,
lth_uxn_opcodes_h_l2736_c41_7ca9_ins,
lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read,
lth_uxn_opcodes_h_l2736_c41_7ca9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb
opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output);

-- lth2_uxn_opcodes_h_l2737_c41_23a9
lth2_uxn_opcodes_h_l2737_c41_23a9 : entity work.lth2_0CLK_302e9520 port map (
clk,
lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2737_c41_23a9_phase,
lth2_uxn_opcodes_h_l2737_c41_23a9_ins,
lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read,
lth2_uxn_opcodes_h_l2737_c41_23a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc
opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output);

-- jmp_uxn_opcodes_h_l2738_c41_efa4
jmp_uxn_opcodes_h_l2738_c41_efa4 : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2738_c41_efa4_phase,
jmp_uxn_opcodes_h_l2738_c41_efa4_ins,
jmp_uxn_opcodes_h_l2738_c41_efa4_pc,
jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read,
jmp_uxn_opcodes_h_l2738_c41_efa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_650b
opc_result_MUX_uxn_opcodes_h_l2739_c7_650b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output);

-- jmp2_uxn_opcodes_h_l2739_c41_208f
jmp2_uxn_opcodes_h_l2739_c41_208f : entity work.jmp2_0CLK_0b1ee796 port map (
clk,
jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2739_c41_208f_phase,
jmp2_uxn_opcodes_h_l2739_c41_208f_ins,
jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read,
jmp2_uxn_opcodes_h_l2739_c41_208f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9
opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output);

-- jcn_uxn_opcodes_h_l2740_c41_c99b
jcn_uxn_opcodes_h_l2740_c41_c99b : entity work.jcn_0CLK_85d5529e port map (
clk,
jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2740_c41_c99b_phase,
jcn_uxn_opcodes_h_l2740_c41_c99b_ins,
jcn_uxn_opcodes_h_l2740_c41_c99b_pc,
jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read,
jcn_uxn_opcodes_h_l2740_c41_c99b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_3662
opc_result_MUX_uxn_opcodes_h_l2741_c7_3662 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output);

-- jcn2_uxn_opcodes_h_l2741_c41_f823
jcn2_uxn_opcodes_h_l2741_c41_f823 : entity work.jcn2_0CLK_0226dad5 port map (
clk,
jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2741_c41_f823_phase,
jcn2_uxn_opcodes_h_l2741_c41_f823_ins,
jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read,
jcn2_uxn_opcodes_h_l2741_c41_f823_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d
opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output);

-- jsr_uxn_opcodes_h_l2742_c41_7762
jsr_uxn_opcodes_h_l2742_c41_7762 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2742_c41_7762_phase,
jsr_uxn_opcodes_h_l2742_c41_7762_ins,
jsr_uxn_opcodes_h_l2742_c41_7762_pc,
jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read,
jsr_uxn_opcodes_h_l2742_c41_7762_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e
opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output);

-- jsr2_uxn_opcodes_h_l2743_c41_331d
jsr2_uxn_opcodes_h_l2743_c41_331d : entity work.jsr2_0CLK_9728fdff port map (
clk,
jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2743_c41_331d_phase,
jsr2_uxn_opcodes_h_l2743_c41_331d_ins,
jsr2_uxn_opcodes_h_l2743_c41_331d_pc,
jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read,
jsr2_uxn_opcodes_h_l2743_c41_331d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c
opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output);

-- sth_uxn_opcodes_h_l2744_c41_ad10
sth_uxn_opcodes_h_l2744_c41_ad10 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2744_c41_ad10_phase,
sth_uxn_opcodes_h_l2744_c41_ad10_ins,
sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read,
sth_uxn_opcodes_h_l2744_c41_ad10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf
opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond,
opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output);

-- sth2_uxn_opcodes_h_l2745_c41_c165
sth2_uxn_opcodes_h_l2745_c41_c165 : entity work.sth2_0CLK_302e9520 port map (
clk,
sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2745_c41_c165_phase,
sth2_uxn_opcodes_h_l2745_c41_c165_ins,
sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read,
sth2_uxn_opcodes_h_l2745_c41_c165_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2746_c7_668d
opc_result_MUX_uxn_opcodes_h_l2746_c7_668d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond,
opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output);

-- ldz_uxn_opcodes_h_l2746_c41_2bc9
ldz_uxn_opcodes_h_l2746_c41_2bc9 : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2746_c41_2bc9_phase,
ldz_uxn_opcodes_h_l2746_c41_2bc9_ins,
ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read,
ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read,
ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2747_c7_e513
opc_result_MUX_uxn_opcodes_h_l2747_c7_e513 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond,
opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue,
opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse,
opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output);

-- ldz2_uxn_opcodes_h_l2747_c41_8b6a
ldz2_uxn_opcodes_h_l2747_c41_8b6a : entity work.ldz2_0CLK_d662d237 port map (
clk,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read,
ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef
opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond,
opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output);

-- stz_uxn_opcodes_h_l2748_c41_56da
stz_uxn_opcodes_h_l2748_c41_56da : entity work.stz_0CLK_ffdfe23b port map (
clk,
stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2748_c41_56da_phase,
stz_uxn_opcodes_h_l2748_c41_56da_ins,
stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read,
stz_uxn_opcodes_h_l2748_c41_56da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba
opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond,
opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output);

-- stz2_uxn_opcodes_h_l2749_c41_0bea
stz2_uxn_opcodes_h_l2749_c41_0bea : entity work.stz2_0CLK_4f993427 port map (
clk,
stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2749_c41_0bea_phase,
stz2_uxn_opcodes_h_l2749_c41_0bea_ins,
stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read,
stz2_uxn_opcodes_h_l2749_c41_0bea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b
opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond,
opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output);

-- ldr_uxn_opcodes_h_l2750_c41_dc44
ldr_uxn_opcodes_h_l2750_c41_dc44 : entity work.ldr_0CLK_c61094da port map (
clk,
ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2750_c41_dc44_phase,
ldr_uxn_opcodes_h_l2750_c41_dc44_ins,
ldr_uxn_opcodes_h_l2750_c41_dc44_pc,
ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read,
ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read,
ldr_uxn_opcodes_h_l2750_c41_dc44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0
opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond,
opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output);

-- ldr2_uxn_opcodes_h_l2751_c41_39fa
ldr2_uxn_opcodes_h_l2751_c41_39fa : entity work.ldr2_0CLK_6193b0ef port map (
clk,
ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2751_c41_39fa_phase,
ldr2_uxn_opcodes_h_l2751_c41_39fa_ins,
ldr2_uxn_opcodes_h_l2751_c41_39fa_pc,
ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read,
ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read,
ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e
opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond,
opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output);

-- str1_uxn_opcodes_h_l2752_c41_dfd3
str1_uxn_opcodes_h_l2752_c41_dfd3 : entity work.str1_0CLK_faaf4b1a port map (
clk,
str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2752_c41_dfd3_phase,
str1_uxn_opcodes_h_l2752_c41_dfd3_ins,
str1_uxn_opcodes_h_l2752_c41_dfd3_pc,
str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read,
str1_uxn_opcodes_h_l2752_c41_dfd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2753_c7_891a
opc_result_MUX_uxn_opcodes_h_l2753_c7_891a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond,
opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output);

-- str2_uxn_opcodes_h_l2753_c41_d977
str2_uxn_opcodes_h_l2753_c41_d977 : entity work.str2_0CLK_4f993427 port map (
clk,
str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2753_c41_d977_phase,
str2_uxn_opcodes_h_l2753_c41_d977_ins,
str2_uxn_opcodes_h_l2753_c41_d977_pc,
str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read,
str2_uxn_opcodes_h_l2753_c41_d977_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d
opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output);

-- lda_uxn_opcodes_h_l2754_c41_acf5
lda_uxn_opcodes_h_l2754_c41_acf5 : entity work.lda_0CLK_dc46ab2b port map (
clk,
lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2754_c41_acf5_phase,
lda_uxn_opcodes_h_l2754_c41_acf5_ins,
lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read,
lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read,
lda_uxn_opcodes_h_l2754_c41_acf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2755_c7_eade
opc_result_MUX_uxn_opcodes_h_l2755_c7_eade : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond,
opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue,
opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse,
opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output);

-- lda2_uxn_opcodes_h_l2755_c41_9017
lda2_uxn_opcodes_h_l2755_c41_9017 : entity work.lda2_0CLK_0d6e2712 port map (
clk,
lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2755_c41_9017_phase,
lda2_uxn_opcodes_h_l2755_c41_9017_ins,
lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read,
lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read,
lda2_uxn_opcodes_h_l2755_c41_9017_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4
opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond,
opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output);

-- sta_uxn_opcodes_h_l2756_c41_84c3
sta_uxn_opcodes_h_l2756_c41_84c3 : entity work.sta_0CLK_d2dce55b port map (
clk,
sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2756_c41_84c3_phase,
sta_uxn_opcodes_h_l2756_c41_84c3_ins,
sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read,
sta_uxn_opcodes_h_l2756_c41_84c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4
opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output);

-- sta2_uxn_opcodes_h_l2757_c41_da54
sta2_uxn_opcodes_h_l2757_c41_da54 : entity work.sta2_0CLK_7d7b1f8b port map (
clk,
sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2757_c41_da54_phase,
sta2_uxn_opcodes_h_l2757_c41_da54_ins,
sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read,
sta2_uxn_opcodes_h_l2757_c41_da54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8
opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond,
opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output);

-- dei_uxn_opcodes_h_l2758_c41_9a15
dei_uxn_opcodes_h_l2758_c41_9a15 : entity work.dei_0CLK_1826c28e port map (
clk,
dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2758_c41_9a15_phase,
dei_uxn_opcodes_h_l2758_c41_9a15_ins,
dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read,
dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read,
dei_uxn_opcodes_h_l2758_c41_9a15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49
opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output);

-- dei2_uxn_opcodes_h_l2759_c41_68eb
dei2_uxn_opcodes_h_l2759_c41_68eb : entity work.dei2_0CLK_82b906b0 port map (
clk,
dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2759_c41_68eb_phase,
dei2_uxn_opcodes_h_l2759_c41_68eb_ins,
dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read,
dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read,
dei2_uxn_opcodes_h_l2759_c41_68eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0
opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond,
opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output);

-- deo_uxn_opcodes_h_l2760_c41_fddb
deo_uxn_opcodes_h_l2760_c41_fddb : entity work.deo_0CLK_0f1297eb port map (
clk,
deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2760_c41_fddb_phase,
deo_uxn_opcodes_h_l2760_c41_fddb_ins,
deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read,
deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read,
deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read,
deo_uxn_opcodes_h_l2760_c41_fddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd
opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond,
opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output);

-- deo2_uxn_opcodes_h_l2761_c41_716b
deo2_uxn_opcodes_h_l2761_c41_716b : entity work.deo2_0CLK_0f83c89f port map (
clk,
deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2761_c41_716b_phase,
deo2_uxn_opcodes_h_l2761_c41_716b_ins,
deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read,
deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read,
deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read,
deo2_uxn_opcodes_h_l2761_c41_716b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2762_c7_449e
opc_result_MUX_uxn_opcodes_h_l2762_c7_449e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond,
opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output);

-- add_uxn_opcodes_h_l2762_c41_a806
add_uxn_opcodes_h_l2762_c41_a806 : entity work.add_0CLK_bacf6a1d port map (
clk,
add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE,
add_uxn_opcodes_h_l2762_c41_a806_phase,
add_uxn_opcodes_h_l2762_c41_a806_ins,
add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read,
add_uxn_opcodes_h_l2762_c41_a806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a
opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output);

-- add2_uxn_opcodes_h_l2763_c41_aa94
add2_uxn_opcodes_h_l2763_c41_aa94 : entity work.add2_0CLK_f74041be port map (
clk,
add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2763_c41_aa94_phase,
add2_uxn_opcodes_h_l2763_c41_aa94_ins,
add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read,
add2_uxn_opcodes_h_l2763_c41_aa94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2764_c7_8897
opc_result_MUX_uxn_opcodes_h_l2764_c7_8897 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond,
opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue,
opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse,
opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output);

-- sub_uxn_opcodes_h_l2764_c41_9e31
sub_uxn_opcodes_h_l2764_c41_9e31 : entity work.sub_0CLK_bacf6a1d port map (
clk,
sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2764_c41_9e31_phase,
sub_uxn_opcodes_h_l2764_c41_9e31_ins,
sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read,
sub_uxn_opcodes_h_l2764_c41_9e31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff
opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond,
opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output);

-- sub2_uxn_opcodes_h_l2765_c41_ce76
sub2_uxn_opcodes_h_l2765_c41_ce76 : entity work.sub2_0CLK_f74041be port map (
clk,
sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2765_c41_ce76_phase,
sub2_uxn_opcodes_h_l2765_c41_ce76_ins,
sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read,
sub2_uxn_opcodes_h_l2765_c41_ce76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02
opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond,
opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output);

-- mul_uxn_opcodes_h_l2766_c41_fb6e
mul_uxn_opcodes_h_l2766_c41_fb6e : entity work.mul_0CLK_bacf6a1d port map (
clk,
mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2766_c41_fb6e_phase,
mul_uxn_opcodes_h_l2766_c41_fb6e_ins,
mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read,
mul_uxn_opcodes_h_l2766_c41_fb6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a
opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond,
opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output);

-- mul2_uxn_opcodes_h_l2767_c41_0a10
mul2_uxn_opcodes_h_l2767_c41_0a10 : entity work.mul2_0CLK_f74041be port map (
clk,
mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2767_c41_0a10_phase,
mul2_uxn_opcodes_h_l2767_c41_0a10_ins,
mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read,
mul2_uxn_opcodes_h_l2767_c41_0a10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7
opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond,
opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output);

-- div_uxn_opcodes_h_l2768_c41_782d
div_uxn_opcodes_h_l2768_c41_782d : entity work.div_0CLK_a35230ee port map (
clk,
div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE,
div_uxn_opcodes_h_l2768_c41_782d_phase,
div_uxn_opcodes_h_l2768_c41_782d_ins,
div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read,
div_uxn_opcodes_h_l2768_c41_782d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49
opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond,
opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output);

-- div2_uxn_opcodes_h_l2769_c41_d310
div2_uxn_opcodes_h_l2769_c41_d310 : entity work.div2_0CLK_6d03de33 port map (
clk,
div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2769_c41_d310_phase,
div2_uxn_opcodes_h_l2769_c41_d310_ins,
div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read,
div2_uxn_opcodes_h_l2769_c41_d310_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec
opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond,
opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output);

-- and_uxn_opcodes_h_l2770_c41_e3cf
and_uxn_opcodes_h_l2770_c41_e3cf : entity work.and_0CLK_bacf6a1d port map (
clk,
and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE,
and_uxn_opcodes_h_l2770_c41_e3cf_phase,
and_uxn_opcodes_h_l2770_c41_e3cf_ins,
and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read,
and_uxn_opcodes_h_l2770_c41_e3cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e
opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond,
opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output);

-- and2_uxn_opcodes_h_l2771_c41_dfe1
and2_uxn_opcodes_h_l2771_c41_dfe1 : entity work.and2_0CLK_f74041be port map (
clk,
and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2771_c41_dfe1_phase,
and2_uxn_opcodes_h_l2771_c41_dfe1_ins,
and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read,
and2_uxn_opcodes_h_l2771_c41_dfe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2772_c7_fead
opc_result_MUX_uxn_opcodes_h_l2772_c7_fead : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output);

-- ora_uxn_opcodes_h_l2772_c41_9d8d
ora_uxn_opcodes_h_l2772_c41_9d8d : entity work.ora_0CLK_bacf6a1d port map (
clk,
ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2772_c41_9d8d_phase,
ora_uxn_opcodes_h_l2772_c41_9d8d_ins,
ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read,
ora_uxn_opcodes_h_l2772_c41_9d8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e
opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond,
opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output);

-- ora2_uxn_opcodes_h_l2773_c41_b350
ora2_uxn_opcodes_h_l2773_c41_b350 : entity work.ora2_0CLK_f74041be port map (
clk,
ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2773_c41_b350_phase,
ora2_uxn_opcodes_h_l2773_c41_b350_ins,
ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read,
ora2_uxn_opcodes_h_l2773_c41_b350_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2774_c7_1485
opc_result_MUX_uxn_opcodes_h_l2774_c7_1485 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond,
opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue,
opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse,
opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output);

-- eor_uxn_opcodes_h_l2774_c41_4189
eor_uxn_opcodes_h_l2774_c41_4189 : entity work.eor_0CLK_bacf6a1d port map (
clk,
eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2774_c41_4189_phase,
eor_uxn_opcodes_h_l2774_c41_4189_ins,
eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read,
eor_uxn_opcodes_h_l2774_c41_4189_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0
opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond,
opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output);

-- eor2_uxn_opcodes_h_l2775_c41_6ee3
eor2_uxn_opcodes_h_l2775_c41_6ee3 : entity work.eor2_0CLK_f74041be port map (
clk,
eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2775_c41_6ee3_phase,
eor2_uxn_opcodes_h_l2775_c41_6ee3_ins,
eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read,
eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2776_c7_612f
opc_result_MUX_uxn_opcodes_h_l2776_c7_612f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond,
opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output);

-- sft_uxn_opcodes_h_l2776_c41_6482
sft_uxn_opcodes_h_l2776_c41_6482 : entity work.sft_0CLK_10aab3e1 port map (
clk,
sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2776_c41_6482_phase,
sft_uxn_opcodes_h_l2776_c41_6482_ins,
sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read,
sft_uxn_opcodes_h_l2776_c41_6482_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76
opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond,
opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue,
opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse,
opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output);

-- sft2_uxn_opcodes_h_l2777_c41_6665
sft2_uxn_opcodes_h_l2777_c41_6665 : entity work.sft2_0CLK_77062510 port map (
clk,
sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2777_c41_6665_phase,
sft2_uxn_opcodes_h_l2777_c41_6665_ins,
sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read,
sft2_uxn_opcodes_h_l2777_c41_6665_return_output);

-- printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b
printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b : entity work.printf_uxn_opcodes_h_l2778_c9_961b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa
BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left,
BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right,
BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82
BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left,
BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right,
BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output);

-- MUX_uxn_opcodes_h_l2780_c18_9c4c
MUX_uxn_opcodes_h_l2780_c18_9c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2780_c18_9c4c_cond,
MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue,
MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse,
MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left,
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right,
BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output);

-- sp1_MUX_uxn_opcodes_h_l2783_c2_93b8
sp1_MUX_uxn_opcodes_h_l2783_c2_93b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond,
sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue,
sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse,
sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output);

-- sp0_MUX_uxn_opcodes_h_l2783_c2_93b8
sp0_MUX_uxn_opcodes_h_l2783_c2_93b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond,
sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue,
sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse,
sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output);

-- sp1_MUX_uxn_opcodes_h_l2784_c3_acd8
sp1_MUX_uxn_opcodes_h_l2784_c3_acd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond,
sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue,
sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse,
sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output);

-- sp0_MUX_uxn_opcodes_h_l2784_c3_acd8
sp0_MUX_uxn_opcodes_h_l2784_c3_acd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond,
sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue,
sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse,
sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left,
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right,
BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left,
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right,
BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output);

-- MUX_uxn_opcodes_h_l2791_c30_caa5
MUX_uxn_opcodes_h_l2791_c30_caa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2791_c30_caa5_cond,
MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue,
MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse,
MUX_uxn_opcodes_h_l2791_c30_caa5_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left,
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right,
BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output);

-- MUX_uxn_opcodes_h_l2792_c20_556d
MUX_uxn_opcodes_h_l2792_c20_556d : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2792_c20_556d_cond,
MUX_uxn_opcodes_h_l2792_c20_556d_iftrue,
MUX_uxn_opcodes_h_l2792_c20_556d_iffalse,
MUX_uxn_opcodes_h_l2792_c20_556d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left,
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right,
BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output);

-- stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address,
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value,
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable,
stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output,
 CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output,
 MUX_uxn_opcodes_h_l2704_c10_27dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output,
 is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output,
 jci_uxn_opcodes_h_l2709_c41_0665_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output,
 jmi_uxn_opcodes_h_l2710_c41_1f91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output,
 opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output,
 jsi_uxn_opcodes_h_l2711_c41_aaef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output,
 opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output,
 lit_uxn_opcodes_h_l2712_c41_a531_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output,
 opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output,
 lit2_uxn_opcodes_h_l2713_c41_6ced_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output,
 lit_uxn_opcodes_h_l2714_c41_c04c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output,
 opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output,
 lit2_uxn_opcodes_h_l2715_c41_9153_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output,
 inc_uxn_opcodes_h_l2716_c41_fe0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output,
 inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output,
 pop_uxn_opcodes_h_l2718_c41_aaf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output,
 pop2_uxn_opcodes_h_l2719_c41_a872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output,
 nip_uxn_opcodes_h_l2720_c41_491c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output,
 nip2_uxn_opcodes_h_l2721_c41_48ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output,
 swp_uxn_opcodes_h_l2722_c41_391a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output,
 swp2_uxn_opcodes_h_l2723_c41_934d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output,
 rot_uxn_opcodes_h_l2724_c41_6e38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output,
 rot2_uxn_opcodes_h_l2725_c41_2659_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output,
 dup_uxn_opcodes_h_l2726_c41_c0af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output,
 dup2_uxn_opcodes_h_l2727_c41_4986_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output,
 ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output,
 ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output,
 equ_uxn_opcodes_h_l2730_c41_76b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output,
 equ2_uxn_opcodes_h_l2731_c41_0992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output,
 neq_uxn_opcodes_h_l2732_c41_a19f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output,
 neq2_uxn_opcodes_h_l2733_c41_434c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output,
 gth_uxn_opcodes_h_l2734_c41_687d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output,
 gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output,
 lth_uxn_opcodes_h_l2736_c41_7ca9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output,
 lth2_uxn_opcodes_h_l2737_c41_23a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output,
 jmp_uxn_opcodes_h_l2738_c41_efa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output,
 jmp2_uxn_opcodes_h_l2739_c41_208f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output,
 jcn_uxn_opcodes_h_l2740_c41_c99b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output,
 jcn2_uxn_opcodes_h_l2741_c41_f823_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output,
 jsr_uxn_opcodes_h_l2742_c41_7762_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output,
 jsr2_uxn_opcodes_h_l2743_c41_331d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output,
 sth_uxn_opcodes_h_l2744_c41_ad10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output,
 sth2_uxn_opcodes_h_l2745_c41_c165_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output,
 opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output,
 ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output,
 ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output,
 stz_uxn_opcodes_h_l2748_c41_56da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output,
 stz2_uxn_opcodes_h_l2749_c41_0bea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output,
 ldr_uxn_opcodes_h_l2750_c41_dc44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output,
 ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output,
 str1_uxn_opcodes_h_l2752_c41_dfd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output,
 str2_uxn_opcodes_h_l2753_c41_d977_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output,
 opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output,
 lda_uxn_opcodes_h_l2754_c41_acf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output,
 lda2_uxn_opcodes_h_l2755_c41_9017_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output,
 sta_uxn_opcodes_h_l2756_c41_84c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output,
 sta2_uxn_opcodes_h_l2757_c41_da54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output,
 dei_uxn_opcodes_h_l2758_c41_9a15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output,
 dei2_uxn_opcodes_h_l2759_c41_68eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output,
 deo_uxn_opcodes_h_l2760_c41_fddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output,
 deo2_uxn_opcodes_h_l2761_c41_716b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output,
 add_uxn_opcodes_h_l2762_c41_a806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output,
 opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output,
 add2_uxn_opcodes_h_l2763_c41_aa94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output,
 sub_uxn_opcodes_h_l2764_c41_9e31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output,
 sub2_uxn_opcodes_h_l2765_c41_ce76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output,
 mul_uxn_opcodes_h_l2766_c41_fb6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output,
 mul2_uxn_opcodes_h_l2767_c41_0a10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output,
 div_uxn_opcodes_h_l2768_c41_782d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output,
 div2_uxn_opcodes_h_l2769_c41_d310_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output,
 and_uxn_opcodes_h_l2770_c41_e3cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output,
 opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output,
 and2_uxn_opcodes_h_l2771_c41_dfe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output,
 ora_uxn_opcodes_h_l2772_c41_9d8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output,
 opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output,
 ora2_uxn_opcodes_h_l2773_c41_b350_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output,
 eor_uxn_opcodes_h_l2774_c41_4189_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output,
 eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output,
 opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output,
 sft_uxn_opcodes_h_l2776_c41_6482_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output,
 opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output,
 sft2_uxn_opcodes_h_l2777_c41_6665_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output,
 MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output,
 sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output,
 sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output,
 sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output,
 sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output,
 MUX_uxn_opcodes_h_l2791_c30_caa5_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output,
 MUX_uxn_opcodes_h_l2792_c20_556d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output,
 stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2704_c2_ff96 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_c1da_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_c66d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_b1d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2709_c41_0665_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_a531_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_a531_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2712_c41_a531_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_c04c_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_c04c_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2714_c41_c04c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_9153_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_9153_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2715_c41_9153_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_a872_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_a872_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2719_c41_a872_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_491c_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_491c_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2720_c41_491c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_391a_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_391a_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2722_c41_391a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_934d_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_934d_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2723_c41_934d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_6e38_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_6e38_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2724_c41_6e38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_2659_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_2659_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2725_c41_2659_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_c0af_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_c0af_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2726_c41_c0af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_4986_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_4986_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2727_c41_4986_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_76b8_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_76b8_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2730_c41_76b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_0992_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_0992_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2731_c41_0992_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_a19f_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_a19f_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2732_c41_a19f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_434c_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_434c_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2733_c41_434c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_687d_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_687d_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2734_c41_687d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2742_c41_7762_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_ad10_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_ad10_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2744_c41_ad10_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_c165_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_c165_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2745_c41_c165_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_56da_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_56da_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2748_c41_56da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2753_c41_d977_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2754_c41_acf5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2755_c41_9017_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_84c3_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_84c3_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2756_c41_84c3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_da54_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_da54_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2757_c41_da54_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2758_c41_9a15_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2760_c41_fddb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2761_c41_716b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_a806_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_a806_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2762_c41_a806_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_aa94_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_aa94_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2763_c41_aa94_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_9e31_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_9e31_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2764_c41_9e31_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_782d_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_782d_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2768_c41_782d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_d310_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_d310_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2769_c41_d310_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_e3cf_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_e3cf_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2770_c41_e3cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_b350_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_b350_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2773_c41_b350_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_4189_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_4189_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2774_c41_4189_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_6482_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_6482_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2776_c41_6482_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_6665_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_6665_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2777_c41_6665_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_7664_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_ba10_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2785_c4_36d9 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2787_c4_42cb : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_677c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_e500_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_a8c2_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2792_c2_6a70 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_556d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2792_c20_556d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_fa11_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_8976_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_43b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_0afc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_ccfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_52fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_5603_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_4f6e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_2ce1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_d70b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_c91b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_54db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_b9cd_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right := to_unsigned(49, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right := to_unsigned(3584, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right := to_unsigned(512, 10);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right := to_unsigned(51, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right := to_unsigned(23, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right := to_unsigned(2560, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right := to_unsigned(63, 6);
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right := to_unsigned(21, 5);
     VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right := to_unsigned(19, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right := to_unsigned(38, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right := to_unsigned(60, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2763_c41_aa94_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2762_c41_a806_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2770_c41_e3cf_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2769_c41_d310_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2768_c41_782d_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2727_c41_4986_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2726_c41_c0af_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2774_c41_4189_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2731_c41_0992_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2730_c41_76b8_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2734_c41_687d_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2733_c41_434c_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2732_c41_a19f_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2720_c41_491c_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2773_c41_b350_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2719_c41_a872_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2725_c41_2659_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2724_c41_6e38_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2777_c41_6665_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2776_c41_6482_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2757_c41_da54_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2756_c41_84c3_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2745_c41_c165_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2744_c41_ad10_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2748_c41_56da_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2764_c41_9e31_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2723_c41_934d_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2722_c41_391a_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2715_c41_9153_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2712_c41_a531_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2714_c41_c04c_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2763_c41_aa94_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2762_c41_a806_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2770_c41_e3cf_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2769_c41_d310_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2768_c41_782d_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2727_c41_4986_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2726_c41_c0af_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2774_c41_4189_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2731_c41_0992_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2730_c41_76b8_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2734_c41_687d_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2715_c41_9153_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2712_c41_a531_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2714_c41_c04c_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2733_c41_434c_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2732_c41_a19f_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2720_c41_491c_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2773_c41_b350_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2719_c41_a872_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2725_c41_2659_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2724_c41_6e38_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2777_c41_6665_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2776_c41_6482_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2757_c41_da54_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2756_c41_84c3_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2745_c41_c165_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2744_c41_ad10_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2748_c41_56da_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2764_c41_9e31_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2723_c41_934d_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2722_c41_391a_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2708_c2_b1d5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_b1d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2704_c10_e916] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_left;
     BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output := BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2780_c18_7faa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_left;
     BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output := BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2704_c41_58f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_left;
     BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output := BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2704_c57_c66d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_c66d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c10_e916_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2780_c18_7faa_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c57_c66d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2708_c2_b1d5_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2780_c18_3a82] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_left;
     BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output := BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2704_c30_c1da] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_c1da_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2704_c41_58f1_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l2704_c57_304c] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output := CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2704_c10_90ca] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_left;
     BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output := BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2704_c10_90ca_return_output;
     VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2780_c18_3a82_return_output;
     VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2704_c30_c1da_return_output;
     VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2704_c57_304c_return_output;
     -- MUX[uxn_opcodes_h_l2704_c10_27dc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2704_c10_27dc_cond <= VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_cond;
     MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue <= VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iftrue;
     MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse <= VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_return_output := MUX_uxn_opcodes_h_l2704_c10_27dc_return_output;

     -- MUX[uxn_opcodes_h_l2780_c18_9c4c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2780_c18_9c4c_cond <= VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_cond;
     MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue <= VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iftrue;
     MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse <= VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output := MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2704_c2_ff96 := VAR_MUX_uxn_opcodes_h_l2704_c10_27dc_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left := VAR_MUX_uxn_opcodes_h_l2780_c18_9c4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2704_c2_ff96;
     VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1 := resize(VAR_opc_uxn_opcodes_h_l2704_c2_ff96, 32);
     VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0 := resize(VAR_opc_uxn_opcodes_h_l2704_c2_ff96, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_7bea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_3f4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_a512] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_0f70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output;

     -- printf_uxn_opcodes_h_l2706_c2_8670[uxn_opcodes_h_l2706_c2_8670] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0 <= VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg0;
     printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1 <= VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg1;
     printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2 <= VAR_printf_uxn_opcodes_h_l2706_c2_8670_uxn_opcodes_h_l2706_c2_8670_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_ab3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_4f39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_211f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_513e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_136f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_3253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_b87f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_1502] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_left;
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output := BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_7b0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_6e34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_left;
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output := BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_bb6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_99c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_69c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_154c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_5cbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_f602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_8943] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_04bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_40de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_46ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_441b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_6ebd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_4324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_ed7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_d795] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_9dcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_bb64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_08af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_feda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_b045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_3d58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_2de5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_b12a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_cebc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_5e47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_d3dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_4078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_cd65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_1276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_1fe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_5451] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_fc11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_left;
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output := BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_7330] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_4c2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_ce49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_b797] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_b3b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_46b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_e66c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_d248] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_9dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_fc46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_left;
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output := BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_d4ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_ee03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_4e49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_789d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_aa54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_068a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_47de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_d85f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_a2b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_de6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_d736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_left;
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output := BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_d74f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_3466] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_1640] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_441b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_cebc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_ed7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_d736_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_1fe7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_ee03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_4f39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_9dd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_f602_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_7b0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_aa54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_cd65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_40de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_136f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_d248_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_d85f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5cbc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_69c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_b045_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_a512_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_5451_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_4e49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_7bea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_b3b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_ce49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_de6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_4324_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_3f4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_789d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_211f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_08af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_feda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_d4ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_1640_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7330_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_5e47_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_fc46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_068a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_3253_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_3466_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_04bc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_bb64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_99c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_b797_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_2de5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_4078_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_4c2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_1276_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_e66c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_3d58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_b87f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_154c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_b12a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_d3dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_bb6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_a2b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_513e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_9dcd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_47de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_46ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_6ebd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_8943_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_46b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_d74f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_1502_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_ab3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_fc11_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_6e34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_0f70_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_d795_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2708_c2_b1d5] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond;
     is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output := is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_bc23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_7b5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output;
     VAR_printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_bc23_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_580c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_0aab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output;

     -- printf_uxn_opcodes_h_l2708_c23_dca8[uxn_opcodes_h_l2708_c23_dca8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2708_c23_dca8_uxn_opcodes_h_l2708_c23_dca8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_580c_return_output;
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_0aab_return_output;
     -- jci[uxn_opcodes_h_l2709_c41_0665] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2709_c41_0665_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2709_c41_0665_phase <= VAR_jci_uxn_opcodes_h_l2709_c41_0665_phase;
     jci_uxn_opcodes_h_l2709_c41_0665_pc <= VAR_jci_uxn_opcodes_h_l2709_c41_0665_pc;
     jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_stack_read;
     jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2709_c41_0665_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2709_c41_0665_return_output := jci_uxn_opcodes_h_l2709_c41_0665_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_fd64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_c13d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output;
     VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_fd64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue := VAR_jci_uxn_opcodes_h_l2709_c41_0665_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_f381] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_036e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output;

     -- jmi[uxn_opcodes_h_l2710_c41_1f91] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2710_c41_1f91_phase <= VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_phase;
     jmi_uxn_opcodes_h_l2710_c41_1f91_pc <= VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_pc;
     jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_return_output := jmi_uxn_opcodes_h_l2710_c41_1f91_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_f381_return_output;
     VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_036e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue := VAR_jmi_uxn_opcodes_h_l2710_c41_1f91_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_cdd0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output;

     -- jsi[uxn_opcodes_h_l2711_c41_aaef] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2711_c41_aaef_phase <= VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_phase;
     jsi_uxn_opcodes_h_l2711_c41_aaef_pc <= VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_pc;
     jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_return_output := jsi_uxn_opcodes_h_l2711_c41_aaef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_6150] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_6150_return_output;
     VAR_lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_cdd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue := VAR_jsi_uxn_opcodes_h_l2711_c41_aaef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_e0ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output;

     -- lit[uxn_opcodes_h_l2712_c41_a531] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2712_c41_a531_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2712_c41_a531_phase <= VAR_lit_uxn_opcodes_h_l2712_c41_a531_phase;
     lit_uxn_opcodes_h_l2712_c41_a531_pc <= VAR_lit_uxn_opcodes_h_l2712_c41_a531_pc;
     lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2712_c41_a531_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2712_c41_a531_return_output := lit_uxn_opcodes_h_l2712_c41_a531_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_2502] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_2502_return_output;
     VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_e0ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue := VAR_lit_uxn_opcodes_h_l2712_c41_a531_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_dab8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_abd3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output;

     -- lit2[uxn_opcodes_h_l2713_c41_6ced] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2713_c41_6ced_phase <= VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_phase;
     lit2_uxn_opcodes_h_l2713_c41_6ced_pc <= VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_pc;
     lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_return_output := lit2_uxn_opcodes_h_l2713_c41_6ced_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output;
     VAR_lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_dab8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue := VAR_lit2_uxn_opcodes_h_l2713_c41_6ced_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_6c43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_4a95] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output;

     -- lit[uxn_opcodes_h_l2714_c41_c04c] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2714_c41_c04c_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2714_c41_c04c_phase <= VAR_lit_uxn_opcodes_h_l2714_c41_c04c_phase;
     lit_uxn_opcodes_h_l2714_c41_c04c_pc <= VAR_lit_uxn_opcodes_h_l2714_c41_c04c_pc;
     lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2714_c41_c04c_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2714_c41_c04c_return_output := lit_uxn_opcodes_h_l2714_c41_c04c_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output;
     VAR_lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_6c43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue := VAR_lit_uxn_opcodes_h_l2714_c41_c04c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_36bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output;

     -- lit2[uxn_opcodes_h_l2715_c41_9153] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2715_c41_9153_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2715_c41_9153_phase <= VAR_lit2_uxn_opcodes_h_l2715_c41_9153_phase;
     lit2_uxn_opcodes_h_l2715_c41_9153_pc <= VAR_lit2_uxn_opcodes_h_l2715_c41_9153_pc;
     lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2715_c41_9153_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2715_c41_9153_return_output := lit2_uxn_opcodes_h_l2715_c41_9153_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_ccd7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output;
     VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_36bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue := VAR_lit2_uxn_opcodes_h_l2715_c41_9153_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_47b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output;

     -- inc[uxn_opcodes_h_l2716_c41_fe0d] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2716_c41_fe0d_phase <= VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_phase;
     inc_uxn_opcodes_h_l2716_c41_fe0d_ins <= VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_ins;
     inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_return_output := inc_uxn_opcodes_h_l2716_c41_fe0d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_3d19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output;
     VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_47b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue := VAR_inc_uxn_opcodes_h_l2716_c41_fe0d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_c865] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output;

     -- inc2[uxn_opcodes_h_l2717_c41_d1cb] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2717_c41_d1cb_phase <= VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_phase;
     inc2_uxn_opcodes_h_l2717_c41_d1cb_ins <= VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_ins;
     inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output := inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_46d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output;
     VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_c865_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue := VAR_inc2_uxn_opcodes_h_l2717_c41_d1cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_3c44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_cc75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output;

     -- pop[uxn_opcodes_h_l2718_c41_aaf3] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2718_c41_aaf3_phase <= VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_phase;
     pop_uxn_opcodes_h_l2718_c41_aaf3_ins <= VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_return_output := pop_uxn_opcodes_h_l2718_c41_aaf3_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output;
     VAR_pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_cc75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue := VAR_pop_uxn_opcodes_h_l2718_c41_aaf3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_b932] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output;

     -- pop2[uxn_opcodes_h_l2719_c41_a872] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2719_c41_a872_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2719_c41_a872_phase <= VAR_pop2_uxn_opcodes_h_l2719_c41_a872_phase;
     pop2_uxn_opcodes_h_l2719_c41_a872_ins <= VAR_pop2_uxn_opcodes_h_l2719_c41_a872_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2719_c41_a872_return_output := pop2_uxn_opcodes_h_l2719_c41_a872_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_080c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_b932_return_output;
     VAR_nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_080c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue := VAR_pop2_uxn_opcodes_h_l2719_c41_a872_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_a601] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_ce66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output;

     -- nip[uxn_opcodes_h_l2720_c41_491c] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2720_c41_491c_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2720_c41_491c_phase <= VAR_nip_uxn_opcodes_h_l2720_c41_491c_phase;
     nip_uxn_opcodes_h_l2720_c41_491c_ins <= VAR_nip_uxn_opcodes_h_l2720_c41_491c_ins;
     nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2720_c41_491c_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2720_c41_491c_return_output := nip_uxn_opcodes_h_l2720_c41_491c_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_a601_return_output;
     VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ce66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue := VAR_nip_uxn_opcodes_h_l2720_c41_491c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_0fe1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output;

     -- nip2[uxn_opcodes_h_l2721_c41_48ba] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2721_c41_48ba_phase <= VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_phase;
     nip2_uxn_opcodes_h_l2721_c41_48ba_ins <= VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_ins;
     nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_return_output := nip2_uxn_opcodes_h_l2721_c41_48ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_7ec3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output;
     VAR_swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_7ec3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue := VAR_nip2_uxn_opcodes_h_l2721_c41_48ba_return_output;
     -- swp[uxn_opcodes_h_l2722_c41_391a] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2722_c41_391a_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2722_c41_391a_phase <= VAR_swp_uxn_opcodes_h_l2722_c41_391a_phase;
     swp_uxn_opcodes_h_l2722_c41_391a_ins <= VAR_swp_uxn_opcodes_h_l2722_c41_391a_ins;
     swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2722_c41_391a_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2722_c41_391a_return_output := swp_uxn_opcodes_h_l2722_c41_391a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_de59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_b6b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output;
     VAR_swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_de59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue := VAR_swp_uxn_opcodes_h_l2722_c41_391a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_e732] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_d928] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output;

     -- swp2[uxn_opcodes_h_l2723_c41_934d] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2723_c41_934d_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2723_c41_934d_phase <= VAR_swp2_uxn_opcodes_h_l2723_c41_934d_phase;
     swp2_uxn_opcodes_h_l2723_c41_934d_ins <= VAR_swp2_uxn_opcodes_h_l2723_c41_934d_ins;
     swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2723_c41_934d_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2723_c41_934d_return_output := swp2_uxn_opcodes_h_l2723_c41_934d_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_e732_return_output;
     VAR_rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_d928_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue := VAR_swp2_uxn_opcodes_h_l2723_c41_934d_return_output;
     -- rot[uxn_opcodes_h_l2724_c41_6e38] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2724_c41_6e38_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2724_c41_6e38_phase <= VAR_rot_uxn_opcodes_h_l2724_c41_6e38_phase;
     rot_uxn_opcodes_h_l2724_c41_6e38_ins <= VAR_rot_uxn_opcodes_h_l2724_c41_6e38_ins;
     rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2724_c41_6e38_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2724_c41_6e38_return_output := rot_uxn_opcodes_h_l2724_c41_6e38_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_5c49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_5fee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output;
     VAR_rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_5fee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue := VAR_rot_uxn_opcodes_h_l2724_c41_6e38_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_2617] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_fc65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output;

     -- rot2[uxn_opcodes_h_l2725_c41_2659] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2725_c41_2659_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2725_c41_2659_phase <= VAR_rot2_uxn_opcodes_h_l2725_c41_2659_phase;
     rot2_uxn_opcodes_h_l2725_c41_2659_ins <= VAR_rot2_uxn_opcodes_h_l2725_c41_2659_ins;
     rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2725_c41_2659_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2725_c41_2659_return_output := rot2_uxn_opcodes_h_l2725_c41_2659_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output;
     VAR_dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_2617_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue := VAR_rot2_uxn_opcodes_h_l2725_c41_2659_return_output;
     -- dup[uxn_opcodes_h_l2726_c41_c0af] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2726_c41_c0af_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2726_c41_c0af_phase <= VAR_dup_uxn_opcodes_h_l2726_c41_c0af_phase;
     dup_uxn_opcodes_h_l2726_c41_c0af_ins <= VAR_dup_uxn_opcodes_h_l2726_c41_c0af_ins;
     dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2726_c41_c0af_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2726_c41_c0af_return_output := dup_uxn_opcodes_h_l2726_c41_c0af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_e024] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_d34f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_e024_return_output;
     VAR_dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_d34f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue := VAR_dup_uxn_opcodes_h_l2726_c41_c0af_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_35d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output;

     -- dup2[uxn_opcodes_h_l2727_c41_4986] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2727_c41_4986_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2727_c41_4986_phase <= VAR_dup2_uxn_opcodes_h_l2727_c41_4986_phase;
     dup2_uxn_opcodes_h_l2727_c41_4986_ins <= VAR_dup2_uxn_opcodes_h_l2727_c41_4986_ins;
     dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2727_c41_4986_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2727_c41_4986_return_output := dup2_uxn_opcodes_h_l2727_c41_4986_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_2b47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output;
     VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_35d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue := VAR_dup2_uxn_opcodes_h_l2727_c41_4986_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_7606] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_0d58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output;

     -- ovr[uxn_opcodes_h_l2728_c41_e2b1] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2728_c41_e2b1_phase <= VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_phase;
     ovr_uxn_opcodes_h_l2728_c41_e2b1_ins <= VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_ins;
     ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output := ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7606_return_output;
     VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_0d58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue := VAR_ovr_uxn_opcodes_h_l2728_c41_e2b1_return_output;
     -- ovr2[uxn_opcodes_h_l2729_c41_0aa9] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase <= VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_phase;
     ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins <= VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_ins;
     ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output := ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_b9a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_1217] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output;
     VAR_equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_1217_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue := VAR_ovr2_uxn_opcodes_h_l2729_c41_0aa9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_17e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_9b69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output;

     -- equ[uxn_opcodes_h_l2730_c41_76b8] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2730_c41_76b8_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2730_c41_76b8_phase <= VAR_equ_uxn_opcodes_h_l2730_c41_76b8_phase;
     equ_uxn_opcodes_h_l2730_c41_76b8_ins <= VAR_equ_uxn_opcodes_h_l2730_c41_76b8_ins;
     equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2730_c41_76b8_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2730_c41_76b8_return_output := equ_uxn_opcodes_h_l2730_c41_76b8_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output;
     VAR_equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_17e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue := VAR_equ_uxn_opcodes_h_l2730_c41_76b8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_5d72] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_3086] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output;

     -- equ2[uxn_opcodes_h_l2731_c41_0992] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2731_c41_0992_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2731_c41_0992_phase <= VAR_equ2_uxn_opcodes_h_l2731_c41_0992_phase;
     equ2_uxn_opcodes_h_l2731_c41_0992_ins <= VAR_equ2_uxn_opcodes_h_l2731_c41_0992_ins;
     equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2731_c41_0992_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2731_c41_0992_return_output := equ2_uxn_opcodes_h_l2731_c41_0992_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_3086_return_output;
     VAR_neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_5d72_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue := VAR_equ2_uxn_opcodes_h_l2731_c41_0992_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_2f5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output;

     -- neq[uxn_opcodes_h_l2732_c41_a19f] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2732_c41_a19f_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2732_c41_a19f_phase <= VAR_neq_uxn_opcodes_h_l2732_c41_a19f_phase;
     neq_uxn_opcodes_h_l2732_c41_a19f_ins <= VAR_neq_uxn_opcodes_h_l2732_c41_a19f_ins;
     neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2732_c41_a19f_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2732_c41_a19f_return_output := neq_uxn_opcodes_h_l2732_c41_a19f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_439f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_439f_return_output;
     VAR_neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_2f5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue := VAR_neq_uxn_opcodes_h_l2732_c41_a19f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_7504] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_09ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output;

     -- neq2[uxn_opcodes_h_l2733_c41_434c] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2733_c41_434c_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2733_c41_434c_phase <= VAR_neq2_uxn_opcodes_h_l2733_c41_434c_phase;
     neq2_uxn_opcodes_h_l2733_c41_434c_ins <= VAR_neq2_uxn_opcodes_h_l2733_c41_434c_ins;
     neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2733_c41_434c_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2733_c41_434c_return_output := neq2_uxn_opcodes_h_l2733_c41_434c_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output;
     VAR_gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_7504_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue := VAR_neq2_uxn_opcodes_h_l2733_c41_434c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_7381] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output;

     -- gth[uxn_opcodes_h_l2734_c41_687d] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2734_c41_687d_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2734_c41_687d_phase <= VAR_gth_uxn_opcodes_h_l2734_c41_687d_phase;
     gth_uxn_opcodes_h_l2734_c41_687d_ins <= VAR_gth_uxn_opcodes_h_l2734_c41_687d_ins;
     gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2734_c41_687d_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2734_c41_687d_return_output := gth_uxn_opcodes_h_l2734_c41_687d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_388d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_7381_return_output;
     VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_388d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue := VAR_gth_uxn_opcodes_h_l2734_c41_687d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_469b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_5dbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output;

     -- gth2[uxn_opcodes_h_l2735_c41_8f3d] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2735_c41_8f3d_phase <= VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_phase;
     gth2_uxn_opcodes_h_l2735_c41_8f3d_ins <= VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_ins;
     gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output := gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output;
     VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_469b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue := VAR_gth2_uxn_opcodes_h_l2735_c41_8f3d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_06fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_6cfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output;

     -- lth[uxn_opcodes_h_l2736_c41_7ca9] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2736_c41_7ca9_phase <= VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_phase;
     lth_uxn_opcodes_h_l2736_c41_7ca9_ins <= VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_ins;
     lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_return_output := lth_uxn_opcodes_h_l2736_c41_7ca9_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output;
     VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_06fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue := VAR_lth_uxn_opcodes_h_l2736_c41_7ca9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_650b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output;

     -- lth2[uxn_opcodes_h_l2737_c41_23a9] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2737_c41_23a9_phase <= VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_phase;
     lth2_uxn_opcodes_h_l2737_c41_23a9_ins <= VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_ins;
     lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_return_output := lth2_uxn_opcodes_h_l2737_c41_23a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_b0b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_650b_return_output;
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_b0b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue := VAR_lth2_uxn_opcodes_h_l2737_c41_23a9_return_output;
     -- jmp[uxn_opcodes_h_l2738_c41_efa4] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2738_c41_efa4_phase <= VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_phase;
     jmp_uxn_opcodes_h_l2738_c41_efa4_ins <= VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_ins;
     jmp_uxn_opcodes_h_l2738_c41_efa4_pc <= VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_pc;
     jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_return_output := jmp_uxn_opcodes_h_l2738_c41_efa4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_309f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_75c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output;
     VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_309f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue := VAR_jmp_uxn_opcodes_h_l2738_c41_efa4_return_output;
     -- jmp2[uxn_opcodes_h_l2739_c41_208f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2739_c41_208f_phase <= VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_phase;
     jmp2_uxn_opcodes_h_l2739_c41_208f_ins <= VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_ins;
     jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_return_output := jmp2_uxn_opcodes_h_l2739_c41_208f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_3662] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_51ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_3662_return_output;
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_51ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue := VAR_jmp2_uxn_opcodes_h_l2739_c41_208f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_bb5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_ac66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output;

     -- jcn[uxn_opcodes_h_l2740_c41_c99b] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2740_c41_c99b_phase <= VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_phase;
     jcn_uxn_opcodes_h_l2740_c41_c99b_ins <= VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_ins;
     jcn_uxn_opcodes_h_l2740_c41_c99b_pc <= VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_pc;
     jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_return_output := jcn_uxn_opcodes_h_l2740_c41_c99b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output;
     VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_ac66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue := VAR_jcn_uxn_opcodes_h_l2740_c41_c99b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_f48a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_b75e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output;

     -- jcn2[uxn_opcodes_h_l2741_c41_f823] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2741_c41_f823_phase <= VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_phase;
     jcn2_uxn_opcodes_h_l2741_c41_f823_ins <= VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_ins;
     jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_return_output := jcn2_uxn_opcodes_h_l2741_c41_f823_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output;
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_f48a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue := VAR_jcn2_uxn_opcodes_h_l2741_c41_f823_return_output;
     -- jsr[uxn_opcodes_h_l2742_c41_7762] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2742_c41_7762_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2742_c41_7762_phase <= VAR_jsr_uxn_opcodes_h_l2742_c41_7762_phase;
     jsr_uxn_opcodes_h_l2742_c41_7762_ins <= VAR_jsr_uxn_opcodes_h_l2742_c41_7762_ins;
     jsr_uxn_opcodes_h_l2742_c41_7762_pc <= VAR_jsr_uxn_opcodes_h_l2742_c41_7762_pc;
     jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2742_c41_7762_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2742_c41_7762_return_output := jsr_uxn_opcodes_h_l2742_c41_7762_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_d6e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_4d1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output;
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_d6e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue := VAR_jsr_uxn_opcodes_h_l2742_c41_7762_return_output;
     -- jsr2[uxn_opcodes_h_l2743_c41_331d] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2743_c41_331d_phase <= VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_phase;
     jsr2_uxn_opcodes_h_l2743_c41_331d_ins <= VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_ins;
     jsr2_uxn_opcodes_h_l2743_c41_331d_pc <= VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_pc;
     jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_return_output := jsr2_uxn_opcodes_h_l2743_c41_331d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_1542] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_cfaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output;
     VAR_sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_1542_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue := VAR_jsr2_uxn_opcodes_h_l2743_c41_331d_return_output;
     -- sth[uxn_opcodes_h_l2744_c41_ad10] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2744_c41_ad10_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2744_c41_ad10_phase <= VAR_sth_uxn_opcodes_h_l2744_c41_ad10_phase;
     sth_uxn_opcodes_h_l2744_c41_ad10_ins <= VAR_sth_uxn_opcodes_h_l2744_c41_ad10_ins;
     sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2744_c41_ad10_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2744_c41_ad10_return_output := sth_uxn_opcodes_h_l2744_c41_ad10_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_c289] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_668d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_668d_return_output;
     VAR_sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_c289_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue := VAR_sth_uxn_opcodes_h_l2744_c41_ad10_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_e513] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_03d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output;

     -- sth2[uxn_opcodes_h_l2745_c41_c165] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2745_c41_c165_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2745_c41_c165_phase <= VAR_sth2_uxn_opcodes_h_l2745_c41_c165_phase;
     sth2_uxn_opcodes_h_l2745_c41_c165_ins <= VAR_sth2_uxn_opcodes_h_l2745_c41_c165_ins;
     sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2745_c41_c165_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2745_c41_c165_return_output := sth2_uxn_opcodes_h_l2745_c41_c165_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_e513_return_output;
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_03d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue := VAR_sth2_uxn_opcodes_h_l2745_c41_c165_return_output;
     -- ldz[uxn_opcodes_h_l2746_c41_2bc9] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2746_c41_2bc9_phase <= VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_phase;
     ldz_uxn_opcodes_h_l2746_c41_2bc9_ins <= VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_ins;
     ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_stack_read;
     ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output := ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_a5f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_22ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output;
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_a5f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue := VAR_ldz_uxn_opcodes_h_l2746_c41_2bc9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_78af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_fcba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output;

     -- ldz2[uxn_opcodes_h_l2747_c41_8b6a] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase <= VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_phase;
     ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins <= VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_ins;
     ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_stack_read;
     ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output := ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output;
     VAR_stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_78af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue := VAR_ldz2_uxn_opcodes_h_l2747_c41_8b6a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_e82b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_125e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output;

     -- stz[uxn_opcodes_h_l2748_c41_56da] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2748_c41_56da_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2748_c41_56da_phase <= VAR_stz_uxn_opcodes_h_l2748_c41_56da_phase;
     stz_uxn_opcodes_h_l2748_c41_56da_ins <= VAR_stz_uxn_opcodes_h_l2748_c41_56da_ins;
     stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2748_c41_56da_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2748_c41_56da_return_output := stz_uxn_opcodes_h_l2748_c41_56da_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output;
     VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_125e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue := VAR_stz_uxn_opcodes_h_l2748_c41_56da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_17e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_0d34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output;

     -- stz2[uxn_opcodes_h_l2749_c41_0bea] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2749_c41_0bea_phase <= VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_phase;
     stz2_uxn_opcodes_h_l2749_c41_0bea_ins <= VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_ins;
     stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_return_output := stz2_uxn_opcodes_h_l2749_c41_0bea_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output;
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_0d34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue := VAR_stz2_uxn_opcodes_h_l2749_c41_0bea_return_output;
     -- ldr[uxn_opcodes_h_l2750_c41_dc44] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2750_c41_dc44_phase <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_phase;
     ldr_uxn_opcodes_h_l2750_c41_dc44_ins <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_ins;
     ldr_uxn_opcodes_h_l2750_c41_dc44_pc <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_pc;
     ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_stack_read;
     ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_return_output := ldr_uxn_opcodes_h_l2750_c41_dc44_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_11d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_4c5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output;
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_11d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue := VAR_ldr_uxn_opcodes_h_l2750_c41_dc44_return_output;
     -- ldr2[uxn_opcodes_h_l2751_c41_39fa] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2751_c41_39fa_phase <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_phase;
     ldr2_uxn_opcodes_h_l2751_c41_39fa_ins <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_ins;
     ldr2_uxn_opcodes_h_l2751_c41_39fa_pc <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_pc;
     ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_stack_read;
     ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output := ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_891a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_99c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_891a_return_output;
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_99c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue := VAR_ldr2_uxn_opcodes_h_l2751_c41_39fa_return_output;
     -- str1[uxn_opcodes_h_l2752_c41_dfd3] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2752_c41_dfd3_phase <= VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_phase;
     str1_uxn_opcodes_h_l2752_c41_dfd3_ins <= VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_ins;
     str1_uxn_opcodes_h_l2752_c41_dfd3_pc <= VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_pc;
     str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_return_output := str1_uxn_opcodes_h_l2752_c41_dfd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_10e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_7a9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output;
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_10e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue := VAR_str1_uxn_opcodes_h_l2752_c41_dfd3_return_output;
     -- str2[uxn_opcodes_h_l2753_c41_d977] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2753_c41_d977_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2753_c41_d977_phase <= VAR_str2_uxn_opcodes_h_l2753_c41_d977_phase;
     str2_uxn_opcodes_h_l2753_c41_d977_ins <= VAR_str2_uxn_opcodes_h_l2753_c41_d977_ins;
     str2_uxn_opcodes_h_l2753_c41_d977_pc <= VAR_str2_uxn_opcodes_h_l2753_c41_d977_pc;
     str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2753_c41_d977_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2753_c41_d977_return_output := str2_uxn_opcodes_h_l2753_c41_d977_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_9dd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_eade] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_eade_return_output;
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_9dd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue := VAR_str2_uxn_opcodes_h_l2753_c41_d977_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_c237] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output;

     -- lda[uxn_opcodes_h_l2754_c41_acf5] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2754_c41_acf5_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2754_c41_acf5_phase <= VAR_lda_uxn_opcodes_h_l2754_c41_acf5_phase;
     lda_uxn_opcodes_h_l2754_c41_acf5_ins <= VAR_lda_uxn_opcodes_h_l2754_c41_acf5_ins;
     lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_stack_read;
     lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2754_c41_acf5_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2754_c41_acf5_return_output := lda_uxn_opcodes_h_l2754_c41_acf5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_8fc4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output;
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_c237_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue := VAR_lda_uxn_opcodes_h_l2754_c41_acf5_return_output;
     -- lda2[uxn_opcodes_h_l2755_c41_9017] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2755_c41_9017_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2755_c41_9017_phase <= VAR_lda2_uxn_opcodes_h_l2755_c41_9017_phase;
     lda2_uxn_opcodes_h_l2755_c41_9017_ins <= VAR_lda2_uxn_opcodes_h_l2755_c41_9017_ins;
     lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_stack_read;
     lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2755_c41_9017_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2755_c41_9017_return_output := lda2_uxn_opcodes_h_l2755_c41_9017_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_bf8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_0da4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output;
     VAR_sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_bf8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue := VAR_lda2_uxn_opcodes_h_l2755_c41_9017_return_output;
     -- sta[uxn_opcodes_h_l2756_c41_84c3] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2756_c41_84c3_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2756_c41_84c3_phase <= VAR_sta_uxn_opcodes_h_l2756_c41_84c3_phase;
     sta_uxn_opcodes_h_l2756_c41_84c3_ins <= VAR_sta_uxn_opcodes_h_l2756_c41_84c3_ins;
     sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2756_c41_84c3_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2756_c41_84c3_return_output := sta_uxn_opcodes_h_l2756_c41_84c3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_02d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_75e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output;
     VAR_sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_02d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue := VAR_sta_uxn_opcodes_h_l2756_c41_84c3_return_output;
     -- sta2[uxn_opcodes_h_l2757_c41_da54] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2757_c41_da54_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2757_c41_da54_phase <= VAR_sta2_uxn_opcodes_h_l2757_c41_da54_phase;
     sta2_uxn_opcodes_h_l2757_c41_da54_ins <= VAR_sta2_uxn_opcodes_h_l2757_c41_da54_ins;
     sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2757_c41_da54_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2757_c41_da54_return_output := sta2_uxn_opcodes_h_l2757_c41_da54_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_1f49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_4b64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output;
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4b64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue := VAR_sta2_uxn_opcodes_h_l2757_c41_da54_return_output;
     -- dei[uxn_opcodes_h_l2758_c41_9a15] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2758_c41_9a15_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2758_c41_9a15_phase <= VAR_dei_uxn_opcodes_h_l2758_c41_9a15_phase;
     dei_uxn_opcodes_h_l2758_c41_9a15_ins <= VAR_dei_uxn_opcodes_h_l2758_c41_9a15_ins;
     dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_stack_read;
     dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2758_c41_9a15_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2758_c41_9a15_return_output := dei_uxn_opcodes_h_l2758_c41_9a15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_20f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_a849] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output;
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_a849_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue := VAR_dei_uxn_opcodes_h_l2758_c41_9a15_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_afb1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output;

     -- dei2[uxn_opcodes_h_l2759_c41_68eb] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2759_c41_68eb_phase <= VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_phase;
     dei2_uxn_opcodes_h_l2759_c41_68eb_ins <= VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_ins;
     dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_stack_read;
     dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_return_output := dei2_uxn_opcodes_h_l2759_c41_68eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_1fdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output;
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_afb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue := VAR_dei2_uxn_opcodes_h_l2759_c41_68eb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_449e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output;

     -- deo[uxn_opcodes_h_l2760_c41_fddb] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2760_c41_fddb_phase <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_phase;
     deo_uxn_opcodes_h_l2760_c41_fddb_ins <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_ins;
     deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_stack_read;
     deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_device_ram_read;
     deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2760_c41_fddb_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2760_c41_fddb_return_output := deo_uxn_opcodes_h_l2760_c41_fddb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_380f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_449e_return_output;
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_380f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue := VAR_deo_uxn_opcodes_h_l2760_c41_fddb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_0e2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output;

     -- deo2[uxn_opcodes_h_l2761_c41_716b] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2761_c41_716b_phase <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_phase;
     deo2_uxn_opcodes_h_l2761_c41_716b_ins <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_ins;
     deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_stack_read;
     deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2761_c41_716b_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2761_c41_716b_return_output := deo2_uxn_opcodes_h_l2761_c41_716b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_6cc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output;
     VAR_add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6cc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue := VAR_deo2_uxn_opcodes_h_l2761_c41_716b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_8897] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_852e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output;

     -- add[uxn_opcodes_h_l2762_c41_a806] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2762_c41_a806_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2762_c41_a806_phase <= VAR_add_uxn_opcodes_h_l2762_c41_a806_phase;
     add_uxn_opcodes_h_l2762_c41_a806_ins <= VAR_add_uxn_opcodes_h_l2762_c41_a806_ins;
     add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read <= VAR_add_uxn_opcodes_h_l2762_c41_a806_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2762_c41_a806_return_output := add_uxn_opcodes_h_l2762_c41_a806_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_8897_return_output;
     VAR_add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_852e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue := VAR_add_uxn_opcodes_h_l2762_c41_a806_return_output;
     -- add2[uxn_opcodes_h_l2763_c41_aa94] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2763_c41_aa94_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2763_c41_aa94_phase <= VAR_add2_uxn_opcodes_h_l2763_c41_aa94_phase;
     add2_uxn_opcodes_h_l2763_c41_aa94_ins <= VAR_add2_uxn_opcodes_h_l2763_c41_aa94_ins;
     add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2763_c41_aa94_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2763_c41_aa94_return_output := add2_uxn_opcodes_h_l2763_c41_aa94_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_7bb3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_e2ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output;
     VAR_sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_7bb3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue := VAR_add2_uxn_opcodes_h_l2763_c41_aa94_return_output;
     -- sub[uxn_opcodes_h_l2764_c41_9e31] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2764_c41_9e31_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2764_c41_9e31_phase <= VAR_sub_uxn_opcodes_h_l2764_c41_9e31_phase;
     sub_uxn_opcodes_h_l2764_c41_9e31_ins <= VAR_sub_uxn_opcodes_h_l2764_c41_9e31_ins;
     sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2764_c41_9e31_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2764_c41_9e31_return_output := sub_uxn_opcodes_h_l2764_c41_9e31_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_7e02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_c36f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output;
     VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_c36f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue := VAR_sub_uxn_opcodes_h_l2764_c41_9e31_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_9a1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_dc80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output;

     -- sub2[uxn_opcodes_h_l2765_c41_ce76] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2765_c41_ce76_phase <= VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_phase;
     sub2_uxn_opcodes_h_l2765_c41_ce76_ins <= VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_ins;
     sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_return_output := sub2_uxn_opcodes_h_l2765_c41_ce76_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output;
     VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_dc80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue := VAR_sub2_uxn_opcodes_h_l2765_c41_ce76_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_602f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_4cd7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output;

     -- mul[uxn_opcodes_h_l2766_c41_fb6e] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2766_c41_fb6e_phase <= VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_phase;
     mul_uxn_opcodes_h_l2766_c41_fb6e_ins <= VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_ins;
     mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_return_output := mul_uxn_opcodes_h_l2766_c41_fb6e_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output;
     VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_602f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue := VAR_mul_uxn_opcodes_h_l2766_c41_fb6e_return_output;
     -- mul2[uxn_opcodes_h_l2767_c41_0a10] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2767_c41_0a10_phase <= VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_phase;
     mul2_uxn_opcodes_h_l2767_c41_0a10_ins <= VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_ins;
     mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_return_output := mul2_uxn_opcodes_h_l2767_c41_0a10_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d36d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_5c49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output;
     VAR_div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d36d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue := VAR_mul2_uxn_opcodes_h_l2767_c41_0a10_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_7a53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_3dec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output;

     -- div[uxn_opcodes_h_l2768_c41_782d] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2768_c41_782d_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2768_c41_782d_phase <= VAR_div_uxn_opcodes_h_l2768_c41_782d_phase;
     div_uxn_opcodes_h_l2768_c41_782d_ins <= VAR_div_uxn_opcodes_h_l2768_c41_782d_ins;
     div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read <= VAR_div_uxn_opcodes_h_l2768_c41_782d_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2768_c41_782d_return_output := div_uxn_opcodes_h_l2768_c41_782d_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output;
     VAR_div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7a53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue := VAR_div_uxn_opcodes_h_l2768_c41_782d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_d65e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_741a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output;

     -- div2[uxn_opcodes_h_l2769_c41_d310] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2769_c41_d310_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2769_c41_d310_phase <= VAR_div2_uxn_opcodes_h_l2769_c41_d310_phase;
     div2_uxn_opcodes_h_l2769_c41_d310_ins <= VAR_div2_uxn_opcodes_h_l2769_c41_d310_ins;
     div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2769_c41_d310_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2769_c41_d310_return_output := div2_uxn_opcodes_h_l2769_c41_d310_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output;
     VAR_and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_741a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue := VAR_div2_uxn_opcodes_h_l2769_c41_d310_return_output;
     -- and[uxn_opcodes_h_l2770_c41_e3cf] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2770_c41_e3cf_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2770_c41_e3cf_phase <= VAR_and_uxn_opcodes_h_l2770_c41_e3cf_phase;
     and_uxn_opcodes_h_l2770_c41_e3cf_ins <= VAR_and_uxn_opcodes_h_l2770_c41_e3cf_ins;
     and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read <= VAR_and_uxn_opcodes_h_l2770_c41_e3cf_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2770_c41_e3cf_return_output := and_uxn_opcodes_h_l2770_c41_e3cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_43aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_fead] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fead_return_output;
     VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_43aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue := VAR_and_uxn_opcodes_h_l2770_c41_e3cf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_b89e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_52b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output;

     -- and2[uxn_opcodes_h_l2771_c41_dfe1] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2771_c41_dfe1_phase <= VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_phase;
     and2_uxn_opcodes_h_l2771_c41_dfe1_ins <= VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_ins;
     and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_return_output := and2_uxn_opcodes_h_l2771_c41_dfe1_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output;
     VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_52b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue := VAR_and2_uxn_opcodes_h_l2771_c41_dfe1_return_output;
     -- ora[uxn_opcodes_h_l2772_c41_9d8d] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2772_c41_9d8d_phase <= VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_phase;
     ora_uxn_opcodes_h_l2772_c41_9d8d_ins <= VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_ins;
     ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_return_output := ora_uxn_opcodes_h_l2772_c41_9d8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_1485] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_d9f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_1485_return_output;
     VAR_ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_d9f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue := VAR_ora_uxn_opcodes_h_l2772_c41_9d8d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_dc7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_e7a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output;

     -- ora2[uxn_opcodes_h_l2773_c41_b350] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2773_c41_b350_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2773_c41_b350_phase <= VAR_ora2_uxn_opcodes_h_l2773_c41_b350_phase;
     ora2_uxn_opcodes_h_l2773_c41_b350_ins <= VAR_ora2_uxn_opcodes_h_l2773_c41_b350_ins;
     ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2773_c41_b350_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2773_c41_b350_return_output := ora2_uxn_opcodes_h_l2773_c41_b350_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output;
     VAR_eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_dc7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue := VAR_ora2_uxn_opcodes_h_l2773_c41_b350_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_612f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output;

     -- eor[uxn_opcodes_h_l2774_c41_4189] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2774_c41_4189_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2774_c41_4189_phase <= VAR_eor_uxn_opcodes_h_l2774_c41_4189_phase;
     eor_uxn_opcodes_h_l2774_c41_4189_ins <= VAR_eor_uxn_opcodes_h_l2774_c41_4189_ins;
     eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2774_c41_4189_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2774_c41_4189_return_output := eor_uxn_opcodes_h_l2774_c41_4189_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_67d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_612f_return_output;
     VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_67d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue := VAR_eor_uxn_opcodes_h_l2774_c41_4189_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_1289] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output;

     -- eor2[uxn_opcodes_h_l2775_c41_6ee3] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2775_c41_6ee3_phase <= VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_phase;
     eor2_uxn_opcodes_h_l2775_c41_6ee3_ins <= VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_ins;
     eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output := eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_fd76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output;
     VAR_sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_1289_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue := VAR_eor2_uxn_opcodes_h_l2775_c41_6ee3_return_output;
     -- sft[uxn_opcodes_h_l2776_c41_6482] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2776_c41_6482_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2776_c41_6482_phase <= VAR_sft_uxn_opcodes_h_l2776_c41_6482_phase;
     sft_uxn_opcodes_h_l2776_c41_6482_ins <= VAR_sft_uxn_opcodes_h_l2776_c41_6482_ins;
     sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2776_c41_6482_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2776_c41_6482_return_output := sft_uxn_opcodes_h_l2776_c41_6482_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_b2be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_ab00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_ab00_return_output;
     VAR_sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_b2be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue := VAR_sft_uxn_opcodes_h_l2776_c41_6482_return_output;
     -- printf_uxn_opcodes_h_l2778_c9_961b[uxn_opcodes_h_l2778_c9_961b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0 <= VAR_printf_uxn_opcodes_h_l2778_c9_961b_uxn_opcodes_h_l2778_c9_961b_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2777_c41_6665] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2777_c41_6665_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2777_c41_6665_phase <= VAR_sft2_uxn_opcodes_h_l2777_c41_6665_phase;
     sft2_uxn_opcodes_h_l2777_c41_6665_ins <= VAR_sft2_uxn_opcodes_h_l2777_c41_6665_ins;
     sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2777_c41_6665_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2777_c41_6665_return_output := sft2_uxn_opcodes_h_l2777_c41_6665_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue := VAR_sft2_uxn_opcodes_h_l2777_c41_6665_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2777_c7_fd76] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_cond;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output := opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_fd76_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2776_c7_612f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_cond;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output := opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_612f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2775_c7_e7a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output := opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_e7a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2774_c7_1485] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_cond;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output := opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_1485_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2773_c7_b89e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_cond;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output := opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_b89e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2772_c7_fead] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_cond;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output := opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fead_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2771_c7_d65e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_cond;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output := opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_d65e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2770_c7_3dec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_cond;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output := opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_3dec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2769_c7_5c49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_cond;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output := opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_5c49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2768_c7_4cd7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_cond;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output := opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_4cd7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2767_c7_9a1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output := opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_9a1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2766_c7_7e02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_cond;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output := opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_7e02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2765_c7_e2ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output := opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_e2ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2764_c7_8897] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_cond;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output := opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_8897_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2763_c7_0e2a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_cond;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output := opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_0e2a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2762_c7_449e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_cond;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output := opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_449e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2761_c7_1fdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output := opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_1fdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2760_c7_20f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output := opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_20f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2759_c7_1f49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_cond;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output := opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1f49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2758_c7_75e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output := opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_75e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2757_c7_0da4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_cond;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output := opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0da4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2756_c7_8fc4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_cond;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output := opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_8fc4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2755_c7_eade] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_cond;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output := opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_eade_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2754_c7_7a9d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_cond;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output := opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_7a9d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2753_c7_891a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_cond;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output := opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_891a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2752_c7_4c5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_cond;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output := opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_4c5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2751_c7_17e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_cond;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output := opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_17e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2750_c7_e82b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_cond;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output := opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_e82b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2749_c7_fcba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_cond;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output := opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_fcba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2748_c7_22ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output := opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_22ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2747_c7_e513] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_cond;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output := opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_e513_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2746_c7_668d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_cond;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output := opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_668d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2745_c7_cfaf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_cond;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output := opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_cfaf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2744_c7_4d1c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_cond;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output := opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4d1c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_b75e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_b75e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_bb5d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_bb5d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_3662] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_3662_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_75c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_75c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_650b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_650b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_6cfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6cfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_5dbb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5dbb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_7381] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_7381_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_09ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_09ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_439f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_439f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_3086] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_3086_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_9b69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9b69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_b9a6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_b9a6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_7606] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7606_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_2b47] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_2b47_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_e024] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_e024_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_fc65] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fc65_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_5c49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_5c49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_e732] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_e732_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_b6b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_b6b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_0fe1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_0fe1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_a601] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_a601_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_b932] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_b932_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_3c44] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_3c44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c7_46d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_46d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2718_c7_3d19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_cond;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output := opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_3d19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2717_c7_ccd7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_cond;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output := opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_ccd7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2716_c7_4a95] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_cond;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output := opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_4a95_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2715_c7_abd3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_cond;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output := opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_abd3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2714_c7_2502] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_cond;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output := opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_2502_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2713_c7_6150] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_cond;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output := opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_6150_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2712_c7_f381] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_cond;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output := opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_f381_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2711_c7_c13d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_cond;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output := opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_c13d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2710_c7_580c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_cond;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output := opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_580c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2709_c7_7b5d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_cond;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output := opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_7b5d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2708_c2_b1d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output := opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2801_c39_8976] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_8976_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2781_c17_7664] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_7664_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2806_c34_52fe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_52fe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2797_c3_fa11] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_fa11_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2804_c30_0afc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_0afc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2805_c33_ccfc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_ccfc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2791_c70_e500] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_e500_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2807_c37_5603] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_5603_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_54db LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_54db_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2810_c32_2ce1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_2ce1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2783_c6_ba10] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_ba10_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2802_c40_c6d9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_c6d9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2803_c34_43b7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_43b7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_d70b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_d70b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2808_c33_4f6e] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_4f6e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output.vram_address;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_ba10_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2783_c6_ba10_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2781_c17_7664_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2797_c3_fa11_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_54db_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2791_c59_a8c2] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_a8c2_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2791_c70_e500_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_c91b LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_c91b_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2785_l2787_DUPLICATE_d70b_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_b9cd LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_b9cd_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9(
     VAR_is_wait_MUX_uxn_opcodes_h_l2708_c2_b1d5_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2801_c39_8976_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2802_c40_c6d9_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2803_c34_43b7_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2804_c30_0afc_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2805_c33_ccfc_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2806_c34_52fe_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2807_c37_5603_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2808_c33_4f6e_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2809_l2796_DUPLICATE_54db_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2810_c32_2ce1_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2781_c2_e864] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_left;
     BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output := BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;
     VAR_MUX_uxn_opcodes_h_l2792_c20_556d_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2781_c2_e864_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_c91b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2785_l2787_DUPLICATE_c91b_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c59_a8c2_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_b9cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2812_l2690_DUPLICATE_b9cd_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2785_c4_b331] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2787_c4_5a65] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output;

     -- MUX[uxn_opcodes_h_l2792_c20_556d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2792_c20_556d_cond <= VAR_MUX_uxn_opcodes_h_l2792_c20_556d_cond;
     MUX_uxn_opcodes_h_l2792_c20_556d_iftrue <= VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iftrue;
     MUX_uxn_opcodes_h_l2792_c20_556d_iffalse <= VAR_MUX_uxn_opcodes_h_l2792_c20_556d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2792_c20_556d_return_output := MUX_uxn_opcodes_h_l2792_c20_556d_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l2785_c4_36d9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2785_c4_b331_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2787_c4_42cb := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2787_c4_5a65_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right := VAR_MUX_uxn_opcodes_h_l2792_c20_556d_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse := VAR_sp0_uxn_opcodes_h_l2787_c4_42cb;
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue := VAR_sp1_uxn_opcodes_h_l2785_c4_36d9;
     -- sp1_MUX[uxn_opcodes_h_l2784_c3_acd8] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_cond;
     sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue;
     sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output := sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2784_c3_acd8] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_cond;
     sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iftrue;
     sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output := sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2784_c3_acd8_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2783_c2_93b8] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_cond;
     sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue;
     sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output := sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2783_c2_93b8] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_cond;
     sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iftrue;
     sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output := sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;
     VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2783_c2_93b8_return_output;
     -- MUX[uxn_opcodes_h_l2791_c30_caa5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2791_c30_caa5_cond <= VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_cond;
     MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue <= VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iftrue;
     MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse <= VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_return_output := MUX_uxn_opcodes_h_l2791_c30_caa5_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2791_c19_677c] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_677c_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2791_c30_caa5_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2791_c19_677c_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2791_c19_b06b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2791_c19_b06b_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2792_c2_df4e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l2792_c2_6a70 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2792_c2_df4e_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2792_c2_6a70;
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address := VAR_stack_address_uxn_opcodes_h_l2792_c2_6a70;
     -- stack_ram_update[uxn_opcodes_h_l2794_c21_6fdf] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_stack_address;
     stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_value;
     stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output := stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l2794_c21_6fdf_return_output;
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
