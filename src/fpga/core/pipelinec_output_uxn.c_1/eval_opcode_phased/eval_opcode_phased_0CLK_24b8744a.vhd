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
-- Submodules: 368
entity eval_opcode_phased_0CLK_24b8744a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_24b8744a;
architecture arch of eval_opcode_phased_0CLK_24b8744a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins_a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(8 downto 0) := to_unsigned(0, 9);
signal previous_stack_read : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
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
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_ins_a : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(8 downto 0);
signal REG_COMB_previous_stack_read : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2865_c10_24c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c10_2ee2]
signal MUX_uxn_opcodes_h_l2865_c10_2ee2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2866_c8_bc07]
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_0190]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_0555]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2872_c2_3434]
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c2_3434]
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2872_c48_ed44]
signal brk_uxn_opcodes_h_l2872_c48_ed44_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2872_c48_ed44_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_7b09]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_4214]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_f0e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_0555]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2873_c40_8894]
signal jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_8894_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_8894_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_8894_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_fe1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_9d6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f2d9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_f0e6]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2874_c40_dd13]
signal jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_dd13_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_dd13_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_dd13_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_18ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_618e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_abe3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_f2d9]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2875_c40_3e5f]
signal jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_3e5f_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_3e5f_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_da21]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_0ddc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_5b19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_abe3]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2876_c40_c1d3]
signal lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_c1d3_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_c1d3_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_c1d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_397f]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_960f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_a3c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_5b19]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2877_c40_5ee1]
signal lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_5ee1_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_5ee1_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_8880]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2f86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_fc59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_a3c5]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2878_c40_f6da]
signal lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_f6da_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_f6da_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_f6da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_1071]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_5f30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_dee5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_fc59]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2879_c40_bc54]
signal lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_bc54_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_bc54_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_bc54_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_f98e]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3810]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_4670]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_dee5]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2880_c40_1776]
signal inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1776_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1776_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1776_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_013d]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_1ce2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_26fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_4670]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2881_c40_fe03]
signal inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_fe03_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_fe03_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_fe03_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_8f3e]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_f31b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_1d04]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_26fd]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2882_c40_fddb]
signal pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_fddb_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_fddb_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_fddb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_ae75]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_5fde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_9c56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_1d04]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2883_c40_923e]
signal pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_923e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_923e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_923e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_d118]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_5351]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_c831]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_9c56]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2884_c40_1bb7]
signal nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_1bb7_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_1bb7_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_1bb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_c204]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_0db4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_5ac6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_c831]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2885_c40_2586]
signal nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_2586_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_2586_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_2586_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_0d61]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_9d84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_f6da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_5ac6]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2886_c40_2f7c]
signal swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_2f7c_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_2f7c_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_2f7c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_cbc1]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_d7bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3718]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_f6da]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2887_c40_f0d6]
signal swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_f0d6_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_f0d6_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_731b]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_8e3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_5d02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_3718]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2888_c40_7b06]
signal rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_7b06_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_7b06_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_7b06_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_b1c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_ba06]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2f7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_5d02]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2889_c40_76f4]
signal rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_76f4_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_76f4_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_76f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_4478]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_71d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_11c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_2f7d]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2890_c40_8583]
signal dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8583_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8583_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8583_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_2180]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_cff9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_cf2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_11c4]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2891_c40_278b]
signal dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_278b_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_278b_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_278b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_f76d]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_eb4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_1bb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_cf2d]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2892_c40_39ab]
signal ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_39ab_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_39ab_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_39ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_d0eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_dcd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_0740]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_1bb9]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2893_c40_aeae]
signal ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_aeae_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_aeae_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_b624]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_5706]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_a778]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_0740]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2894_c40_d703]
signal equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_d703_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_d703_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_d703_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_6225]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_1b2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_f1bc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_a778]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2895_c40_1414]
signal equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1414_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1414_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1414_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_8741]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_be46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_9548]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_f1bc]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2896_c40_84f1]
signal neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_84f1_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_84f1_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_84f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_9291]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_5f88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_f9b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_9548]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2897_c40_94ff]
signal neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_94ff_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_94ff_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_94ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_ac88]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_1a5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_2a14]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_f9b4]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2898_c40_9b8e]
signal gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_9b8e_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_9b8e_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_9b8e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_ba00]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_e3e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_e230]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_2a14]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2899_c40_5875]
signal gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_5875_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_5875_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_5875_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_e946]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_9e35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_a49e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_e230]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2900_c40_52c8]
signal lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_52c8_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_52c8_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_52c8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_080f]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_6691]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_b9ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_a49e]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2901_c40_fc3f]
signal lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_fc3f_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_fc3f_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8d69]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_712e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_8127]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_b9ae]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2902_c40_b1e3]
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_8044]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_8ed3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_8be0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_8127]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2903_c40_b0b3]
signal jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_176b]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_328a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0e7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_8be0]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2904_c40_7b81]
signal jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_7b81_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_7b81_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_7b81_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_7b81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_2be1]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_548a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a3e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_0e7a]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2905_c40_88a4]
signal jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_88a4_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_88a4_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_b42d]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_bb70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_8c9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_a3e2]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2906_c40_d309]
signal jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_d309_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_d309_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_d309_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_d309_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_e9d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_713d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_64e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_8c9c]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2907_c40_a02e]
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_2f4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_e1ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_9099]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_64e6]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2908_c40_2809]
signal sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2809_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2809_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2809_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_fd78]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_76a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_3f93]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_9099]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2909_c40_136e]
signal sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_136e_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_136e_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_136e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_766e]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_22f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_1d38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_3f93]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2910_c40_01ac]
signal ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_01ac_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_01ac_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_01ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_4311]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_2025]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_0e70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_1d38]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2911_c40_77b8]
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_bca6]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_95ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_b23e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_0e70]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2912_c40_aef5]
signal stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_aef5_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_aef5_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_aef5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8dc0]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_e46a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_2609]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_b23e]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2913_c40_5312]
signal stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_5312_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_5312_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_5312_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d049]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_ad40]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_3202]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_2609]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2914_c40_1d46]
signal ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_1d46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_4752]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_5253]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_2687]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_3202]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2915_c40_15b3]
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_12dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_a6db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_f58f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_2687]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2916_c40_7b41]
signal str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_7b41_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_7b41_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_7b41_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_7b41_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_89db]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_e478]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_26ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_f58f]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2917_c40_67b8]
signal str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_67b8_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_67b8_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_67b8_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_67b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_fd4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_71db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_b7d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_26ef]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2918_c40_595c]
signal lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_595c_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_595c_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_595c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_d50b]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_56b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_e44d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_b7d4]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2919_c40_d5cd]
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_a1e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_4439]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_1098]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_e44d]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2920_c40_70a3]
signal sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_70a3_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_70a3_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_70a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_118d]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_6e3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_c2cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_1098]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2921_c40_55f3]
signal sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_55f3_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_55f3_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_55f3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_1b43]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_ed86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_7d40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_c2cc]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2922_c40_faeb]
signal dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_faeb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_769a]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_7980]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_702e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_7d40]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2923_c40_62a4]
signal dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_62a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_5d8c]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_ba6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_a3e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_702e]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2924_c40_e17d]
signal deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_e17d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_b70e]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_d6c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_d37b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_a3e6]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2925_c40_1ee5]
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_2814]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_6fa9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_9323]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_d37b]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2926_c40_1cb5]
signal add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2926_c40_1cb5_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_1cb5_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_1cb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_fd34]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_b82e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_9642]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_9323]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2927_c40_a2e7]
signal add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_a2e7_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_a2e7_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_a2e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_c263]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_9816]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_20ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_9642]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2928_c40_0b51]
signal sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_0b51_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_0b51_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_0b51_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0054]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_b04b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_73a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_20ee]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2929_c40_a751]
signal sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_a751_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_a751_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_a751_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_d9ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_10ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_4111]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_73a9]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2930_c40_b973]
signal mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_b973_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_b973_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_b973_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_0a90]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_9dd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_0118]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_4111]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2931_c40_daa1]
signal mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_daa1_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_daa1_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_daa1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_a0be]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_600b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_35f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_0118]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2932_c40_f7fd]
signal div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2932_c40_f7fd_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_f7fd_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_f7fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_0911]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_adcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_b943]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_35f8]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2933_c40_67a3]
signal div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_67a3_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_67a3_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_67a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_b428]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_8aca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_3924]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_b943]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2934_c40_a109]
signal and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2934_c40_a109_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_a109_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_a109_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_5ba7]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_5e5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_97d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_3924]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2935_c40_1400]
signal and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_1400_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_1400_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_1400_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_cd9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6156]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_8b33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_97d5]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2936_c40_ff40]
signal ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_ff40_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_ff40_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_ff40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_6fed]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_239c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_1c79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_8b33]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2937_c40_7f85]
signal ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7f85_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7f85_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7f85_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_f743]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_2ec6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_ac50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_1c79]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2938_c40_1f43]
signal eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1f43_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1f43_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1f43_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_849a]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_0552]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_b1c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_ac50]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2939_c40_5a3e]
signal eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_5a3e_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_5a3e_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_d643]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_8deb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_3b63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_b1c2]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2940_c40_784f]
signal sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_784f_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_784f_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_784f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_83a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_9697]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_3b63]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2941_c40_4615]
signal sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_4615_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_4615_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_4615_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2943_c16_b4e0]
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_337a]
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2946_c2_0929]
signal sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2946_c2_0929]
signal sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_2c88]
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_2ecc]
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2952_c29_25fc]
signal MUX_uxn_opcodes_h_l2952_c29_25fc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_25fc_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_6c98]
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2953_c20_7a08]
signal MUX_uxn_opcodes_h_l2953_c20_7a08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_7a08_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2953_c2_668f]
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2955_c24_2339]
signal stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output : unsigned(7 downto 0);

function uint8_4_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(4 downto 0)));
return return_output;
end function;

function CAST_TO_uint9_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_uint9_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0( ref_toks_0 : unsigned;
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
      base.is_waiting := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output);

-- MUX_uxn_opcodes_h_l2865_c10_2ee2
MUX_uxn_opcodes_h_l2865_c10_2ee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c10_2ee2_cond,
MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue,
MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse,
MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07
BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left,
BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right,
BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2872_c2_3434
is_wait_MUX_uxn_opcodes_h_l2872_c2_3434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond,
is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue,
is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse,
is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c2_3434
opc_result_MUX_uxn_opcodes_h_l2872_c2_3434 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output);

-- brk_uxn_opcodes_h_l2872_c48_ed44
brk_uxn_opcodes_h_l2872_c48_ed44 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2872_c48_ed44_phase,
brk_uxn_opcodes_h_l2872_c48_ed44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_0555
opc_result_MUX_uxn_opcodes_h_l2873_c7_0555 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output);

-- jci_uxn_opcodes_h_l2873_c40_8894
jci_uxn_opcodes_h_l2873_c40_8894 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2873_c40_8894_phase,
jci_uxn_opcodes_h_l2873_c40_8894_pc,
jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read,
jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read,
jci_uxn_opcodes_h_l2873_c40_8894_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6
opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output);

-- jmi_uxn_opcodes_h_l2874_c40_dd13
jmi_uxn_opcodes_h_l2874_c40_dd13 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2874_c40_dd13_phase,
jmi_uxn_opcodes_h_l2874_c40_dd13_pc,
jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read,
jmi_uxn_opcodes_h_l2874_c40_dd13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9
opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output);

-- jsi_uxn_opcodes_h_l2875_c40_3e5f
jsi_uxn_opcodes_h_l2875_c40_3e5f : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2875_c40_3e5f_phase,
jsi_uxn_opcodes_h_l2875_c40_3e5f_pc,
jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read,
jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3
opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output);

-- lit_uxn_opcodes_h_l2876_c40_c1d3
lit_uxn_opcodes_h_l2876_c40_c1d3 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2876_c40_c1d3_phase,
lit_uxn_opcodes_h_l2876_c40_c1d3_pc,
lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read,
lit_uxn_opcodes_h_l2876_c40_c1d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19
opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output);

-- lit2_uxn_opcodes_h_l2877_c40_5ee1
lit2_uxn_opcodes_h_l2877_c40_5ee1 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2877_c40_5ee1_phase,
lit2_uxn_opcodes_h_l2877_c40_5ee1_pc,
lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read,
lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5
opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output);

-- lit_uxn_opcodes_h_l2878_c40_f6da
lit_uxn_opcodes_h_l2878_c40_f6da : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2878_c40_f6da_phase,
lit_uxn_opcodes_h_l2878_c40_f6da_pc,
lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read,
lit_uxn_opcodes_h_l2878_c40_f6da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59
opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output);

-- lit2_uxn_opcodes_h_l2879_c40_bc54
lit2_uxn_opcodes_h_l2879_c40_bc54 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2879_c40_bc54_phase,
lit2_uxn_opcodes_h_l2879_c40_bc54_pc,
lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read,
lit2_uxn_opcodes_h_l2879_c40_bc54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5
opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output);

-- inc_uxn_opcodes_h_l2880_c40_1776
inc_uxn_opcodes_h_l2880_c40_1776 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2880_c40_1776_phase,
inc_uxn_opcodes_h_l2880_c40_1776_ins,
inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read,
inc_uxn_opcodes_h_l2880_c40_1776_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_4670
opc_result_MUX_uxn_opcodes_h_l2881_c7_4670 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output);

-- inc2_uxn_opcodes_h_l2881_c40_fe03
inc2_uxn_opcodes_h_l2881_c40_fe03 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2881_c40_fe03_phase,
inc2_uxn_opcodes_h_l2881_c40_fe03_ins,
inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read,
inc2_uxn_opcodes_h_l2881_c40_fe03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd
opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output);

-- pop_uxn_opcodes_h_l2882_c40_fddb
pop_uxn_opcodes_h_l2882_c40_fddb : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2882_c40_fddb_phase,
pop_uxn_opcodes_h_l2882_c40_fddb_ins,
pop_uxn_opcodes_h_l2882_c40_fddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04
opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output);

-- pop2_uxn_opcodes_h_l2883_c40_923e
pop2_uxn_opcodes_h_l2883_c40_923e : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2883_c40_923e_phase,
pop2_uxn_opcodes_h_l2883_c40_923e_ins,
pop2_uxn_opcodes_h_l2883_c40_923e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56
opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output);

-- nip_uxn_opcodes_h_l2884_c40_1bb7
nip_uxn_opcodes_h_l2884_c40_1bb7 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2884_c40_1bb7_phase,
nip_uxn_opcodes_h_l2884_c40_1bb7_ins,
nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read,
nip_uxn_opcodes_h_l2884_c40_1bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_c831
opc_result_MUX_uxn_opcodes_h_l2885_c7_c831 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output);

-- nip2_uxn_opcodes_h_l2885_c40_2586
nip2_uxn_opcodes_h_l2885_c40_2586 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2885_c40_2586_phase,
nip2_uxn_opcodes_h_l2885_c40_2586_ins,
nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read,
nip2_uxn_opcodes_h_l2885_c40_2586_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6
opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output);

-- swp_uxn_opcodes_h_l2886_c40_2f7c
swp_uxn_opcodes_h_l2886_c40_2f7c : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2886_c40_2f7c_phase,
swp_uxn_opcodes_h_l2886_c40_2f7c_ins,
swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read,
swp_uxn_opcodes_h_l2886_c40_2f7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da
opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output);

-- swp2_uxn_opcodes_h_l2887_c40_f0d6
swp2_uxn_opcodes_h_l2887_c40_f0d6 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2887_c40_f0d6_phase,
swp2_uxn_opcodes_h_l2887_c40_f0d6_ins,
swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read,
swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_3718
opc_result_MUX_uxn_opcodes_h_l2888_c7_3718 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output);

-- rot_uxn_opcodes_h_l2888_c40_7b06
rot_uxn_opcodes_h_l2888_c40_7b06 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2888_c40_7b06_phase,
rot_uxn_opcodes_h_l2888_c40_7b06_ins,
rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read,
rot_uxn_opcodes_h_l2888_c40_7b06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02
opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output);

-- rot2_uxn_opcodes_h_l2889_c40_76f4
rot2_uxn_opcodes_h_l2889_c40_76f4 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2889_c40_76f4_phase,
rot2_uxn_opcodes_h_l2889_c40_76f4_ins,
rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read,
rot2_uxn_opcodes_h_l2889_c40_76f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d
opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output);

-- dup_uxn_opcodes_h_l2890_c40_8583
dup_uxn_opcodes_h_l2890_c40_8583 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2890_c40_8583_phase,
dup_uxn_opcodes_h_l2890_c40_8583_ins,
dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read,
dup_uxn_opcodes_h_l2890_c40_8583_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4
opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output);

-- dup2_uxn_opcodes_h_l2891_c40_278b
dup2_uxn_opcodes_h_l2891_c40_278b : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2891_c40_278b_phase,
dup2_uxn_opcodes_h_l2891_c40_278b_ins,
dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read,
dup2_uxn_opcodes_h_l2891_c40_278b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d
opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output);

-- ovr_uxn_opcodes_h_l2892_c40_39ab
ovr_uxn_opcodes_h_l2892_c40_39ab : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2892_c40_39ab_phase,
ovr_uxn_opcodes_h_l2892_c40_39ab_ins,
ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read,
ovr_uxn_opcodes_h_l2892_c40_39ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9
opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output);

-- ovr2_uxn_opcodes_h_l2893_c40_aeae
ovr2_uxn_opcodes_h_l2893_c40_aeae : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2893_c40_aeae_phase,
ovr2_uxn_opcodes_h_l2893_c40_aeae_ins,
ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read,
ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_0740
opc_result_MUX_uxn_opcodes_h_l2894_c7_0740 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output);

-- equ_uxn_opcodes_h_l2894_c40_d703
equ_uxn_opcodes_h_l2894_c40_d703 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2894_c40_d703_phase,
equ_uxn_opcodes_h_l2894_c40_d703_ins,
equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read,
equ_uxn_opcodes_h_l2894_c40_d703_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_a778
opc_result_MUX_uxn_opcodes_h_l2895_c7_a778 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output);

-- equ2_uxn_opcodes_h_l2895_c40_1414
equ2_uxn_opcodes_h_l2895_c40_1414 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2895_c40_1414_phase,
equ2_uxn_opcodes_h_l2895_c40_1414_ins,
equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read,
equ2_uxn_opcodes_h_l2895_c40_1414_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc
opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output);

-- neq_uxn_opcodes_h_l2896_c40_84f1
neq_uxn_opcodes_h_l2896_c40_84f1 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2896_c40_84f1_phase,
neq_uxn_opcodes_h_l2896_c40_84f1_ins,
neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read,
neq_uxn_opcodes_h_l2896_c40_84f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_9548
opc_result_MUX_uxn_opcodes_h_l2897_c7_9548 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output);

-- neq2_uxn_opcodes_h_l2897_c40_94ff
neq2_uxn_opcodes_h_l2897_c40_94ff : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2897_c40_94ff_phase,
neq2_uxn_opcodes_h_l2897_c40_94ff_ins,
neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read,
neq2_uxn_opcodes_h_l2897_c40_94ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4
opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output);

-- gth_uxn_opcodes_h_l2898_c40_9b8e
gth_uxn_opcodes_h_l2898_c40_9b8e : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2898_c40_9b8e_phase,
gth_uxn_opcodes_h_l2898_c40_9b8e_ins,
gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read,
gth_uxn_opcodes_h_l2898_c40_9b8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14
opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output);

-- gth2_uxn_opcodes_h_l2899_c40_5875
gth2_uxn_opcodes_h_l2899_c40_5875 : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2899_c40_5875_phase,
gth2_uxn_opcodes_h_l2899_c40_5875_ins,
gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read,
gth2_uxn_opcodes_h_l2899_c40_5875_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_e230
opc_result_MUX_uxn_opcodes_h_l2900_c7_e230 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output);

-- lth_uxn_opcodes_h_l2900_c40_52c8
lth_uxn_opcodes_h_l2900_c40_52c8 : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2900_c40_52c8_phase,
lth_uxn_opcodes_h_l2900_c40_52c8_ins,
lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read,
lth_uxn_opcodes_h_l2900_c40_52c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e
opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output);

-- lth2_uxn_opcodes_h_l2901_c40_fc3f
lth2_uxn_opcodes_h_l2901_c40_fc3f : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2901_c40_fc3f_phase,
lth2_uxn_opcodes_h_l2901_c40_fc3f_ins,
lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read,
lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae
opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output);

-- jmp_uxn_opcodes_h_l2902_c40_b1e3
jmp_uxn_opcodes_h_l2902_c40_b1e3 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2902_c40_b1e3_phase,
jmp_uxn_opcodes_h_l2902_c40_b1e3_ins,
jmp_uxn_opcodes_h_l2902_c40_b1e3_pc,
jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read,
jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_8127
opc_result_MUX_uxn_opcodes_h_l2903_c7_8127 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output);

-- jmp2_uxn_opcodes_h_l2903_c40_b0b3
jmp2_uxn_opcodes_h_l2903_c40_b0b3 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase,
jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins,
jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read,
jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0
opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output);

-- jcn_uxn_opcodes_h_l2904_c40_7b81
jcn_uxn_opcodes_h_l2904_c40_7b81 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2904_c40_7b81_phase,
jcn_uxn_opcodes_h_l2904_c40_7b81_ins,
jcn_uxn_opcodes_h_l2904_c40_7b81_pc,
jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read,
jcn_uxn_opcodes_h_l2904_c40_7b81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output);

-- jcn2_uxn_opcodes_h_l2905_c40_88a4
jcn2_uxn_opcodes_h_l2905_c40_88a4 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2905_c40_88a4_phase,
jcn2_uxn_opcodes_h_l2905_c40_88a4_ins,
jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read,
jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2
opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output);

-- jsr_uxn_opcodes_h_l2906_c40_d309
jsr_uxn_opcodes_h_l2906_c40_d309 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2906_c40_d309_phase,
jsr_uxn_opcodes_h_l2906_c40_d309_ins,
jsr_uxn_opcodes_h_l2906_c40_d309_pc,
jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read,
jsr_uxn_opcodes_h_l2906_c40_d309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c
opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output);

-- jsr2_uxn_opcodes_h_l2907_c40_a02e
jsr2_uxn_opcodes_h_l2907_c40_a02e : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2907_c40_a02e_phase,
jsr2_uxn_opcodes_h_l2907_c40_a02e_ins,
jsr2_uxn_opcodes_h_l2907_c40_a02e_pc,
jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read,
jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6
opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output);

-- sth_uxn_opcodes_h_l2908_c40_2809
sth_uxn_opcodes_h_l2908_c40_2809 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2908_c40_2809_phase,
sth_uxn_opcodes_h_l2908_c40_2809_ins,
sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read,
sth_uxn_opcodes_h_l2908_c40_2809_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_9099
opc_result_MUX_uxn_opcodes_h_l2909_c7_9099 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output);

-- sth2_uxn_opcodes_h_l2909_c40_136e
sth2_uxn_opcodes_h_l2909_c40_136e : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2909_c40_136e_phase,
sth2_uxn_opcodes_h_l2909_c40_136e_ins,
sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read,
sth2_uxn_opcodes_h_l2909_c40_136e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93
opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output);

-- ldz_uxn_opcodes_h_l2910_c40_01ac
ldz_uxn_opcodes_h_l2910_c40_01ac : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2910_c40_01ac_phase,
ldz_uxn_opcodes_h_l2910_c40_01ac_ins,
ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read,
ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read,
ldz_uxn_opcodes_h_l2910_c40_01ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38
opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output);

-- ldz2_uxn_opcodes_h_l2911_c40_77b8
ldz2_uxn_opcodes_h_l2911_c40_77b8 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2911_c40_77b8_phase,
ldz2_uxn_opcodes_h_l2911_c40_77b8_ins,
ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read,
ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read,
ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70
opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output);

-- stz_uxn_opcodes_h_l2912_c40_aef5
stz_uxn_opcodes_h_l2912_c40_aef5 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2912_c40_aef5_phase,
stz_uxn_opcodes_h_l2912_c40_aef5_ins,
stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read,
stz_uxn_opcodes_h_l2912_c40_aef5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e
opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output);

-- stz2_uxn_opcodes_h_l2913_c40_5312
stz2_uxn_opcodes_h_l2913_c40_5312 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2913_c40_5312_phase,
stz2_uxn_opcodes_h_l2913_c40_5312_ins,
stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read,
stz2_uxn_opcodes_h_l2913_c40_5312_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_2609
opc_result_MUX_uxn_opcodes_h_l2914_c7_2609 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output);

-- ldr_uxn_opcodes_h_l2914_c40_1d46
ldr_uxn_opcodes_h_l2914_c40_1d46 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2914_c40_1d46_phase,
ldr_uxn_opcodes_h_l2914_c40_1d46_ins,
ldr_uxn_opcodes_h_l2914_c40_1d46_pc,
ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read,
ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read,
ldr_uxn_opcodes_h_l2914_c40_1d46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_3202
opc_result_MUX_uxn_opcodes_h_l2915_c7_3202 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output);

-- ldr2_uxn_opcodes_h_l2915_c40_15b3
ldr2_uxn_opcodes_h_l2915_c40_15b3 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2915_c40_15b3_phase,
ldr2_uxn_opcodes_h_l2915_c40_15b3_ins,
ldr2_uxn_opcodes_h_l2915_c40_15b3_pc,
ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read,
ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read,
ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_2687
opc_result_MUX_uxn_opcodes_h_l2916_c7_2687 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output);

-- str1_uxn_opcodes_h_l2916_c40_7b41
str1_uxn_opcodes_h_l2916_c40_7b41 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2916_c40_7b41_phase,
str1_uxn_opcodes_h_l2916_c40_7b41_ins,
str1_uxn_opcodes_h_l2916_c40_7b41_pc,
str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read,
str1_uxn_opcodes_h_l2916_c40_7b41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f
opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output);

-- str2_uxn_opcodes_h_l2917_c40_67b8
str2_uxn_opcodes_h_l2917_c40_67b8 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2917_c40_67b8_phase,
str2_uxn_opcodes_h_l2917_c40_67b8_ins,
str2_uxn_opcodes_h_l2917_c40_67b8_pc,
str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read,
str2_uxn_opcodes_h_l2917_c40_67b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef
opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output);

-- lda_uxn_opcodes_h_l2918_c40_595c
lda_uxn_opcodes_h_l2918_c40_595c : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2918_c40_595c_phase,
lda_uxn_opcodes_h_l2918_c40_595c_ins,
lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read,
lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read,
lda_uxn_opcodes_h_l2918_c40_595c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4
opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output);

-- lda2_uxn_opcodes_h_l2919_c40_d5cd
lda2_uxn_opcodes_h_l2919_c40_d5cd : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2919_c40_d5cd_phase,
lda2_uxn_opcodes_h_l2919_c40_d5cd_ins,
lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read,
lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read,
lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d
opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output);

-- sta_uxn_opcodes_h_l2920_c40_70a3
sta_uxn_opcodes_h_l2920_c40_70a3 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2920_c40_70a3_phase,
sta_uxn_opcodes_h_l2920_c40_70a3_ins,
sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read,
sta_uxn_opcodes_h_l2920_c40_70a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_1098
opc_result_MUX_uxn_opcodes_h_l2921_c7_1098 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output);

-- sta2_uxn_opcodes_h_l2921_c40_55f3
sta2_uxn_opcodes_h_l2921_c40_55f3 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2921_c40_55f3_phase,
sta2_uxn_opcodes_h_l2921_c40_55f3_ins,
sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read,
sta2_uxn_opcodes_h_l2921_c40_55f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc
opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output);

-- dei_uxn_opcodes_h_l2922_c40_faeb
dei_uxn_opcodes_h_l2922_c40_faeb : entity work.dei_0CLK_11d1c5ea port map (
clk,
dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2922_c40_faeb_phase,
dei_uxn_opcodes_h_l2922_c40_faeb_ins,
dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons,
dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0,
dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1,
dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read,
dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read,
dei_uxn_opcodes_h_l2922_c40_faeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40
opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output);

-- dei2_uxn_opcodes_h_l2923_c40_62a4
dei2_uxn_opcodes_h_l2923_c40_62a4 : entity work.dei2_0CLK_898867fd port map (
clk,
dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2923_c40_62a4_phase,
dei2_uxn_opcodes_h_l2923_c40_62a4_ins,
dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons,
dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0,
dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1,
dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read,
dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read,
dei2_uxn_opcodes_h_l2923_c40_62a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_702e
opc_result_MUX_uxn_opcodes_h_l2924_c7_702e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output);

-- deo_uxn_opcodes_h_l2924_c40_e17d
deo_uxn_opcodes_h_l2924_c40_e17d : entity work.deo_0CLK_aeeaa7f2 port map (
clk,
deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2924_c40_e17d_phase,
deo_uxn_opcodes_h_l2924_c40_e17d_ins,
deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read,
deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read,
deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read,
deo_uxn_opcodes_h_l2924_c40_e17d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6
opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output);

-- deo2_uxn_opcodes_h_l2925_c40_1ee5
deo2_uxn_opcodes_h_l2925_c40_1ee5 : entity work.deo2_0CLK_ff5cce09 port map (
clk,
deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2925_c40_1ee5_phase,
deo2_uxn_opcodes_h_l2925_c40_1ee5_ins,
deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read,
deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read,
deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read,
deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b
opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output);

-- add_uxn_opcodes_h_l2926_c40_1cb5
add_uxn_opcodes_h_l2926_c40_1cb5 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE,
add_uxn_opcodes_h_l2926_c40_1cb5_phase,
add_uxn_opcodes_h_l2926_c40_1cb5_ins,
add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read,
add_uxn_opcodes_h_l2926_c40_1cb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_9323
opc_result_MUX_uxn_opcodes_h_l2927_c7_9323 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output);

-- add2_uxn_opcodes_h_l2927_c40_a2e7
add2_uxn_opcodes_h_l2927_c40_a2e7 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2927_c40_a2e7_phase,
add2_uxn_opcodes_h_l2927_c40_a2e7_ins,
add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read,
add2_uxn_opcodes_h_l2927_c40_a2e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_9642
opc_result_MUX_uxn_opcodes_h_l2928_c7_9642 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output);

-- sub1_uxn_opcodes_h_l2928_c40_0b51
sub1_uxn_opcodes_h_l2928_c40_0b51 : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2928_c40_0b51_phase,
sub1_uxn_opcodes_h_l2928_c40_0b51_ins,
sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read,
sub1_uxn_opcodes_h_l2928_c40_0b51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee
opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output);

-- sub2_uxn_opcodes_h_l2929_c40_a751
sub2_uxn_opcodes_h_l2929_c40_a751 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2929_c40_a751_phase,
sub2_uxn_opcodes_h_l2929_c40_a751_ins,
sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read,
sub2_uxn_opcodes_h_l2929_c40_a751_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9
opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output);

-- mul_uxn_opcodes_h_l2930_c40_b973
mul_uxn_opcodes_h_l2930_c40_b973 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2930_c40_b973_phase,
mul_uxn_opcodes_h_l2930_c40_b973_ins,
mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read,
mul_uxn_opcodes_h_l2930_c40_b973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_4111
opc_result_MUX_uxn_opcodes_h_l2931_c7_4111 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output);

-- mul2_uxn_opcodes_h_l2931_c40_daa1
mul2_uxn_opcodes_h_l2931_c40_daa1 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2931_c40_daa1_phase,
mul2_uxn_opcodes_h_l2931_c40_daa1_ins,
mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read,
mul2_uxn_opcodes_h_l2931_c40_daa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_0118
opc_result_MUX_uxn_opcodes_h_l2932_c7_0118 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output);

-- div_uxn_opcodes_h_l2932_c40_f7fd
div_uxn_opcodes_h_l2932_c40_f7fd : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE,
div_uxn_opcodes_h_l2932_c40_f7fd_phase,
div_uxn_opcodes_h_l2932_c40_f7fd_ins,
div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read,
div_uxn_opcodes_h_l2932_c40_f7fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8
opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output);

-- div2_uxn_opcodes_h_l2933_c40_67a3
div2_uxn_opcodes_h_l2933_c40_67a3 : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2933_c40_67a3_phase,
div2_uxn_opcodes_h_l2933_c40_67a3_ins,
div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read,
div2_uxn_opcodes_h_l2933_c40_67a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_b943
opc_result_MUX_uxn_opcodes_h_l2934_c7_b943 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output);

-- and_uxn_opcodes_h_l2934_c40_a109
and_uxn_opcodes_h_l2934_c40_a109 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE,
and_uxn_opcodes_h_l2934_c40_a109_phase,
and_uxn_opcodes_h_l2934_c40_a109_ins,
and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read,
and_uxn_opcodes_h_l2934_c40_a109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_3924
opc_result_MUX_uxn_opcodes_h_l2935_c7_3924 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output);

-- and2_uxn_opcodes_h_l2935_c40_1400
and2_uxn_opcodes_h_l2935_c40_1400 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2935_c40_1400_phase,
and2_uxn_opcodes_h_l2935_c40_1400_ins,
and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read,
and2_uxn_opcodes_h_l2935_c40_1400_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5
opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output);

-- ora_uxn_opcodes_h_l2936_c40_ff40
ora_uxn_opcodes_h_l2936_c40_ff40 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2936_c40_ff40_phase,
ora_uxn_opcodes_h_l2936_c40_ff40_ins,
ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read,
ora_uxn_opcodes_h_l2936_c40_ff40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33
opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output);

-- ora2_uxn_opcodes_h_l2937_c40_7f85
ora2_uxn_opcodes_h_l2937_c40_7f85 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2937_c40_7f85_phase,
ora2_uxn_opcodes_h_l2937_c40_7f85_ins,
ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read,
ora2_uxn_opcodes_h_l2937_c40_7f85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79
opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output);

-- eor_uxn_opcodes_h_l2938_c40_1f43
eor_uxn_opcodes_h_l2938_c40_1f43 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2938_c40_1f43_phase,
eor_uxn_opcodes_h_l2938_c40_1f43_ins,
eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read,
eor_uxn_opcodes_h_l2938_c40_1f43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50
opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output);

-- eor2_uxn_opcodes_h_l2939_c40_5a3e
eor2_uxn_opcodes_h_l2939_c40_5a3e : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2939_c40_5a3e_phase,
eor2_uxn_opcodes_h_l2939_c40_5a3e_ins,
eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read,
eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2
opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output);

-- sft_uxn_opcodes_h_l2940_c40_784f
sft_uxn_opcodes_h_l2940_c40_784f : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2940_c40_784f_phase,
sft_uxn_opcodes_h_l2940_c40_784f_ins,
sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read,
sft_uxn_opcodes_h_l2940_c40_784f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63
opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output);

-- sft2_uxn_opcodes_h_l2941_c40_4615
sft2_uxn_opcodes_h_l2941_c40_4615 : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2941_c40_4615_phase,
sft2_uxn_opcodes_h_l2941_c40_4615_ins,
sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read,
sft2_uxn_opcodes_h_l2941_c40_4615_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0
CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x,
CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output);

-- sp1_MUX_uxn_opcodes_h_l2946_c2_0929
sp1_MUX_uxn_opcodes_h_l2946_c2_0929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond,
sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue,
sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse,
sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output);

-- sp0_MUX_uxn_opcodes_h_l2946_c2_0929
sp0_MUX_uxn_opcodes_h_l2946_c2_0929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond,
sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue,
sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse,
sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output);

-- MUX_uxn_opcodes_h_l2952_c29_25fc
MUX_uxn_opcodes_h_l2952_c29_25fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c29_25fc_cond,
MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue,
MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse,
MUX_uxn_opcodes_h_l2952_c29_25fc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output);

-- MUX_uxn_opcodes_h_l2953_c20_7a08
MUX_uxn_opcodes_h_l2953_c20_7a08 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c20_7a08_cond,
MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue,
MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse,
MUX_uxn_opcodes_h_l2953_c20_7a08_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f
BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output);

-- stack_ram_update_uxn_opcodes_h_l2955_c24_2339
stack_ram_update_uxn_opcodes_h_l2955_c24_2339 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address,
stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value,
stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable,
stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 controller0_buttons,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 sp0,
 sp1,
 ins_a,
 opc,
 stack_index,
 is_wait,
 stack_address,
 previous_stack_read,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output,
 MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output,
 is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output,
 brk_uxn_opcodes_h_l2872_c48_ed44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output,
 jci_uxn_opcodes_h_l2873_c40_8894_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output,
 jmi_uxn_opcodes_h_l2874_c40_dd13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output,
 jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output,
 lit_uxn_opcodes_h_l2876_c40_c1d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output,
 lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output,
 lit_uxn_opcodes_h_l2878_c40_f6da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output,
 lit2_uxn_opcodes_h_l2879_c40_bc54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output,
 inc_uxn_opcodes_h_l2880_c40_1776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output,
 inc2_uxn_opcodes_h_l2881_c40_fe03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output,
 pop_uxn_opcodes_h_l2882_c40_fddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output,
 pop2_uxn_opcodes_h_l2883_c40_923e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output,
 nip_uxn_opcodes_h_l2884_c40_1bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output,
 nip2_uxn_opcodes_h_l2885_c40_2586_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output,
 swp_uxn_opcodes_h_l2886_c40_2f7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output,
 swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output,
 rot_uxn_opcodes_h_l2888_c40_7b06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output,
 rot2_uxn_opcodes_h_l2889_c40_76f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output,
 dup_uxn_opcodes_h_l2890_c40_8583_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output,
 dup2_uxn_opcodes_h_l2891_c40_278b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output,
 ovr_uxn_opcodes_h_l2892_c40_39ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output,
 ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output,
 equ_uxn_opcodes_h_l2894_c40_d703_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output,
 equ2_uxn_opcodes_h_l2895_c40_1414_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output,
 neq_uxn_opcodes_h_l2896_c40_84f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output,
 neq2_uxn_opcodes_h_l2897_c40_94ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output,
 gth_uxn_opcodes_h_l2898_c40_9b8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output,
 gth2_uxn_opcodes_h_l2899_c40_5875_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output,
 lth_uxn_opcodes_h_l2900_c40_52c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output,
 lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output,
 jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output,
 jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output,
 jcn_uxn_opcodes_h_l2904_c40_7b81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output,
 jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output,
 jsr_uxn_opcodes_h_l2906_c40_d309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output,
 jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output,
 sth_uxn_opcodes_h_l2908_c40_2809_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output,
 sth2_uxn_opcodes_h_l2909_c40_136e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output,
 ldz_uxn_opcodes_h_l2910_c40_01ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output,
 ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output,
 stz_uxn_opcodes_h_l2912_c40_aef5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output,
 stz2_uxn_opcodes_h_l2913_c40_5312_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output,
 ldr_uxn_opcodes_h_l2914_c40_1d46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output,
 ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output,
 str1_uxn_opcodes_h_l2916_c40_7b41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output,
 str2_uxn_opcodes_h_l2917_c40_67b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output,
 lda_uxn_opcodes_h_l2918_c40_595c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output,
 lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output,
 sta_uxn_opcodes_h_l2920_c40_70a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output,
 sta2_uxn_opcodes_h_l2921_c40_55f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output,
 dei_uxn_opcodes_h_l2922_c40_faeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output,
 dei2_uxn_opcodes_h_l2923_c40_62a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output,
 deo_uxn_opcodes_h_l2924_c40_e17d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output,
 deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output,
 add_uxn_opcodes_h_l2926_c40_1cb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output,
 add2_uxn_opcodes_h_l2927_c40_a2e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output,
 sub1_uxn_opcodes_h_l2928_c40_0b51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output,
 sub2_uxn_opcodes_h_l2929_c40_a751_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output,
 mul_uxn_opcodes_h_l2930_c40_b973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output,
 mul2_uxn_opcodes_h_l2931_c40_daa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output,
 div_uxn_opcodes_h_l2932_c40_f7fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output,
 div2_uxn_opcodes_h_l2933_c40_67a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output,
 and_uxn_opcodes_h_l2934_c40_a109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output,
 and2_uxn_opcodes_h_l2935_c40_1400_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output,
 ora_uxn_opcodes_h_l2936_c40_ff40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output,
 ora2_uxn_opcodes_h_l2937_c40_7f85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output,
 eor_uxn_opcodes_h_l2938_c40_1f43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output,
 eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output,
 sft_uxn_opcodes_h_l2940_c40_784f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output,
 sft2_uxn_opcodes_h_l2941_c40_4615_return_output,
 CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output,
 sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output,
 sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output,
 MUX_uxn_opcodes_h_l2952_c29_25fc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output,
 MUX_uxn_opcodes_h_l2953_c20_7a08_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output,
 stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left : unsigned(4 downto 0);
 variable VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_1ea8_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_ed44_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_ed44_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_8894_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_f6da_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_f6da_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_f6da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1776_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1776_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1776_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_fddb_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_fddb_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_fddb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_923e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_923e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_923e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_2586_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_2586_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_2586_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_7b06_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_7b06_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_7b06_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8583_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8583_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8583_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_278b_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_278b_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_278b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_d703_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_d703_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_d703_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1414_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1414_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1414_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_84f1_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_84f1_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_84f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_5875_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_5875_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_5875_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_52c8_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_52c8_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_52c8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_d309_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2809_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2809_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2809_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_136e_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_136e_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_136e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_aef5_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_aef5_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_aef5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_5312_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_5312_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_5312_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_7b41_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_67b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_595c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_70a3_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_70a3_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_70a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_faeb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_e17d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_1cb5_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_1cb5_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_1cb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_a751_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_a751_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_a751_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_b973_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_b973_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_b973_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_f7fd_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_f7fd_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_f7fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_67a3_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_67a3_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_67a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_a109_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_a109_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_a109_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_1400_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_1400_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_1400_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_ff40_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_ff40_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_ff40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1f43_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1f43_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1f43_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_784f_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_784f_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_784f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_4615_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_4615_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_4615_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2943_c2_0598 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_17f2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2947_c3_6989 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2949_c3_d7f8 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2343_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_00df_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_91d1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_94b4_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_8524_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_7687_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_e622_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_5f5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_bfbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_15f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_1456_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e474_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_faf7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_c315_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_9d4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_3ab5_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_ins_a : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(8 downto 0);
variable REG_VAR_previous_stack_read : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_ins_a := ins_a;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_stack_address := stack_address;
  REG_VAR_previous_stack_read := previous_stack_read;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right := to_unsigned(54, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right := to_unsigned(17, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right := to_unsigned(224, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right := to_unsigned(15, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right := to_unsigned(13, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right := to_unsigned(34, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right := to_unsigned(38, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right := to_unsigned(42, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right := to_unsigned(3, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right := to_unsigned(48, 8);
     VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right := to_unsigned(47, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right := to_unsigned(35, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue := to_unsigned(255, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right := to_unsigned(0, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right := to_unsigned(51, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right := to_unsigned(8, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right := to_unsigned(18, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right := to_unsigned(57, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right := to_unsigned(40, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue := to_unsigned(0, 1);

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
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2926_c40_1cb5_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2935_c40_1400_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2934_c40_a109_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2933_c40_67a3_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2932_c40_f7fd_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2891_c40_278b_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2890_c40_8583_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2938_c40_1f43_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1414_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2894_c40_d703_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2899_c40_5875_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2880_c40_1776_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2900_c40_52c8_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2930_c40_b973_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2896_c40_84f1_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2885_c40_2586_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2936_c40_ff40_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2883_c40_923e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2882_c40_fddb_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2888_c40_7b06_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2941_c40_4615_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2940_c40_784f_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2920_c40_70a3_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2909_c40_136e_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2908_c40_2809_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2913_c40_5312_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2912_c40_aef5_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2929_c40_a751_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2878_c40_f6da_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2926_c40_1cb5_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2935_c40_1400_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2934_c40_a109_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2872_c48_ed44_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2933_c40_67a3_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2932_c40_f7fd_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2891_c40_278b_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2890_c40_8583_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2938_c40_1f43_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2895_c40_1414_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2894_c40_d703_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2899_c40_5875_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2880_c40_1776_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2878_c40_f6da_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2900_c40_52c8_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2930_c40_b973_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2896_c40_84f1_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2885_c40_2586_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2936_c40_ff40_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2883_c40_923e_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2882_c40_fddb_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2888_c40_7b06_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2941_c40_4615_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2940_c40_784f_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2920_c40_70a3_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2909_c40_136e_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2908_c40_2809_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2913_c40_5312_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2912_c40_aef5_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2929_c40_a751_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0 := sp0;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0 := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1 := sp1;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1 := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse := sp1;
     -- uint8_4_0[uxn_opcodes_h_l2865_c10_1ea8] LATENCY=0
     VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_1ea8_return_output := uint8_4_0(
     VAR_ins);

     -- CONST_SR_6[uxn_opcodes_h_l2943_c16_b4e0] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output := CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output;

     -- brk[uxn_opcodes_h_l2872_c48_ed44] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2872_c48_ed44_phase <= VAR_brk_uxn_opcodes_h_l2872_c48_ed44_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2872_c48_ed44_return_output := brk_uxn_opcodes_h_l2872_c48_ed44_return_output;

     -- Submodule level 1
     VAR_stack_index_uxn_opcodes_h_l2943_c2_0598 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_b4e0_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue := VAR_brk_uxn_opcodes_h_l2872_c48_ed44_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left := VAR_uint8_4_0_uxn_opcodes_h_l2865_c10_1ea8_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left := VAR_stack_index_uxn_opcodes_h_l2943_c2_0598;
     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c10_24c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c10_24c5_return_output;
     -- MUX[uxn_opcodes_h_l2865_c10_2ee2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c10_2ee2_cond <= VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_cond;
     MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iftrue;
     MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output := MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right := VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output;
     REG_VAR_ins_a := VAR_MUX_uxn_opcodes_h_l2865_c10_2ee2_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l2866_c8_bc07] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_left;
     BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output := BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;

     -- Submodule level 4
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     REG_VAR_opc := VAR_BIN_OP_AND_uxn_opcodes_h_l2866_c8_bc07_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_2180] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_cd9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_0d61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_fd34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_d50b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_0190] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_8f3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_4478] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_ae75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_d9ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_e946] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_6fed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_f743] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_b428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_080f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_769a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_a1e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_d0eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_c204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_0a90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_f76d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_1b43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_7b09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_2814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_8741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_8044] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_4311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_397f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_f98e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_bca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_d118] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_c263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_8880] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_b1c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_013d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_6225] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_766e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_2be1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_83a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8dc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_176b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_b624] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_4752] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_da21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_5ba7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_fe1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_d643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_b42d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_fd78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_118d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_ba00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_18ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_731b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_ac88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_e9d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_12dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_a0be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_cbc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_0911] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_9291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_b70e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_2f4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_5d8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_fd4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_1071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_89db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_849a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_0190_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_7b09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_fe1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_18ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_da21_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_397f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_8880_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_1071_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_f98e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_013d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_8f3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_ae75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_d118_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c204_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_0d61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_cbc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_731b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_b1c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_4478_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_2180_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_f76d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_d0eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_b624_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_6225_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8741_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_9291_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_ac88_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_ba00_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_e946_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_080f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8d69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_8044_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_176b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_2be1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_b42d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_e9d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2f4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_fd78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_766e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4311_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_bca6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8dc0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d049_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_4752_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_12dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_89db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_fd4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_d50b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_a1e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_118d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b43_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_769a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5d8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b70e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2814_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fd34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_c263_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0054_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d9ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_0a90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a0be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_0911_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_b428_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_5ba7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_cd9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_6fed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f743_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_849a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_d643_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_83a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_0555] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2872_c2_3434] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_cond;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output := is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0555_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_4214] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_f0e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output;
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_4214_return_output;
     -- jci[uxn_opcodes_h_l2873_c40_8894] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2873_c40_8894_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2873_c40_8894_phase <= VAR_jci_uxn_opcodes_h_l2873_c40_8894_phase;
     jci_uxn_opcodes_h_l2873_c40_8894_pc <= VAR_jci_uxn_opcodes_h_l2873_c40_8894_pc;
     jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_stack_read;
     jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2873_c40_8894_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2873_c40_8894_return_output := jci_uxn_opcodes_h_l2873_c40_8894_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_9d6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f2d9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output;
     VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9d6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue := VAR_jci_uxn_opcodes_h_l2873_c40_8894_return_output;
     -- jmi[uxn_opcodes_h_l2874_c40_dd13] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2874_c40_dd13_phase <= VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_phase;
     jmi_uxn_opcodes_h_l2874_c40_dd13_pc <= VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_pc;
     jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_return_output := jmi_uxn_opcodes_h_l2874_c40_dd13_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_618e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_abe3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output;
     VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_618e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue := VAR_jmi_uxn_opcodes_h_l2874_c40_dd13_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_5b19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_0ddc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output;

     -- jsi[uxn_opcodes_h_l2875_c40_3e5f] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2875_c40_3e5f_phase <= VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_phase;
     jsi_uxn_opcodes_h_l2875_c40_3e5f_pc <= VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_pc;
     jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output := jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output;
     VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0ddc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue := VAR_jsi_uxn_opcodes_h_l2875_c40_3e5f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_960f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output;

     -- lit[uxn_opcodes_h_l2876_c40_c1d3] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2876_c40_c1d3_phase <= VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_phase;
     lit_uxn_opcodes_h_l2876_c40_c1d3_pc <= VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_pc;
     lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_return_output := lit_uxn_opcodes_h_l2876_c40_c1d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_a3c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output;
     VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_960f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue := VAR_lit_uxn_opcodes_h_l2876_c40_c1d3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_fc59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output;

     -- lit2[uxn_opcodes_h_l2877_c40_5ee1] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2877_c40_5ee1_phase <= VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_phase;
     lit2_uxn_opcodes_h_l2877_c40_5ee1_pc <= VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_pc;
     lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output := lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2f86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output;
     VAR_lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue := VAR_lit2_uxn_opcodes_h_l2877_c40_5ee1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_dee5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output;

     -- lit[uxn_opcodes_h_l2878_c40_f6da] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2878_c40_f6da_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2878_c40_f6da_phase <= VAR_lit_uxn_opcodes_h_l2878_c40_f6da_phase;
     lit_uxn_opcodes_h_l2878_c40_f6da_pc <= VAR_lit_uxn_opcodes_h_l2878_c40_f6da_pc;
     lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2878_c40_f6da_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2878_c40_f6da_return_output := lit_uxn_opcodes_h_l2878_c40_f6da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_5f30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output;
     VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5f30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue := VAR_lit_uxn_opcodes_h_l2878_c40_f6da_return_output;
     -- lit2[uxn_opcodes_h_l2879_c40_bc54] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2879_c40_bc54_phase <= VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_phase;
     lit2_uxn_opcodes_h_l2879_c40_bc54_pc <= VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_pc;
     lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_return_output := lit2_uxn_opcodes_h_l2879_c40_bc54_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_4670] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3810] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_4670_return_output;
     VAR_inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3810_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue := VAR_lit2_uxn_opcodes_h_l2879_c40_bc54_return_output;
     -- inc[uxn_opcodes_h_l2880_c40_1776] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2880_c40_1776_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2880_c40_1776_phase <= VAR_inc_uxn_opcodes_h_l2880_c40_1776_phase;
     inc_uxn_opcodes_h_l2880_c40_1776_ins <= VAR_inc_uxn_opcodes_h_l2880_c40_1776_ins;
     inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2880_c40_1776_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2880_c40_1776_return_output := inc_uxn_opcodes_h_l2880_c40_1776_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_26fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_1ce2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output;
     VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_1ce2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue := VAR_inc_uxn_opcodes_h_l2880_c40_1776_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_1d04] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_f31b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output;

     -- inc2[uxn_opcodes_h_l2881_c40_fe03] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2881_c40_fe03_phase <= VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_phase;
     inc2_uxn_opcodes_h_l2881_c40_fe03_ins <= VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_ins;
     inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_return_output := inc2_uxn_opcodes_h_l2881_c40_fe03_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output;
     VAR_pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f31b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue := VAR_inc2_uxn_opcodes_h_l2881_c40_fe03_return_output;
     -- pop[uxn_opcodes_h_l2882_c40_fddb] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2882_c40_fddb_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2882_c40_fddb_phase <= VAR_pop_uxn_opcodes_h_l2882_c40_fddb_phase;
     pop_uxn_opcodes_h_l2882_c40_fddb_ins <= VAR_pop_uxn_opcodes_h_l2882_c40_fddb_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2882_c40_fddb_return_output := pop_uxn_opcodes_h_l2882_c40_fddb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_9c56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_5fde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output;
     VAR_pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_5fde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue := VAR_pop_uxn_opcodes_h_l2882_c40_fddb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_c831] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_5351] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output;

     -- pop2[uxn_opcodes_h_l2883_c40_923e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2883_c40_923e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2883_c40_923e_phase <= VAR_pop2_uxn_opcodes_h_l2883_c40_923e_phase;
     pop2_uxn_opcodes_h_l2883_c40_923e_ins <= VAR_pop2_uxn_opcodes_h_l2883_c40_923e_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2883_c40_923e_return_output := pop2_uxn_opcodes_h_l2883_c40_923e_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c831_return_output;
     VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_5351_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue := VAR_pop2_uxn_opcodes_h_l2883_c40_923e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_5ac6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output;

     -- nip[uxn_opcodes_h_l2884_c40_1bb7] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2884_c40_1bb7_phase <= VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_phase;
     nip_uxn_opcodes_h_l2884_c40_1bb7_ins <= VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_ins;
     nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_return_output := nip_uxn_opcodes_h_l2884_c40_1bb7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_0db4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output;
     VAR_nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_0db4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue := VAR_nip_uxn_opcodes_h_l2884_c40_1bb7_return_output;
     -- nip2[uxn_opcodes_h_l2885_c40_2586] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2885_c40_2586_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2885_c40_2586_phase <= VAR_nip2_uxn_opcodes_h_l2885_c40_2586_phase;
     nip2_uxn_opcodes_h_l2885_c40_2586_ins <= VAR_nip2_uxn_opcodes_h_l2885_c40_2586_ins;
     nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2885_c40_2586_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2885_c40_2586_return_output := nip2_uxn_opcodes_h_l2885_c40_2586_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_9d84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_f6da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output;
     VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_9d84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue := VAR_nip2_uxn_opcodes_h_l2885_c40_2586_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_d7bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output;

     -- swp[uxn_opcodes_h_l2886_c40_2f7c] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2886_c40_2f7c_phase <= VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_phase;
     swp_uxn_opcodes_h_l2886_c40_2f7c_ins <= VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_ins;
     swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_return_output := swp_uxn_opcodes_h_l2886_c40_2f7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3718] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3718_return_output;
     VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_d7bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue := VAR_swp_uxn_opcodes_h_l2886_c40_2f7c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_5d02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_8e3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output;

     -- swp2[uxn_opcodes_h_l2887_c40_f0d6] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2887_c40_f0d6_phase <= VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_phase;
     swp2_uxn_opcodes_h_l2887_c40_f0d6_ins <= VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_ins;
     swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output := swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output;
     VAR_rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_8e3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue := VAR_swp2_uxn_opcodes_h_l2887_c40_f0d6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_ba06] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output;

     -- rot[uxn_opcodes_h_l2888_c40_7b06] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2888_c40_7b06_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2888_c40_7b06_phase <= VAR_rot_uxn_opcodes_h_l2888_c40_7b06_phase;
     rot_uxn_opcodes_h_l2888_c40_7b06_ins <= VAR_rot_uxn_opcodes_h_l2888_c40_7b06_ins;
     rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2888_c40_7b06_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2888_c40_7b06_return_output := rot_uxn_opcodes_h_l2888_c40_7b06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2f7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output;
     VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ba06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue := VAR_rot_uxn_opcodes_h_l2888_c40_7b06_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_71d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_11c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output;

     -- rot2[uxn_opcodes_h_l2889_c40_76f4] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2889_c40_76f4_phase <= VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_phase;
     rot2_uxn_opcodes_h_l2889_c40_76f4_ins <= VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_ins;
     rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_return_output := rot2_uxn_opcodes_h_l2889_c40_76f4_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output;
     VAR_dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_71d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue := VAR_rot2_uxn_opcodes_h_l2889_c40_76f4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_cf2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output;

     -- dup[uxn_opcodes_h_l2890_c40_8583] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2890_c40_8583_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2890_c40_8583_phase <= VAR_dup_uxn_opcodes_h_l2890_c40_8583_phase;
     dup_uxn_opcodes_h_l2890_c40_8583_ins <= VAR_dup_uxn_opcodes_h_l2890_c40_8583_ins;
     dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2890_c40_8583_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2890_c40_8583_return_output := dup_uxn_opcodes_h_l2890_c40_8583_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_cff9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output;
     VAR_dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_cff9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue := VAR_dup_uxn_opcodes_h_l2890_c40_8583_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_eb4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_1bb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output;

     -- dup2[uxn_opcodes_h_l2891_c40_278b] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2891_c40_278b_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2891_c40_278b_phase <= VAR_dup2_uxn_opcodes_h_l2891_c40_278b_phase;
     dup2_uxn_opcodes_h_l2891_c40_278b_ins <= VAR_dup2_uxn_opcodes_h_l2891_c40_278b_ins;
     dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2891_c40_278b_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2891_c40_278b_return_output := dup2_uxn_opcodes_h_l2891_c40_278b_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output;
     VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_eb4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue := VAR_dup2_uxn_opcodes_h_l2891_c40_278b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_dcd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_0740] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output;

     -- ovr[uxn_opcodes_h_l2892_c40_39ab] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2892_c40_39ab_phase <= VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_phase;
     ovr_uxn_opcodes_h_l2892_c40_39ab_ins <= VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_ins;
     ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_return_output := ovr_uxn_opcodes_h_l2892_c40_39ab_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0740_return_output;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_dcd3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue := VAR_ovr_uxn_opcodes_h_l2892_c40_39ab_return_output;
     -- ovr2[uxn_opcodes_h_l2893_c40_aeae] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2893_c40_aeae_phase <= VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_phase;
     ovr2_uxn_opcodes_h_l2893_c40_aeae_ins <= VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_ins;
     ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output := ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_a778] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_5706] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_a778_return_output;
     VAR_equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5706_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue := VAR_ovr2_uxn_opcodes_h_l2893_c40_aeae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_f1bc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_1b2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output;

     -- equ[uxn_opcodes_h_l2894_c40_d703] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2894_c40_d703_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2894_c40_d703_phase <= VAR_equ_uxn_opcodes_h_l2894_c40_d703_phase;
     equ_uxn_opcodes_h_l2894_c40_d703_ins <= VAR_equ_uxn_opcodes_h_l2894_c40_d703_ins;
     equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2894_c40_d703_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2894_c40_d703_return_output := equ_uxn_opcodes_h_l2894_c40_d703_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_1b2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue := VAR_equ_uxn_opcodes_h_l2894_c40_d703_return_output;
     -- equ2[uxn_opcodes_h_l2895_c40_1414] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2895_c40_1414_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2895_c40_1414_phase <= VAR_equ2_uxn_opcodes_h_l2895_c40_1414_phase;
     equ2_uxn_opcodes_h_l2895_c40_1414_ins <= VAR_equ2_uxn_opcodes_h_l2895_c40_1414_ins;
     equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2895_c40_1414_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2895_c40_1414_return_output := equ2_uxn_opcodes_h_l2895_c40_1414_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_be46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_9548] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_9548_return_output;
     VAR_neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_be46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue := VAR_equ2_uxn_opcodes_h_l2895_c40_1414_return_output;
     -- neq[uxn_opcodes_h_l2896_c40_84f1] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2896_c40_84f1_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2896_c40_84f1_phase <= VAR_neq_uxn_opcodes_h_l2896_c40_84f1_phase;
     neq_uxn_opcodes_h_l2896_c40_84f1_ins <= VAR_neq_uxn_opcodes_h_l2896_c40_84f1_ins;
     neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2896_c40_84f1_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2896_c40_84f1_return_output := neq_uxn_opcodes_h_l2896_c40_84f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_5f88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_f9b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output;
     VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_5f88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue := VAR_neq_uxn_opcodes_h_l2896_c40_84f1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_1a5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output;

     -- neq2[uxn_opcodes_h_l2897_c40_94ff] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2897_c40_94ff_phase <= VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_phase;
     neq2_uxn_opcodes_h_l2897_c40_94ff_ins <= VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_ins;
     neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_return_output := neq2_uxn_opcodes_h_l2897_c40_94ff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_2a14] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output;
     VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1a5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue := VAR_neq2_uxn_opcodes_h_l2897_c40_94ff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_e230] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output;

     -- gth[uxn_opcodes_h_l2898_c40_9b8e] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2898_c40_9b8e_phase <= VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_phase;
     gth_uxn_opcodes_h_l2898_c40_9b8e_ins <= VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_ins;
     gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_return_output := gth_uxn_opcodes_h_l2898_c40_9b8e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_e3e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e230_return_output;
     VAR_gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue := VAR_gth_uxn_opcodes_h_l2898_c40_9b8e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_a49e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output;

     -- gth2[uxn_opcodes_h_l2899_c40_5875] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2899_c40_5875_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2899_c40_5875_phase <= VAR_gth2_uxn_opcodes_h_l2899_c40_5875_phase;
     gth2_uxn_opcodes_h_l2899_c40_5875_ins <= VAR_gth2_uxn_opcodes_h_l2899_c40_5875_ins;
     gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2899_c40_5875_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2899_c40_5875_return_output := gth2_uxn_opcodes_h_l2899_c40_5875_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_9e35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output;
     VAR_lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_9e35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue := VAR_gth2_uxn_opcodes_h_l2899_c40_5875_return_output;
     -- lth[uxn_opcodes_h_l2900_c40_52c8] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2900_c40_52c8_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2900_c40_52c8_phase <= VAR_lth_uxn_opcodes_h_l2900_c40_52c8_phase;
     lth_uxn_opcodes_h_l2900_c40_52c8_ins <= VAR_lth_uxn_opcodes_h_l2900_c40_52c8_ins;
     lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2900_c40_52c8_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2900_c40_52c8_return_output := lth_uxn_opcodes_h_l2900_c40_52c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_6691] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_b9ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output;
     VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_6691_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue := VAR_lth_uxn_opcodes_h_l2900_c40_52c8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_712e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output;

     -- lth2[uxn_opcodes_h_l2901_c40_fc3f] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2901_c40_fc3f_phase <= VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_phase;
     lth2_uxn_opcodes_h_l2901_c40_fc3f_ins <= VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_ins;
     lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output := lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_8127] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_8127_return_output;
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_712e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue := VAR_lth2_uxn_opcodes_h_l2901_c40_fc3f_return_output;
     -- jmp[uxn_opcodes_h_l2902_c40_b1e3] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2902_c40_b1e3_phase <= VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_phase;
     jmp_uxn_opcodes_h_l2902_c40_b1e3_ins <= VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_ins;
     jmp_uxn_opcodes_h_l2902_c40_b1e3_pc <= VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_pc;
     jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output := jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_8ed3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_8be0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_8ed3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue := VAR_jmp_uxn_opcodes_h_l2902_c40_b1e3_return_output;
     -- jmp2[uxn_opcodes_h_l2903_c40_b0b3] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase <= VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_phase;
     jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins <= VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_ins;
     jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output := jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0e7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_328a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output;
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_328a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue := VAR_jmp2_uxn_opcodes_h_l2903_c40_b0b3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_548a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a3e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output;

     -- jcn[uxn_opcodes_h_l2904_c40_7b81] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2904_c40_7b81_phase <= VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_phase;
     jcn_uxn_opcodes_h_l2904_c40_7b81_ins <= VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_ins;
     jcn_uxn_opcodes_h_l2904_c40_7b81_pc <= VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_pc;
     jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_return_output := jcn_uxn_opcodes_h_l2904_c40_7b81_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_548a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue := VAR_jcn_uxn_opcodes_h_l2904_c40_7b81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_8c9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_bb70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output;

     -- jcn2[uxn_opcodes_h_l2905_c40_88a4] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2905_c40_88a4_phase <= VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_phase;
     jcn2_uxn_opcodes_h_l2905_c40_88a4_ins <= VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_ins;
     jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output := jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output;
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_bb70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue := VAR_jcn2_uxn_opcodes_h_l2905_c40_88a4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_713d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output;

     -- jsr[uxn_opcodes_h_l2906_c40_d309] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2906_c40_d309_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2906_c40_d309_phase <= VAR_jsr_uxn_opcodes_h_l2906_c40_d309_phase;
     jsr_uxn_opcodes_h_l2906_c40_d309_ins <= VAR_jsr_uxn_opcodes_h_l2906_c40_d309_ins;
     jsr_uxn_opcodes_h_l2906_c40_d309_pc <= VAR_jsr_uxn_opcodes_h_l2906_c40_d309_pc;
     jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2906_c40_d309_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2906_c40_d309_return_output := jsr_uxn_opcodes_h_l2906_c40_d309_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_64e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_713d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue := VAR_jsr_uxn_opcodes_h_l2906_c40_d309_return_output;
     -- jsr2[uxn_opcodes_h_l2907_c40_a02e] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2907_c40_a02e_phase <= VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_phase;
     jsr2_uxn_opcodes_h_l2907_c40_a02e_ins <= VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_ins;
     jsr2_uxn_opcodes_h_l2907_c40_a02e_pc <= VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_pc;
     jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output := jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_e1ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_9099] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9099_return_output;
     VAR_sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e1ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue := VAR_jsr2_uxn_opcodes_h_l2907_c40_a02e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_3f93] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output;

     -- sth[uxn_opcodes_h_l2908_c40_2809] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2908_c40_2809_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2908_c40_2809_phase <= VAR_sth_uxn_opcodes_h_l2908_c40_2809_phase;
     sth_uxn_opcodes_h_l2908_c40_2809_ins <= VAR_sth_uxn_opcodes_h_l2908_c40_2809_ins;
     sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2908_c40_2809_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2908_c40_2809_return_output := sth_uxn_opcodes_h_l2908_c40_2809_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_76a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output;
     VAR_sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_76a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue := VAR_sth_uxn_opcodes_h_l2908_c40_2809_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_22f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_1d38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output;

     -- sth2[uxn_opcodes_h_l2909_c40_136e] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2909_c40_136e_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2909_c40_136e_phase <= VAR_sth2_uxn_opcodes_h_l2909_c40_136e_phase;
     sth2_uxn_opcodes_h_l2909_c40_136e_ins <= VAR_sth2_uxn_opcodes_h_l2909_c40_136e_ins;
     sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2909_c40_136e_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2909_c40_136e_return_output := sth2_uxn_opcodes_h_l2909_c40_136e_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output;
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_22f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue := VAR_sth2_uxn_opcodes_h_l2909_c40_136e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_2025] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output;

     -- ldz[uxn_opcodes_h_l2910_c40_01ac] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2910_c40_01ac_phase <= VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_phase;
     ldz_uxn_opcodes_h_l2910_c40_01ac_ins <= VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_ins;
     ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_stack_read;
     ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_return_output := ldz_uxn_opcodes_h_l2910_c40_01ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_0e70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2025_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue := VAR_ldz_uxn_opcodes_h_l2910_c40_01ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_95ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output;

     -- ldz2[uxn_opcodes_h_l2911_c40_77b8] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2911_c40_77b8_phase <= VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_phase;
     ldz2_uxn_opcodes_h_l2911_c40_77b8_ins <= VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_ins;
     ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_stack_read;
     ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output := ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_b23e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output;
     VAR_stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_95ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue := VAR_ldz2_uxn_opcodes_h_l2911_c40_77b8_return_output;
     -- stz[uxn_opcodes_h_l2912_c40_aef5] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2912_c40_aef5_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2912_c40_aef5_phase <= VAR_stz_uxn_opcodes_h_l2912_c40_aef5_phase;
     stz_uxn_opcodes_h_l2912_c40_aef5_ins <= VAR_stz_uxn_opcodes_h_l2912_c40_aef5_ins;
     stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2912_c40_aef5_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2912_c40_aef5_return_output := stz_uxn_opcodes_h_l2912_c40_aef5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_e46a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_2609] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_2609_return_output;
     VAR_stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e46a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue := VAR_stz_uxn_opcodes_h_l2912_c40_aef5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_ad40] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output;

     -- stz2[uxn_opcodes_h_l2913_c40_5312] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2913_c40_5312_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2913_c40_5312_phase <= VAR_stz2_uxn_opcodes_h_l2913_c40_5312_phase;
     stz2_uxn_opcodes_h_l2913_c40_5312_ins <= VAR_stz2_uxn_opcodes_h_l2913_c40_5312_ins;
     stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2913_c40_5312_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2913_c40_5312_return_output := stz2_uxn_opcodes_h_l2913_c40_5312_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_3202] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_3202_return_output;
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_ad40_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue := VAR_stz2_uxn_opcodes_h_l2913_c40_5312_return_output;
     -- ldr[uxn_opcodes_h_l2914_c40_1d46] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2914_c40_1d46_phase <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_phase;
     ldr_uxn_opcodes_h_l2914_c40_1d46_ins <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_ins;
     ldr_uxn_opcodes_h_l2914_c40_1d46_pc <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_pc;
     ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_stack_read;
     ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_return_output := ldr_uxn_opcodes_h_l2914_c40_1d46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_2687] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_5253] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_2687_return_output;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_5253_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue := VAR_ldr_uxn_opcodes_h_l2914_c40_1d46_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_a6db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_f58f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output;

     -- ldr2[uxn_opcodes_h_l2915_c40_15b3] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2915_c40_15b3_phase <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_phase;
     ldr2_uxn_opcodes_h_l2915_c40_15b3_ins <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_ins;
     ldr2_uxn_opcodes_h_l2915_c40_15b3_pc <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_pc;
     ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_stack_read;
     ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output := ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output;
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_a6db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue := VAR_ldr2_uxn_opcodes_h_l2915_c40_15b3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_e478] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_26ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output;

     -- str1[uxn_opcodes_h_l2916_c40_7b41] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2916_c40_7b41_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2916_c40_7b41_phase <= VAR_str1_uxn_opcodes_h_l2916_c40_7b41_phase;
     str1_uxn_opcodes_h_l2916_c40_7b41_ins <= VAR_str1_uxn_opcodes_h_l2916_c40_7b41_ins;
     str1_uxn_opcodes_h_l2916_c40_7b41_pc <= VAR_str1_uxn_opcodes_h_l2916_c40_7b41_pc;
     str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2916_c40_7b41_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2916_c40_7b41_return_output := str1_uxn_opcodes_h_l2916_c40_7b41_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output;
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_e478_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue := VAR_str1_uxn_opcodes_h_l2916_c40_7b41_return_output;
     -- str2[uxn_opcodes_h_l2917_c40_67b8] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2917_c40_67b8_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2917_c40_67b8_phase <= VAR_str2_uxn_opcodes_h_l2917_c40_67b8_phase;
     str2_uxn_opcodes_h_l2917_c40_67b8_ins <= VAR_str2_uxn_opcodes_h_l2917_c40_67b8_ins;
     str2_uxn_opcodes_h_l2917_c40_67b8_pc <= VAR_str2_uxn_opcodes_h_l2917_c40_67b8_pc;
     str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2917_c40_67b8_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2917_c40_67b8_return_output := str2_uxn_opcodes_h_l2917_c40_67b8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_71db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_b7d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output;
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_71db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue := VAR_str2_uxn_opcodes_h_l2917_c40_67b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_e44d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_56b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output;

     -- lda[uxn_opcodes_h_l2918_c40_595c] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2918_c40_595c_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2918_c40_595c_phase <= VAR_lda_uxn_opcodes_h_l2918_c40_595c_phase;
     lda_uxn_opcodes_h_l2918_c40_595c_ins <= VAR_lda_uxn_opcodes_h_l2918_c40_595c_ins;
     lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_stack_read;
     lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2918_c40_595c_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2918_c40_595c_return_output := lda_uxn_opcodes_h_l2918_c40_595c_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output;
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_56b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue := VAR_lda_uxn_opcodes_h_l2918_c40_595c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_1098] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output;

     -- lda2[uxn_opcodes_h_l2919_c40_d5cd] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2919_c40_d5cd_phase <= VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_phase;
     lda2_uxn_opcodes_h_l2919_c40_d5cd_ins <= VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_ins;
     lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_stack_read;
     lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output := lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_4439] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_1098_return_output;
     VAR_sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_4439_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue := VAR_lda2_uxn_opcodes_h_l2919_c40_d5cd_return_output;
     -- sta[uxn_opcodes_h_l2920_c40_70a3] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2920_c40_70a3_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2920_c40_70a3_phase <= VAR_sta_uxn_opcodes_h_l2920_c40_70a3_phase;
     sta_uxn_opcodes_h_l2920_c40_70a3_ins <= VAR_sta_uxn_opcodes_h_l2920_c40_70a3_ins;
     sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2920_c40_70a3_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2920_c40_70a3_return_output := sta_uxn_opcodes_h_l2920_c40_70a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_c2cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_6e3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output;
     VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6e3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue := VAR_sta_uxn_opcodes_h_l2920_c40_70a3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_7d40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_ed86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output;

     -- sta2[uxn_opcodes_h_l2921_c40_55f3] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2921_c40_55f3_phase <= VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_phase;
     sta2_uxn_opcodes_h_l2921_c40_55f3_ins <= VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_ins;
     sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_return_output := sta2_uxn_opcodes_h_l2921_c40_55f3_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output;
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ed86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue := VAR_sta2_uxn_opcodes_h_l2921_c40_55f3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_702e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_7980] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output;

     -- dei[uxn_opcodes_h_l2922_c40_faeb] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2922_c40_faeb_phase <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_phase;
     dei_uxn_opcodes_h_l2922_c40_faeb_ins <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_ins;
     dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_controller0_buttons;
     dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0 <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr0;
     dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1 <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_stack_ptr1;
     dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_stack_read;
     dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2922_c40_faeb_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2922_c40_faeb_return_output := dei_uxn_opcodes_h_l2922_c40_faeb_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_702e_return_output;
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_7980_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue := VAR_dei_uxn_opcodes_h_l2922_c40_faeb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_ba6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output;

     -- dei2[uxn_opcodes_h_l2923_c40_62a4] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2923_c40_62a4_phase <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_phase;
     dei2_uxn_opcodes_h_l2923_c40_62a4_ins <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_ins;
     dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_controller0_buttons;
     dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0 <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr0;
     dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1 <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_stack_ptr1;
     dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_stack_read;
     dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_return_output := dei2_uxn_opcodes_h_l2923_c40_62a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_a3e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output;
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_ba6b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue := VAR_dei2_uxn_opcodes_h_l2923_c40_62a4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_d6c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output;

     -- deo[uxn_opcodes_h_l2924_c40_e17d] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2924_c40_e17d_phase <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_phase;
     deo_uxn_opcodes_h_l2924_c40_e17d_ins <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_ins;
     deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_stack_read;
     deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_device_ram_read;
     deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_e17d_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2924_c40_e17d_return_output := deo_uxn_opcodes_h_l2924_c40_e17d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_d37b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output;
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_d6c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue := VAR_deo_uxn_opcodes_h_l2924_c40_e17d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_9323] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output;

     -- deo2[uxn_opcodes_h_l2925_c40_1ee5] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2925_c40_1ee5_phase <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_phase;
     deo2_uxn_opcodes_h_l2925_c40_1ee5_ins <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_ins;
     deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_stack_read;
     deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output := deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_6fa9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_9323_return_output;
     VAR_add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6fa9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue := VAR_deo2_uxn_opcodes_h_l2925_c40_1ee5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_b82e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_9642] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output;

     -- add[uxn_opcodes_h_l2926_c40_1cb5] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2926_c40_1cb5_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2926_c40_1cb5_phase <= VAR_add_uxn_opcodes_h_l2926_c40_1cb5_phase;
     add_uxn_opcodes_h_l2926_c40_1cb5_ins <= VAR_add_uxn_opcodes_h_l2926_c40_1cb5_ins;
     add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read <= VAR_add_uxn_opcodes_h_l2926_c40_1cb5_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2926_c40_1cb5_return_output := add_uxn_opcodes_h_l2926_c40_1cb5_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9642_return_output;
     VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_b82e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue := VAR_add_uxn_opcodes_h_l2926_c40_1cb5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_9816] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_20ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output;

     -- add2[uxn_opcodes_h_l2927_c40_a2e7] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2927_c40_a2e7_phase <= VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_phase;
     add2_uxn_opcodes_h_l2927_c40_a2e7_ins <= VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_ins;
     add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_return_output := add2_uxn_opcodes_h_l2927_c40_a2e7_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output;
     VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9816_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue := VAR_add2_uxn_opcodes_h_l2927_c40_a2e7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_b04b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_73a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output;

     -- sub1[uxn_opcodes_h_l2928_c40_0b51] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2928_c40_0b51_phase <= VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_phase;
     sub1_uxn_opcodes_h_l2928_c40_0b51_ins <= VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_ins;
     sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_return_output := sub1_uxn_opcodes_h_l2928_c40_0b51_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output;
     VAR_sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_b04b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue := VAR_sub1_uxn_opcodes_h_l2928_c40_0b51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_4111] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_10ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output;

     -- sub2[uxn_opcodes_h_l2929_c40_a751] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2929_c40_a751_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2929_c40_a751_phase <= VAR_sub2_uxn_opcodes_h_l2929_c40_a751_phase;
     sub2_uxn_opcodes_h_l2929_c40_a751_ins <= VAR_sub2_uxn_opcodes_h_l2929_c40_a751_ins;
     sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2929_c40_a751_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2929_c40_a751_return_output := sub2_uxn_opcodes_h_l2929_c40_a751_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_4111_return_output;
     VAR_mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_10ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue := VAR_sub2_uxn_opcodes_h_l2929_c40_a751_return_output;
     -- mul[uxn_opcodes_h_l2930_c40_b973] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2930_c40_b973_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2930_c40_b973_phase <= VAR_mul_uxn_opcodes_h_l2930_c40_b973_phase;
     mul_uxn_opcodes_h_l2930_c40_b973_ins <= VAR_mul_uxn_opcodes_h_l2930_c40_b973_ins;
     mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2930_c40_b973_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2930_c40_b973_return_output := mul_uxn_opcodes_h_l2930_c40_b973_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_9dd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_0118] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0118_return_output;
     VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_9dd4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue := VAR_mul_uxn_opcodes_h_l2930_c40_b973_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_600b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_35f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output;

     -- mul2[uxn_opcodes_h_l2931_c40_daa1] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2931_c40_daa1_phase <= VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_phase;
     mul2_uxn_opcodes_h_l2931_c40_daa1_ins <= VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_ins;
     mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_return_output := mul2_uxn_opcodes_h_l2931_c40_daa1_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output;
     VAR_div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_600b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue := VAR_mul2_uxn_opcodes_h_l2931_c40_daa1_return_output;
     -- div[uxn_opcodes_h_l2932_c40_f7fd] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2932_c40_f7fd_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2932_c40_f7fd_phase <= VAR_div_uxn_opcodes_h_l2932_c40_f7fd_phase;
     div_uxn_opcodes_h_l2932_c40_f7fd_ins <= VAR_div_uxn_opcodes_h_l2932_c40_f7fd_ins;
     div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read <= VAR_div_uxn_opcodes_h_l2932_c40_f7fd_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2932_c40_f7fd_return_output := div_uxn_opcodes_h_l2932_c40_f7fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_adcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_b943] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_b943_return_output;
     VAR_div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_adcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue := VAR_div_uxn_opcodes_h_l2932_c40_f7fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_8aca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_3924] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output;

     -- div2[uxn_opcodes_h_l2933_c40_67a3] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2933_c40_67a3_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2933_c40_67a3_phase <= VAR_div2_uxn_opcodes_h_l2933_c40_67a3_phase;
     div2_uxn_opcodes_h_l2933_c40_67a3_ins <= VAR_div2_uxn_opcodes_h_l2933_c40_67a3_ins;
     div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2933_c40_67a3_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2933_c40_67a3_return_output := div2_uxn_opcodes_h_l2933_c40_67a3_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_3924_return_output;
     VAR_and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_8aca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue := VAR_div2_uxn_opcodes_h_l2933_c40_67a3_return_output;
     -- and[uxn_opcodes_h_l2934_c40_a109] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2934_c40_a109_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2934_c40_a109_phase <= VAR_and_uxn_opcodes_h_l2934_c40_a109_phase;
     and_uxn_opcodes_h_l2934_c40_a109_ins <= VAR_and_uxn_opcodes_h_l2934_c40_a109_ins;
     and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read <= VAR_and_uxn_opcodes_h_l2934_c40_a109_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2934_c40_a109_return_output := and_uxn_opcodes_h_l2934_c40_a109_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_97d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_5e5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output;
     VAR_and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5e5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue := VAR_and_uxn_opcodes_h_l2934_c40_a109_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_8b33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6156] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output;

     -- and2[uxn_opcodes_h_l2935_c40_1400] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2935_c40_1400_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2935_c40_1400_phase <= VAR_and2_uxn_opcodes_h_l2935_c40_1400_phase;
     and2_uxn_opcodes_h_l2935_c40_1400_ins <= VAR_and2_uxn_opcodes_h_l2935_c40_1400_ins;
     and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2935_c40_1400_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2935_c40_1400_return_output := and2_uxn_opcodes_h_l2935_c40_1400_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output;
     VAR_ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6156_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue := VAR_and2_uxn_opcodes_h_l2935_c40_1400_return_output;
     -- ora[uxn_opcodes_h_l2936_c40_ff40] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2936_c40_ff40_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2936_c40_ff40_phase <= VAR_ora_uxn_opcodes_h_l2936_c40_ff40_phase;
     ora_uxn_opcodes_h_l2936_c40_ff40_ins <= VAR_ora_uxn_opcodes_h_l2936_c40_ff40_ins;
     ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2936_c40_ff40_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2936_c40_ff40_return_output := ora_uxn_opcodes_h_l2936_c40_ff40_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_1c79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_239c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_239c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue := VAR_ora_uxn_opcodes_h_l2936_c40_ff40_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_ac50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_2ec6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output;

     -- ora2[uxn_opcodes_h_l2937_c40_7f85] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2937_c40_7f85_phase <= VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_phase;
     ora2_uxn_opcodes_h_l2937_c40_7f85_ins <= VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_ins;
     ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_return_output := ora2_uxn_opcodes_h_l2937_c40_7f85_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output;
     VAR_eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_2ec6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue := VAR_ora2_uxn_opcodes_h_l2937_c40_7f85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_0552] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_b1c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output;

     -- eor[uxn_opcodes_h_l2938_c40_1f43] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2938_c40_1f43_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2938_c40_1f43_phase <= VAR_eor_uxn_opcodes_h_l2938_c40_1f43_phase;
     eor_uxn_opcodes_h_l2938_c40_1f43_ins <= VAR_eor_uxn_opcodes_h_l2938_c40_1f43_ins;
     eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2938_c40_1f43_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2938_c40_1f43_return_output := eor_uxn_opcodes_h_l2938_c40_1f43_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output;
     VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0552_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue := VAR_eor_uxn_opcodes_h_l2938_c40_1f43_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_8deb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_3b63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output;

     -- eor2[uxn_opcodes_h_l2939_c40_5a3e] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2939_c40_5a3e_phase <= VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_phase;
     eor2_uxn_opcodes_h_l2939_c40_5a3e_ins <= VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_ins;
     eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output := eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output;

     -- Submodule level 74
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output;
     VAR_sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_8deb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue := VAR_eor2_uxn_opcodes_h_l2939_c40_5a3e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_9697] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output;

     -- sft[uxn_opcodes_h_l2940_c40_784f] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2940_c40_784f_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2940_c40_784f_phase <= VAR_sft_uxn_opcodes_h_l2940_c40_784f_phase;
     sft_uxn_opcodes_h_l2940_c40_784f_ins <= VAR_sft_uxn_opcodes_h_l2940_c40_784f_ins;
     sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2940_c40_784f_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2940_c40_784f_return_output := sft_uxn_opcodes_h_l2940_c40_784f_return_output;

     -- Submodule level 75
     VAR_sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_9697_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue := VAR_sft_uxn_opcodes_h_l2940_c40_784f_return_output;
     -- sft2[uxn_opcodes_h_l2941_c40_4615] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2941_c40_4615_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2941_c40_4615_phase <= VAR_sft2_uxn_opcodes_h_l2941_c40_4615_phase;
     sft2_uxn_opcodes_h_l2941_c40_4615_ins <= VAR_sft2_uxn_opcodes_h_l2941_c40_4615_ins;
     sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2941_c40_4615_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2941_c40_4615_return_output := sft2_uxn_opcodes_h_l2941_c40_4615_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue := VAR_sft2_uxn_opcodes_h_l2941_c40_4615_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_3b63] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_3b63_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_b1c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_b1c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_ac50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_ac50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_1c79] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_1c79_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_8b33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_8b33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_97d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_97d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_3924] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_3924_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_b943] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_b943_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_35f8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_35f8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_0118] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0118_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_4111] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_4111_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_73a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_73a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_20ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_20ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_9642] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9642_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_9323] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_9323_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_d37b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d37b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_a3e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_a3e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_702e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_702e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_7d40] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_7d40_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_c2cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_c2cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_1098] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_1098_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_e44d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_e44d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_b7d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_b7d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_26ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_26ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_f58f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f58f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_2687] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_2687_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_3202] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_3202_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_2609] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_2609_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_b23e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_b23e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_0e70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0e70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_1d38] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1d38_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_3f93] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_3f93_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_9099] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9099_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_64e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_64e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_8c9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8c9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_a3e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a3e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_0e7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_8be0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_8be0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_8127] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_8127_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_b9ae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b9ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_a49e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_a49e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_e230] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e230_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_2a14] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2a14_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_f9b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f9b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_9548] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_9548_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_f1bc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_f1bc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_a778] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_a778_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_0740] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0740_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_1bb9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_1bb9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_cf2d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_cf2d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_11c4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_11c4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_2f7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2f7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_5d02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_5d02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_3718] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3718_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_f6da] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_f6da_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_5ac6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_5ac6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_c831] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c831_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_9c56] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_9c56_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_1d04] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_1d04_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_26fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_26fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_4670] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_4670_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_dee5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_dee5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_fc59] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fc59_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_a3c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a3c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_5b19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_5b19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_abe3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_abe3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_f2d9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f2d9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_f0e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_f0e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_0555] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0555_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c2_3434] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output;

     -- Submodule level 146
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2967_c34_15f9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_15f9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2944_c17_17f2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_17f2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2952_c68_00df] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_00df_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2966_c33_bfbb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_bfbb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_faf7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_faf7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2962_c39_8524] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_8524_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2968_c37_1456] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_1456_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2963_c40_7687] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_7687_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2958_c3_94b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_94b4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_9d4e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_9d4e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2964_c34_e622] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_e622_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2970_c32_e474] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e474_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2965_c30_5f5a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_5f5a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_3434_return_output.u16_value;

     -- Submodule level 147
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_17f2_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_94b4_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_9d4e_return_output;
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c58_91d1] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_91d1_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_00df_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_337a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_left;
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output := BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_3ab5 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_3ab5_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_3434_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_8524_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_7687_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_e622_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_5f5a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_bfbb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_15f9_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_1456_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_9d4e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e474_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_c315 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_c315_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_faf7_return_output);

     -- Submodule level 148
     VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_337a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_c315_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_c315_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_91d1_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_3ab5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2972_DUPLICATE_3ab5_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_2c88] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_2ecc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output;

     -- MUX[uxn_opcodes_h_l2953_c20_7a08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c20_7a08_cond <= VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_cond;
     MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iftrue;
     MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_return_output := MUX_uxn_opcodes_h_l2953_c20_7a08_return_output;

     -- Submodule level 149
     VAR_sp1_uxn_opcodes_h_l2947_c3_6989 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_2c88_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2949_c3_d7f8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2ecc_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right := VAR_MUX_uxn_opcodes_h_l2953_c20_7a08_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse := VAR_sp0_uxn_opcodes_h_l2949_c3_d7f8;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue := VAR_sp1_uxn_opcodes_h_l2947_c3_6989;
     -- sp0_MUX[uxn_opcodes_h_l2946_c2_0929] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_cond;
     sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue;
     sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output := sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2946_c2_0929] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_cond;
     sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iftrue;
     sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output := sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_0929_return_output;
     -- MUX[uxn_opcodes_h_l2952_c29_25fc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c29_25fc_cond <= VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_cond;
     MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iftrue;
     MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_return_output := MUX_uxn_opcodes_h_l2952_c29_25fc_return_output;

     -- Submodule level 151
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c19_2343] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2343_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2952_c29_25fc_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2343_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_6c98] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output;

     -- Submodule level 153
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_6c98_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2953_c2_668f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_left;
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output := BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output;

     -- Submodule level 154
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_668f_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2955_c24_2339] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_stack_address;
     stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_value;
     stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output := stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output;

     -- Submodule level 155
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_2339_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_ins_a <= REG_VAR_ins_a;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_previous_stack_read <= REG_VAR_previous_stack_read;
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
     ins_a <= REG_COMB_ins_a;
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_wait <= REG_COMB_is_wait;
     stack_address <= REG_COMB_stack_address;
     previous_stack_read <= REG_COMB_previous_stack_read;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
