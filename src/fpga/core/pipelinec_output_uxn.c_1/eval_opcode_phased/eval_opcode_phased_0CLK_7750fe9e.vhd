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
-- Submodules: 284
entity eval_opcode_phased_0CLK_7750fe9e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_7750fe9e;
architecture arch of eval_opcode_phased_0CLK_7750fe9e is
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
signal opc_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_stack_read : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_stack_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal stack_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
pc => to_unsigned(0, 16),
is_sp_updated => to_unsigned(0, 1),
sp => to_unsigned(0, 8),
is_stack_read => to_unsigned(0, 1),
is_stack_write => to_unsigned(0, 1),
stack_address => to_unsigned(0, 8),
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
signal REG_COMB_opc_done : unsigned(0 downto 0);
signal REG_COMB_is_stack_read : unsigned(0 downto 0);
signal REG_COMB_is_stack_write : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(15 downto 0);
signal REG_COMB_stack_write_value : unsigned(7 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l585_c8_64bc]
signal BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l585_c33_7b54]
signal BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l585_c49_fb42]
signal CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l585_c8_bf48]
signal MUX_uxn_opcodes_h_l585_c8_bf48_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c8_bf48_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l585_c8_bf48_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l585_c8_bf48_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l586_c16_da34]
signal BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l586_c16_c955]
signal MUX_uxn_opcodes_h_l586_c16_c955_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l586_c16_c955_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l586_c16_c955_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l586_c16_c955_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l587_c7_00e6]
signal BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l587_c7_0c0b]
signal MUX_uxn_opcodes_h_l587_c7_0c0b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c7_0c0b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l591_c2_9b5b[uxn_opcodes_h_l591_c2_9b5b]
signal printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l593_c6_cef7]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_28ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l593_c2_4b6a]
signal opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l594_c11_731b]
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_33b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l595_c7_568e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l594_c7_28ad]
signal opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l594_c41_48fb]
signal jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_stack_index : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_sp : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l594_c41_48fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l595_c11_b9dd]
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c7_1f9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l595_c7_568e]
signal opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l596_c11_3f99]
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c1_5a29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c7_1244]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l596_c7_1f9e]
signal opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l596_c41_5376]
signal jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_stack_index : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_sp : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l596_c41_5376_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l597_c11_ef18]
signal BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_dcf9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c7_6616]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l597_c7_1244]
signal opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l597_c41_630c]
signal lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_stack_index : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_sp : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l597_c41_630c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l598_c11_0425]
signal BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c1_496b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c7_63d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l598_c7_6616]
signal opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l598_c41_65b7]
signal lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_stack_index : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_sp : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l598_c41_65b7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_1caf]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c1_0156]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c7_cdfb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l599_c7_63d6]
signal opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l599_c41_5d40]
signal lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_stack_index : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_sp : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l599_c41_5d40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l600_c11_ac5e]
signal BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_5b72]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c7_0b2e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l600_c7_cdfb]
signal opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l600_c41_1a84]
signal lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_stack_index : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_sp : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l600_c41_1a84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l601_c11_e5d6]
signal BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l602_c7_c1f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l601_c7_0b2e]
signal opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l602_c11_10c9]
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l603_c7_b82a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l602_c7_c1f2]
signal opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l603_c11_8867]
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l603_c1_613b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c7_5f4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l603_c7_b82a]
signal opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l603_c41_4a96]
signal pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_stack_index : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_pc : unsigned(15 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_sp : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l603_c41_4a96_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l604_c11_5eea]
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c1_353f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l605_c7_b21c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l604_c7_5f4e]
signal opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l604_c41_f98e]
signal pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_stack_index : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_pc : unsigned(15 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_sp : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l604_c41_f98e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l605_c11_5db3]
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l606_c7_d7e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l605_c7_b21c]
signal opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l606_c11_7899]
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l607_c7_74da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l606_c7_d7e7]
signal opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l607_c11_2442]
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l608_c7_aeef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l607_c7_74da]
signal opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l608_c11_f40b]
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c7_2832]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l608_c7_aeef]
signal opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_feef]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l610_c7_43cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l609_c7_2832]
signal opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l610_c11_fe92]
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l611_c7_0b0f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l610_c7_43cc]
signal opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l611_c11_5cdc]
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c7_5292]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l611_c7_0b0f]
signal opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l612_c11_4d34]
signal BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l613_c7_19b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l612_c7_5292]
signal opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l613_c11_ffde]
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c7_a3ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l613_c7_19b8]
signal opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l614_c11_4e1e]
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c1_695e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l615_c7_c697]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l614_c7_a3ec]
signal opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l614_c41_aa1e]
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_pc : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_sp : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l615_c11_5049]
signal BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l616_c7_98a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l615_c7_c697]
signal opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l616_c11_dc35]
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l617_c7_241e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l616_c7_98a7]
signal opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l617_c11_430f]
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_5b0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l617_c7_241e]
signal opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l618_c11_6c58]
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l619_c7_7dd1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l618_c7_5b0e]
signal opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l619_c11_b59d]
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l620_c7_be19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l619_c7_7dd1]
signal opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l620_c11_c954]
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_795c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l620_c7_be19]
signal opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_c641]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l622_c7_39ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l621_c7_795c]
signal opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l622_c11_2b81]
signal BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l623_c7_3dfa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l622_c7_39ba]
signal opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l623_c11_c468]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c7_548e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l623_c7_3dfa]
signal opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l624_c11_1c65]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c1_5c8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c7_f9a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l624_c7_548e]
signal opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l624_c41_6ab6]
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_pc : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_sp : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l625_c11_106e]
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l626_c7_29cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l625_c7_f9a5]
signal opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l626_c11_f75c]
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l627_c7_e692]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l626_c7_29cd]
signal opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l627_c11_d9ea]
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c7_3b9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l627_c7_e692]
signal opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l628_c11_204b]
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l629_c7_6977]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l628_c7_3b9e]
signal opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_8a4a]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l630_c7_a05c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l629_c7_6977]
signal opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l630_c11_e197]
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l631_c7_bd4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l630_c7_a05c]
signal opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l631_c11_a1c9]
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l632_c7_03b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l631_c7_bd4d]
signal opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l632_c11_3137]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l633_c7_066f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l632_c7_03b9]
signal opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l633_c11_cde1]
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l634_c7_3fed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l633_c7_066f]
signal opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l634_c11_b4bc]
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l635_c7_7981]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l634_c7_3fed]
signal opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l635_c11_1113]
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l636_c7_5c18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l635_c7_7981]
signal opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_0244]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l637_c7_12b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l636_c7_5c18]
signal opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l637_c11_006c]
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l638_c7_3593]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l637_c7_12b3]
signal opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l638_c11_087e]
signal BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l639_c7_f711]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l638_c7_3593]
signal opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_bae7]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l640_c7_9cca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l639_c7_f711]
signal opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l640_c11_7a2b]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l641_c7_1e54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l640_c7_9cca]
signal opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l641_c11_153b]
signal BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l642_c7_719d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l641_c7_1e54]
signal opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l642_c11_b1ce]
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l643_c7_b60c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l642_c7_719d]
signal opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_a956]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c7_2c11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l643_c7_b60c]
signal opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l644_c11_bd56]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l645_c7_52e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l644_c7_2c11]
signal opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l645_c11_8895]
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l645_c1_0e8a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l646_c7_f710]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l645_c7_52e1]
signal opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l645_c41_fc29]
signal deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_stack_index : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_pc : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_sp : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l645_c41_fc29_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l646_c11_141a]
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l646_c1_b579]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l646_c7_f710]
signal opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l646_c41_9408]
signal deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_stack_index : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_pc : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_sp : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l646_c41_9408_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l647_c11_fa55]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_5ff6]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l648_c11_9d64]
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l648_c7_aa76]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l649_c11_cc27]
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_dff4]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l650_c11_efa1]
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_7336]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l651_c11_7a77]
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l651_c7_4f46]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l652_c11_d530]
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_32db]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l653_c11_a33e]
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_4372]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l654_c11_ebc7]
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l654_c7_995e]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_8551]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_6dd6]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l656_c11_d82f]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_b103]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l657_c11_8786]
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l657_c7_e1c7]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l658_c11_4bcd]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_4cbf]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l659_c11_8279]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_6a3a]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_6698]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_5cf1]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l661_c11_1bb3]
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_34ca]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l662_c11_9af0]
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output : unsigned(0 downto 0);

-- opc_result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_b36e]
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse : unsigned(0 downto 0);
signal opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l669_c1_e18d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l678_c1_c3a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l669_c2_3cfa]
signal stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l670_c22_6b6d]
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l679_c22_0ce8]
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output : unsigned(15 downto 0);

-- sp1_MUX[uxn_opcodes_h_l689_c2_dc5a]
signal sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l689_c2_dc5a]
signal sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c7_78de]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l690_c3_b258]
signal sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l690_c3_b258]
signal sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l697_c26_8d28]
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l716_c2_b30c[uxn_opcodes_h_l716_c2_b30c]
signal printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2 : unsigned(31 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc
BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left,
BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right,
BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54
BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left,
BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right,
BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output);

-- CONST_SL_4_uxn_opcodes_h_l585_c49_fb42
CONST_SL_4_uxn_opcodes_h_l585_c49_fb42 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x,
CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output);

-- MUX_uxn_opcodes_h_l585_c8_bf48
MUX_uxn_opcodes_h_l585_c8_bf48 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c8_bf48_cond,
MUX_uxn_opcodes_h_l585_c8_bf48_iftrue,
MUX_uxn_opcodes_h_l585_c8_bf48_iffalse,
MUX_uxn_opcodes_h_l585_c8_bf48_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l586_c16_da34
BIN_OP_AND_uxn_opcodes_h_l586_c16_da34 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left,
BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right,
BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output);

-- MUX_uxn_opcodes_h_l586_c16_c955
MUX_uxn_opcodes_h_l586_c16_c955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l586_c16_c955_cond,
MUX_uxn_opcodes_h_l586_c16_c955_iftrue,
MUX_uxn_opcodes_h_l586_c16_c955_iffalse,
MUX_uxn_opcodes_h_l586_c16_c955_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6
BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left,
BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right,
BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output);

-- MUX_uxn_opcodes_h_l587_c7_0c0b
MUX_uxn_opcodes_h_l587_c7_0c0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l587_c7_0c0b_cond,
MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue,
MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse,
MUX_uxn_opcodes_h_l587_c7_0c0b_return_output);

-- printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b
printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b : entity work.printf_uxn_opcodes_h_l591_c2_9b5b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0,
printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1,
printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7
BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a
opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond,
opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue,
opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse,
opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b
BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l594_c7_28ad
opc_result_MUX_uxn_opcodes_h_l594_c7_28ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond,
opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output);

-- jci_uxn_opcodes_h_l594_c41_48fb
jci_uxn_opcodes_h_l594_c41_48fb : entity work.jci_0CLK_81936ba3 port map (
clk,
jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE,
jci_uxn_opcodes_h_l594_c41_48fb_phase,
jci_uxn_opcodes_h_l594_c41_48fb_stack_index,
jci_uxn_opcodes_h_l594_c41_48fb_pc,
jci_uxn_opcodes_h_l594_c41_48fb_sp,
jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read,
jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read,
jci_uxn_opcodes_h_l594_c41_48fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd
BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left,
BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right,
BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l595_c7_568e
opc_result_MUX_uxn_opcodes_h_l595_c7_568e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond,
opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue,
opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse,
opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99
BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left,
BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right,
BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output);

-- opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e
opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond,
opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output);

-- jsi_uxn_opcodes_h_l596_c41_5376
jsi_uxn_opcodes_h_l596_c41_5376 : entity work.jsi_0CLK_d853ed1b port map (
clk,
jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l596_c41_5376_phase,
jsi_uxn_opcodes_h_l596_c41_5376_stack_index,
jsi_uxn_opcodes_h_l596_c41_5376_pc,
jsi_uxn_opcodes_h_l596_c41_5376_sp,
jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read,
jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read,
jsi_uxn_opcodes_h_l596_c41_5376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18
BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left,
BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right,
BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output);

-- opc_result_MUX_uxn_opcodes_h_l597_c7_1244
opc_result_MUX_uxn_opcodes_h_l597_c7_1244 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond,
opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue,
opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse,
opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output);

-- lit_uxn_opcodes_h_l597_c41_630c
lit_uxn_opcodes_h_l597_c41_630c : entity work.lit_0CLK_6c9b19c4 port map (
clk,
lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE,
lit_uxn_opcodes_h_l597_c41_630c_phase,
lit_uxn_opcodes_h_l597_c41_630c_stack_index,
lit_uxn_opcodes_h_l597_c41_630c_pc,
lit_uxn_opcodes_h_l597_c41_630c_sp,
lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read,
lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read,
lit_uxn_opcodes_h_l597_c41_630c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425
BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left,
BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right,
BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l598_c7_6616
opc_result_MUX_uxn_opcodes_h_l598_c7_6616 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond,
opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue,
opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse,
opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output);

-- lit2_uxn_opcodes_h_l598_c41_65b7
lit2_uxn_opcodes_h_l598_c41_65b7 : entity work.lit2_0CLK_3a9c1537 port map (
clk,
lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l598_c41_65b7_phase,
lit2_uxn_opcodes_h_l598_c41_65b7_stack_index,
lit2_uxn_opcodes_h_l598_c41_65b7_pc,
lit2_uxn_opcodes_h_l598_c41_65b7_sp,
lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read,
lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read,
lit2_uxn_opcodes_h_l598_c41_65b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf
BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l599_c7_63d6
opc_result_MUX_uxn_opcodes_h_l599_c7_63d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond,
opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output);

-- lit_uxn_opcodes_h_l599_c41_5d40
lit_uxn_opcodes_h_l599_c41_5d40 : entity work.lit_0CLK_6c9b19c4 port map (
clk,
lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE,
lit_uxn_opcodes_h_l599_c41_5d40_phase,
lit_uxn_opcodes_h_l599_c41_5d40_stack_index,
lit_uxn_opcodes_h_l599_c41_5d40_pc,
lit_uxn_opcodes_h_l599_c41_5d40_sp,
lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read,
lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read,
lit_uxn_opcodes_h_l599_c41_5d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e
BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left,
BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right,
BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb
opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond,
opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue,
opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse,
opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output);

-- lit2_uxn_opcodes_h_l600_c41_1a84
lit2_uxn_opcodes_h_l600_c41_1a84 : entity work.lit2_0CLK_3a9c1537 port map (
clk,
lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l600_c41_1a84_phase,
lit2_uxn_opcodes_h_l600_c41_1a84_stack_index,
lit2_uxn_opcodes_h_l600_c41_1a84_pc,
lit2_uxn_opcodes_h_l600_c41_1a84_sp,
lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read,
lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read,
lit2_uxn_opcodes_h_l600_c41_1a84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6
BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left,
BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right,
BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e
opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond,
opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue,
opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse,
opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9
BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2
opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond,
opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867
BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l603_c7_b82a
opc_result_MUX_uxn_opcodes_h_l603_c7_b82a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond,
opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue,
opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse,
opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output);

-- pop_uxn_opcodes_h_l603_c41_4a96
pop_uxn_opcodes_h_l603_c41_4a96 : entity work.pop_0CLK_098d5770 port map (
clk,
pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE,
pop_uxn_opcodes_h_l603_c41_4a96_phase,
pop_uxn_opcodes_h_l603_c41_4a96_stack_index,
pop_uxn_opcodes_h_l603_c41_4a96_ins,
pop_uxn_opcodes_h_l603_c41_4a96_pc,
pop_uxn_opcodes_h_l603_c41_4a96_sp,
pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read,
pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read,
pop_uxn_opcodes_h_l603_c41_4a96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea
BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left,
BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right,
BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e
opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond,
opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output);

-- pop2_uxn_opcodes_h_l604_c41_f98e
pop2_uxn_opcodes_h_l604_c41_f98e : entity work.pop2_0CLK_098d5770 port map (
clk,
pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l604_c41_f98e_phase,
pop2_uxn_opcodes_h_l604_c41_f98e_stack_index,
pop2_uxn_opcodes_h_l604_c41_f98e_ins,
pop2_uxn_opcodes_h_l604_c41_f98e_pc,
pop2_uxn_opcodes_h_l604_c41_f98e_sp,
pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read,
pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read,
pop2_uxn_opcodes_h_l604_c41_f98e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3
BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l605_c7_b21c
opc_result_MUX_uxn_opcodes_h_l605_c7_b21c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond,
opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue,
opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse,
opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899
BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left,
BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right,
BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output);

-- opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7
opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond,
opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue,
opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse,
opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442
BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l607_c7_74da
opc_result_MUX_uxn_opcodes_h_l607_c7_74da : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond,
opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue,
opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse,
opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output);

-- opc_result_MUX_uxn_opcodes_h_l608_c7_aeef
opc_result_MUX_uxn_opcodes_h_l608_c7_aeef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond,
opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue,
opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse,
opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef
BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l609_c7_2832
opc_result_MUX_uxn_opcodes_h_l609_c7_2832 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond,
opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue,
opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse,
opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92
BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l610_c7_43cc
opc_result_MUX_uxn_opcodes_h_l610_c7_43cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond,
opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left,
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right,
BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output);

-- opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f
opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond,
opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue,
opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse,
opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34
BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left,
BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right,
BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l612_c7_5292
opc_result_MUX_uxn_opcodes_h_l612_c7_5292 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond,
opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue,
opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse,
opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde
BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l613_c7_19b8
opc_result_MUX_uxn_opcodes_h_l613_c7_19b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond,
opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e
BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output);

-- opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec
opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond,
opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output);

-- ovr2_uxn_opcodes_h_l614_c41_aa1e
ovr2_uxn_opcodes_h_l614_c41_aa1e : entity work.ovr2_0CLK_aa545296 port map (
clk,
ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l614_c41_aa1e_phase,
ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index,
ovr2_uxn_opcodes_h_l614_c41_aa1e_ins,
ovr2_uxn_opcodes_h_l614_c41_aa1e_pc,
ovr2_uxn_opcodes_h_l614_c41_aa1e_sp,
ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read,
ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read,
ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049
BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left,
BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right,
BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l615_c7_c697
opc_result_MUX_uxn_opcodes_h_l615_c7_c697 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond,
opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue,
opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse,
opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35
BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l616_c7_98a7
opc_result_MUX_uxn_opcodes_h_l616_c7_98a7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond,
opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue,
opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse,
opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f
BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l617_c7_241e
opc_result_MUX_uxn_opcodes_h_l617_c7_241e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond,
opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue,
opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse,
opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58
BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right,
BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e
opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond,
opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d
BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1
opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond,
opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue,
opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse,
opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954
BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l620_c7_be19
opc_result_MUX_uxn_opcodes_h_l620_c7_be19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond,
opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue,
opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse,
opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641
BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l621_c7_795c
opc_result_MUX_uxn_opcodes_h_l621_c7_795c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond,
opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue,
opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse,
opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81
BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left,
BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right,
BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l622_c7_39ba
opc_result_MUX_uxn_opcodes_h_l622_c7_39ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond,
opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468
BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa
opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond,
opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue,
opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse,
opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65
BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l624_c7_548e
opc_result_MUX_uxn_opcodes_h_l624_c7_548e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond,
opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue,
opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse,
opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output);

-- jmp2_uxn_opcodes_h_l624_c41_6ab6
jmp2_uxn_opcodes_h_l624_c41_6ab6 : entity work.jmp2_0CLK_06911bbe port map (
clk,
jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l624_c41_6ab6_phase,
jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index,
jmp2_uxn_opcodes_h_l624_c41_6ab6_ins,
jmp2_uxn_opcodes_h_l624_c41_6ab6_pc,
jmp2_uxn_opcodes_h_l624_c41_6ab6_sp,
jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read,
jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read,
jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e
BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left,
BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right,
BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5
opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond,
opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c
BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output);

-- opc_result_MUX_uxn_opcodes_h_l626_c7_29cd
opc_result_MUX_uxn_opcodes_h_l626_c7_29cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond,
opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea
BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l627_c7_e692
opc_result_MUX_uxn_opcodes_h_l627_c7_e692 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond,
opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue,
opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse,
opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b
BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left,
BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right,
BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output);

-- opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e
opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond,
opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a
BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l629_c7_6977
opc_result_MUX_uxn_opcodes_h_l629_c7_6977 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond,
opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue,
opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse,
opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197
BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l630_c7_a05c
opc_result_MUX_uxn_opcodes_h_l630_c7_a05c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond,
opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue,
opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse,
opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9
BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d
opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond,
opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue,
opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse,
opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l632_c7_03b9
opc_result_MUX_uxn_opcodes_h_l632_c7_03b9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond,
opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue,
opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse,
opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1
BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l633_c7_066f
opc_result_MUX_uxn_opcodes_h_l633_c7_066f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond,
opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue,
opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse,
opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc
BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output);

-- opc_result_MUX_uxn_opcodes_h_l634_c7_3fed
opc_result_MUX_uxn_opcodes_h_l634_c7_3fed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond,
opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue,
opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse,
opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113
BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left,
BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right,
BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l635_c7_7981
opc_result_MUX_uxn_opcodes_h_l635_c7_7981 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond,
opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue,
opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse,
opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244
BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l636_c7_5c18
opc_result_MUX_uxn_opcodes_h_l636_c7_5c18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond,
opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue,
opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse,
opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c
BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output);

-- opc_result_MUX_uxn_opcodes_h_l637_c7_12b3
opc_result_MUX_uxn_opcodes_h_l637_c7_12b3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond,
opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue,
opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse,
opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e
BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left,
BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right,
BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output);

-- opc_result_MUX_uxn_opcodes_h_l638_c7_3593
opc_result_MUX_uxn_opcodes_h_l638_c7_3593 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond,
opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue,
opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse,
opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7
BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l639_c7_f711
opc_result_MUX_uxn_opcodes_h_l639_c7_f711 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond,
opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue,
opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse,
opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b
BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output);

-- opc_result_MUX_uxn_opcodes_h_l640_c7_9cca
opc_result_MUX_uxn_opcodes_h_l640_c7_9cca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond,
opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue,
opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse,
opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b
BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left,
BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right,
BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l641_c7_1e54
opc_result_MUX_uxn_opcodes_h_l641_c7_1e54 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond,
opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue,
opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse,
opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce
BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left,
BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right,
BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l642_c7_719d
opc_result_MUX_uxn_opcodes_h_l642_c7_719d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond,
opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue,
opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse,
opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956
BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l643_c7_b60c
opc_result_MUX_uxn_opcodes_h_l643_c7_b60c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond,
opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue,
opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse,
opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56
BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l644_c7_2c11
opc_result_MUX_uxn_opcodes_h_l644_c7_2c11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond,
opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue,
opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse,
opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895
BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left,
BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right,
BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output);

-- opc_result_MUX_uxn_opcodes_h_l645_c7_52e1
opc_result_MUX_uxn_opcodes_h_l645_c7_52e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond,
opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output);

-- deo_uxn_opcodes_h_l645_c41_fc29
deo_uxn_opcodes_h_l645_c41_fc29 : entity work.deo_0CLK_aef2f46d port map (
clk,
deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE,
deo_uxn_opcodes_h_l645_c41_fc29_phase,
deo_uxn_opcodes_h_l645_c41_fc29_stack_index,
deo_uxn_opcodes_h_l645_c41_fc29_ins,
deo_uxn_opcodes_h_l645_c41_fc29_pc,
deo_uxn_opcodes_h_l645_c41_fc29_sp,
deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read,
deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read,
deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read,
deo_uxn_opcodes_h_l645_c41_fc29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a
BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left,
BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right,
BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output);

-- opc_result_MUX_uxn_opcodes_h_l646_c7_f710
opc_result_MUX_uxn_opcodes_h_l646_c7_f710 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond,
opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue,
opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse,
opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output);

-- deo2_uxn_opcodes_h_l646_c41_9408
deo2_uxn_opcodes_h_l646_c41_9408 : entity work.deo2_0CLK_16853701 port map (
clk,
deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l646_c41_9408_phase,
deo2_uxn_opcodes_h_l646_c41_9408_stack_index,
deo2_uxn_opcodes_h_l646_c41_9408_ins,
deo2_uxn_opcodes_h_l646_c41_9408_pc,
deo2_uxn_opcodes_h_l646_c41_9408_sp,
deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read,
deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read,
deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read,
deo2_uxn_opcodes_h_l646_c41_9408_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55
BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6
opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64
BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left,
BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right,
BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76
opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27
BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4
opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1
BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336
opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77
BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left,
BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right,
BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46
opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530
BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db
opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e
BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372
opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7
BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left,
BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right,
BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e
opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551
BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6
opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103
opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786
BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left,
BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right,
BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7
opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd
BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf
opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279
BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a
opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698
BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1
opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3
BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca
opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0
BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output);

-- opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e
opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse,
opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa
stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond,
stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8 : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output);

-- sp1_MUX_uxn_opcodes_h_l689_c2_dc5a
sp1_MUX_uxn_opcodes_h_l689_c2_dc5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond,
sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue,
sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse,
sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output);

-- sp0_MUX_uxn_opcodes_h_l689_c2_dc5a
sp0_MUX_uxn_opcodes_h_l689_c2_dc5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond,
sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue,
sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse,
sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de
BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output);

-- sp1_MUX_uxn_opcodes_h_l690_c3_b258
sp1_MUX_uxn_opcodes_h_l690_c3_b258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond,
sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue,
sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse,
sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output);

-- sp0_MUX_uxn_opcodes_h_l690_c3_b258
sp0_MUX_uxn_opcodes_h_l690_c3_b258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond,
sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue,
sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse,
sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output);

-- device_ram_update_uxn_opcodes_h_l697_c26_8d28
device_ram_update_uxn_opcodes_h_l697_c26_8d28 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable,
device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output);

-- printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c
printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c : entity work.printf_uxn_opcodes_h_l716_c2_b30c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE,
printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0,
printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1,
printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2);



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
 opc_done,
 is_stack_read,
 is_stack_write,
 stack_address,
 stack_write_value,
 stack_read_value,
 device_ram_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output,
 CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output,
 MUX_uxn_opcodes_h_l585_c8_bf48_return_output,
 BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output,
 MUX_uxn_opcodes_h_l586_c16_c955_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output,
 MUX_uxn_opcodes_h_l587_c7_0c0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output,
 opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output,
 jci_uxn_opcodes_h_l594_c41_48fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output,
 opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output,
 jsi_uxn_opcodes_h_l596_c41_5376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output,
 opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output,
 lit_uxn_opcodes_h_l597_c41_630c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output,
 lit2_uxn_opcodes_h_l598_c41_65b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output,
 opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output,
 lit_uxn_opcodes_h_l599_c41_5d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output,
 opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output,
 lit2_uxn_opcodes_h_l600_c41_1a84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output,
 opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output,
 pop_uxn_opcodes_h_l603_c41_4a96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output,
 opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output,
 pop2_uxn_opcodes_h_l604_c41_f98e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output,
 opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output,
 opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output,
 opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output,
 opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output,
 opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output,
 opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output,
 opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output,
 ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output,
 opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output,
 opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output,
 opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output,
 opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output,
 opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output,
 opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output,
 opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output,
 jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output,
 opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output,
 opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output,
 opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output,
 opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output,
 opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output,
 opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output,
 opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output,
 opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output,
 opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output,
 opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output,
 opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output,
 opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output,
 opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output,
 opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output,
 opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output,
 opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output,
 opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output,
 opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output,
 deo_uxn_opcodes_h_l645_c41_fc29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output,
 opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output,
 deo2_uxn_opcodes_h_l646_c41_9408_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output,
 opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output,
 stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output,
 stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output,
 sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output,
 sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output,
 sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output,
 sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output,
 device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l585_c2_0f60 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c8_bf48_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c22_c570_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c49_5c81_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c8_bf48_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c16_c955_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c16_c955_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c16_c955_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l593_c2_4b6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_stack_index : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_sp : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l594_c41_48fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l595_c7_568e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_stack_index : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_sp : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l596_c41_5376_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_stack_index : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_sp : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l597_c41_630c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_stack_index : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_sp : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l598_c41_65b7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_stack_index : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_sp : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l599_c41_5d40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_stack_index : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_sp : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l600_c41_1a84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l601_c7_0b2e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l602_c7_c1f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_stack_index : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_pc : unsigned(15 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_sp : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l603_c41_4a96_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_stack_index : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_pc : unsigned(15 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_sp : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l604_c41_f98e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l605_c7_b21c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l606_c7_d7e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l607_c7_74da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l608_c7_aeef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l609_c7_2832_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l610_c7_43cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l611_c7_0b0f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l612_c7_5292_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l613_c7_19b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_pc : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_sp : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l615_c7_c697_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l616_c7_98a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l617_c7_241e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l618_c7_5b0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l619_c7_7dd1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l620_c7_be19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l621_c7_795c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l622_c7_39ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l623_c7_3dfa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_pc : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_sp : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l625_c7_f9a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l626_c7_29cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l627_c7_e692_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l628_c7_3b9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l629_c7_6977_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l630_c7_a05c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l631_c7_bd4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l632_c7_03b9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l633_c7_066f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l634_c7_3fed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l635_c7_7981_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l636_c7_5c18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l637_c7_12b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l638_c7_3593_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l639_c7_f711_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l640_c7_9cca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l641_c7_1e54_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l642_c7_719d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l643_c7_b60c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l644_c7_2c11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_stack_index : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_pc : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_sp : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l645_c41_fc29_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse : opcode_result_t;
 variable VAR_opc_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l646_c7_f710_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_stack_index : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_pc : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_sp : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l646_c41_9408_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l664_c18_7379_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l665_c19_e5b9_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l666_c2_596e : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l666_c18_50b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l667_c22_c3ef_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l670_c3_de25 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l679_c3_57f7 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l689_c6_7ae0_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond : unsigned(0 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l697_c2_891e : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l699_c3_06a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l700_c3_5161_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l703_c3_606b_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l706_c34_dfeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l707_c23_63e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l708_c32_eb72_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l709_c33_53c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l710_c29_3502_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l711_c30_4a45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_c32_ef82_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l691_l693_DUPLICATE_bc04_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l702_l698_DUPLICATE_3be4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l716_l712_DUPLICATE_0df3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l716_l713_DUPLICATE_cb67_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l716_l714_DUPLICATE_a110_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l718_l568_DUPLICATE_fdc3_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_sp : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_opc_done : unsigned(0 downto 0);
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
  REG_VAR_opc_done := opc_done;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right := to_unsigned(3072, 12);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right := to_unsigned(34, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue := to_unsigned(1, 1);
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right := to_unsigned(8, 4);
     REG_VAR_opc_done := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l586_c16_c955_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right := to_unsigned(30, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right := to_unsigned(16, 5);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right := to_unsigned(2560, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l586_c16_c955_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right := to_unsigned(48, 6);
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right := to_unsigned(62, 6);
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right := to_unsigned(23, 5);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue := to_unsigned(1, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue := to_unsigned(0, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right := to_unsigned(50, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right := to_unsigned(63, 6);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right := to_unsigned(512, 10);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue := to_unsigned(1, 1);
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right := to_unsigned(13, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0 := resize(VAR_ins, 32);
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_pc := VAR_pc;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_pc := VAR_pc;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_pc := VAR_pc;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_pc := VAR_pc;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_pc := VAR_pc;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_pc := VAR_pc;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_pc := VAR_pc;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2 := resize(VAR_phase, 32);
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read := VAR_previous_ram_read;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read := VAR_previous_ram_read;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read := VAR_previous_ram_read;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read := VAR_previous_ram_read;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse := sp0;
     VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue := sp1;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read := stack_read_value;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read := stack_read_value;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read := stack_read_value;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read := stack_read_value;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read := stack_read_value;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l642_c7_719d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l642_c7_719d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l626_c7_29cd] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l626_c7_29cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l585_c33_7b54] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l627_c7_e692] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l627_c7_e692_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l611_c7_0b0f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l611_c7_0b0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l643_c7_b60c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l643_c7_b60c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l613_c7_19b8] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l613_c7_19b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l618_c7_5b0e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l618_c7_5b0e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l619_c7_7dd1] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l619_c7_7dd1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l637_c7_12b3] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l637_c7_12b3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l609_c7_2832] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l609_c7_2832_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l595_c7_568e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l595_c7_568e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l630_c7_a05c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l630_c7_a05c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l608_c7_aeef] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l608_c7_aeef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l631_c7_bd4d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l631_c7_bd4d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l606_c7_d7e7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l606_c7_d7e7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l593_c2_4b6a] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l593_c2_4b6a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l628_c7_3b9e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l628_c7_3b9e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l634_c7_3fed] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l634_c7_3fed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l607_c7_74da] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l607_c7_74da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l633_c7_066f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l633_c7_066f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l638_c7_3593] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l638_c7_3593_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l620_c7_be19] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l620_c7_be19_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l610_c7_43cc] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l610_c7_43cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l616_c7_98a7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l616_c7_98a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l623_c7_3dfa] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l623_c7_3dfa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l612_c7_5292] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l612_c7_5292_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l621_c7_795c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l621_c7_795c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l644_c7_2c11] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l644_c7_2c11_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l585_c8_64bc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l585_c49_5c81] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c49_5c81_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l641_c7_1e54] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l641_c7_1e54_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l601_c7_0b2e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l601_c7_0b2e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l622_c7_39ba] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l622_c7_39ba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l639_c7_f711] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l639_c7_f711_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l640_c7_9cca] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l640_c7_9cca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l625_c7_f9a5] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l625_c7_f9a5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l629_c7_6977] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l629_c7_6977_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l586_c16_da34] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_left;
     BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output := BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l602_c7_c1f2] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l602_c7_c1f2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l617_c7_241e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l617_c7_241e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l636_c7_5c18] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l636_c7_5c18_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l632_c7_03b9] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l632_c7_03b9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l605_c7_b21c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l605_c7_b21c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l635_c7_7981] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l635_c7_7981_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l615_c7_c697] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l615_c7_c697_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l585_c8_bf48_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l585_c8_64bc_return_output, 1);
     VAR_MUX_uxn_opcodes_h_l586_c16_c955_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l586_c16_da34_return_output, 1);
     VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c49_5c81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l593_c2_4b6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l595_c7_568e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l601_c7_0b2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l602_c7_c1f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l605_c7_b21c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l606_c7_d7e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l607_c7_74da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l608_c7_aeef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l609_c7_2832_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l610_c7_43cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l611_c7_0b0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l612_c7_5292_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l613_c7_19b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l615_c7_c697_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l616_c7_98a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l617_c7_241e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l618_c7_5b0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l619_c7_7dd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l620_c7_be19_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l621_c7_795c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l622_c7_39ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l623_c7_3dfa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l625_c7_f9a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l626_c7_29cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l627_c7_e692_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l628_c7_3b9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l629_c7_6977_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l630_c7_a05c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l631_c7_bd4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l632_c7_03b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l633_c7_066f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l634_c7_3fed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l635_c7_7981_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l636_c7_5c18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l637_c7_12b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l638_c7_3593_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l639_c7_f711_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l640_c7_9cca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l641_c7_1e54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l642_c7_719d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l643_c7_b60c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l644_c7_2c11_return_output;
     -- CONST_SL_4[uxn_opcodes_h_l585_c49_fb42] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x <= VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output := CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output;

     -- MUX[uxn_opcodes_h_l586_c16_c955] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l586_c16_c955_cond <= VAR_MUX_uxn_opcodes_h_l586_c16_c955_cond;
     MUX_uxn_opcodes_h_l586_c16_c955_iftrue <= VAR_MUX_uxn_opcodes_h_l586_c16_c955_iftrue;
     MUX_uxn_opcodes_h_l586_c16_c955_iffalse <= VAR_MUX_uxn_opcodes_h_l586_c16_c955_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output := MUX_uxn_opcodes_h_l586_c16_c955_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l585_c22_c570] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c22_c570_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c33_7b54_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l585_c22_c570_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l585_c49_fb42_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond := VAR_MUX_uxn_opcodes_h_l586_c16_c955_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l678_c1_c3a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l587_c7_00e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l669_c1_e18d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output;

     -- MUX[uxn_opcodes_h_l585_c8_bf48] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c8_bf48_cond <= VAR_MUX_uxn_opcodes_h_l585_c8_bf48_cond;
     MUX_uxn_opcodes_h_l585_c8_bf48_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iftrue;
     MUX_uxn_opcodes_h_l585_c8_bf48_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c8_bf48_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c8_bf48_return_output := MUX_uxn_opcodes_h_l585_c8_bf48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c7_78de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c7_00e6_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c7_78de_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l678_c1_c3a8_return_output;
     VAR_opc_uxn_opcodes_h_l585_c2_0f60 := VAR_MUX_uxn_opcodes_h_l585_c8_bf48_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e18d_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l585_c2_0f60;
     VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1 := resize(VAR_opc_uxn_opcodes_h_l585_c2_0f60, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l610_c11_fe92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_left;
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output := BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c11_7a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l596_c11_3f99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_left;
     BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output := BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l598_c11_0425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_left;
     BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output := BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_feef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l602_c11_10c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l651_c11_7a77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_left;
     BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output := BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l627_c11_d9ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l622_c11_2b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l615_c11_5049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_left;
     BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output := BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c11_3137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l619_c11_b59d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_left;
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output := BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_a956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l597_c11_ef18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_left;
     BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output := BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_bae7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l608_c11_f40b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_left;
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output := BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l594_c11_731b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_left;
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output := BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c11_1c65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l614_c11_4e1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l638_c11_087e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_left;
     BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output := BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l603_c11_8867] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_left;
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output := BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l616_c11_dc35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_left;
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output := BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l612_c11_4d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c6_cef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l648_c11_9d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_left;
     BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output := BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output;

     -- printf_uxn_opcodes_h_l591_c2_9b5b[uxn_opcodes_h_l591_c2_9b5b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0 <= VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg0;
     printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1 <= VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg1;
     printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2 <= VAR_printf_uxn_opcodes_h_l591_c2_9b5b_uxn_opcodes_h_l591_c2_9b5b_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c11_8279] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l662_c11_9af0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_left;
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output := BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l628_c11_204b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_left;
     BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output := BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_8551] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output;

     -- MUX[uxn_opcodes_h_l587_c7_0c0b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l587_c7_0c0b_cond <= VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_cond;
     MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue <= VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iftrue;
     MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse <= VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output := MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l634_c11_b4bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l606_c11_7899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_left;
     BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output := BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l661_c11_1bb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l604_c11_5eea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_left;
     BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output := BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l635_c11_1113] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_left;
     BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output := BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_8a4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l641_c11_153b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_left;
     BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output := BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l600_c11_ac5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l652_c11_d530] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_left;
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output := BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l620_c11_c954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_left;
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output := BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l657_c11_8786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_left;
     BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output := BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l650_c11_efa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_left;
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output := BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l646_c11_141a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_left;
     BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output := BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c11_fa55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l613_c11_ffde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_left;
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output := BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l631_c11_a1c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l611_c11_5cdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l618_c11_6c58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_left;
     BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output := BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_0244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l645_c11_8895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_left;
     BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output := BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l625_c11_106e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_left;
     BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output := BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l653_c11_a33e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_left;
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output := BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l607_c11_2442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_left;
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output := BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c11_bd56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c11_d82f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l595_c11_b9dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l626_c11_f75c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_left;
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output := BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l630_c11_e197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_left;
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output := BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_6698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_1caf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_c641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l642_c11_b1ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l617_c11_430f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_left;
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output := BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c11_c468] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l654_c11_ebc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l637_c11_006c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_left;
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output := BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l633_c11_cde1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_left;
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output := BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l649_c11_cc27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_left;
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output := BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l605_c11_5db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l601_c11_e5d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l658_c11_4bcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_cef7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_731b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l595_c11_b9dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_3f99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c11_ef18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l598_c11_0425_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_1caf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l600_c11_ac5e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c11_e5d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_10c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_8867_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l604_c11_5eea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_5db3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l606_c11_7899_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_2442_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f40b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_feef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_fe92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l611_c11_5cdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c11_4d34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_ffde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_4e1e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l615_c11_5049_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_dc35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_430f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l618_c11_6c58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_b59d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_c954_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_c641_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l622_c11_2b81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_c468_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_1c65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l625_c11_106e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_f75c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_d9ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c11_204b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_8a4a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_e197_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_a1c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_3137_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_cde1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_b4bc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l635_c11_1113_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_0244_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_006c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c11_087e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_bae7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_7a2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l641_c11_153b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_b1ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_a956_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_bd56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_8895_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_141a_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_fa55_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_9d64_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_cc27_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_efa1_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_7a77_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_d530_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_a33e_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c11_ebc7_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_8551_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d82f_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_8786_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_4bcd_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_8279_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_6698_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_1bb3_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_9af0_return_output;
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     REG_VAR_sp := VAR_MUX_uxn_opcodes_h_l587_c7_0c0b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_28ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_b36e] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_28ad_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_b36e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l595_c7_568e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_33b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_34ca] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l595_c7_568e_return_output;
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_33b4_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_34ca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c7_1f9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output;

     -- jci[uxn_opcodes_h_l594_c41_48fb] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l594_c41_48fb_phase <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_phase;
     jci_uxn_opcodes_h_l594_c41_48fb_stack_index <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_stack_index;
     jci_uxn_opcodes_h_l594_c41_48fb_pc <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_pc;
     jci_uxn_opcodes_h_l594_c41_48fb_sp <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_sp;
     jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_stack_read;
     jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read <= VAR_jci_uxn_opcodes_h_l594_c41_48fb_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l594_c41_48fb_return_output := jci_uxn_opcodes_h_l594_c41_48fb_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_5cf1] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue := VAR_jci_uxn_opcodes_h_l594_c41_48fb_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_5cf1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c7_1244] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l596_c1_5a29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_6a3a] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c7_1244_return_output;
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l596_c1_5a29_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_6a3a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c7_6616] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_dcf9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_4cbf] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output;

     -- jsi[uxn_opcodes_h_l596_c41_5376] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l596_c41_5376_phase <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_phase;
     jsi_uxn_opcodes_h_l596_c41_5376_stack_index <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_stack_index;
     jsi_uxn_opcodes_h_l596_c41_5376_pc <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_pc;
     jsi_uxn_opcodes_h_l596_c41_5376_sp <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_sp;
     jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_stack_read;
     jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l596_c41_5376_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l596_c41_5376_return_output := jsi_uxn_opcodes_h_l596_c41_5376_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c7_6616_return_output;
     VAR_lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_dcf9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue := VAR_jsi_uxn_opcodes_h_l596_c41_5376_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4cbf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c1_496b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l657_c7_e1c7] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output;

     -- lit[uxn_opcodes_h_l597_c41_630c] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l597_c41_630c_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l597_c41_630c_phase <= VAR_lit_uxn_opcodes_h_l597_c41_630c_phase;
     lit_uxn_opcodes_h_l597_c41_630c_stack_index <= VAR_lit_uxn_opcodes_h_l597_c41_630c_stack_index;
     lit_uxn_opcodes_h_l597_c41_630c_pc <= VAR_lit_uxn_opcodes_h_l597_c41_630c_pc;
     lit_uxn_opcodes_h_l597_c41_630c_sp <= VAR_lit_uxn_opcodes_h_l597_c41_630c_sp;
     lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read <= VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_stack_read;
     lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read <= VAR_lit_uxn_opcodes_h_l597_c41_630c_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l597_c41_630c_return_output := lit_uxn_opcodes_h_l597_c41_630c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c7_63d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c7_63d6_return_output;
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_496b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue := VAR_lit_uxn_opcodes_h_l597_c41_630c_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_e1c7_return_output;
     -- lit2[uxn_opcodes_h_l598_c41_65b7] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l598_c41_65b7_phase <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_phase;
     lit2_uxn_opcodes_h_l598_c41_65b7_stack_index <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_stack_index;
     lit2_uxn_opcodes_h_l598_c41_65b7_pc <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_pc;
     lit2_uxn_opcodes_h_l598_c41_65b7_sp <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_sp;
     lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_stack_read;
     lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l598_c41_65b7_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l598_c41_65b7_return_output := lit2_uxn_opcodes_h_l598_c41_65b7_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_b103] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c7_cdfb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l599_c1_0156] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output;
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l599_c1_0156_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue := VAR_lit2_uxn_opcodes_h_l598_c41_65b7_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_b103_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c7_0b2e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_5b72] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output;

     -- lit[uxn_opcodes_h_l599_c41_5d40] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l599_c41_5d40_phase <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_phase;
     lit_uxn_opcodes_h_l599_c41_5d40_stack_index <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_stack_index;
     lit_uxn_opcodes_h_l599_c41_5d40_pc <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_pc;
     lit_uxn_opcodes_h_l599_c41_5d40_sp <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_sp;
     lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_stack_read;
     lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read <= VAR_lit_uxn_opcodes_h_l599_c41_5d40_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l599_c41_5d40_return_output := lit_uxn_opcodes_h_l599_c41_5d40_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_6dd6] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output;
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_5b72_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue := VAR_lit_uxn_opcodes_h_l599_c41_5d40_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_6dd6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l602_c7_c1f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l654_c7_995e] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output;

     -- lit2[uxn_opcodes_h_l600_c41_1a84] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l600_c41_1a84_phase <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_phase;
     lit2_uxn_opcodes_h_l600_c41_1a84_stack_index <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_stack_index;
     lit2_uxn_opcodes_h_l600_c41_1a84_pc <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_pc;
     lit2_uxn_opcodes_h_l600_c41_1a84_sp <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_sp;
     lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_stack_read;
     lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l600_c41_1a84_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l600_c41_1a84_return_output := lit2_uxn_opcodes_h_l600_c41_1a84_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue := VAR_lit2_uxn_opcodes_h_l600_c41_1a84_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l654_c7_995e_return_output;
     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_4372] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l603_c7_b82a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c7_b82a_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_4372_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l603_c1_613b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_32db] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c7_5f4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output;
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l603_c1_613b_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_32db_return_output;
     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l651_c7_4f46] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output;

     -- pop[uxn_opcodes_h_l603_c41_4a96] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l603_c41_4a96_phase <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_phase;
     pop_uxn_opcodes_h_l603_c41_4a96_stack_index <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_stack_index;
     pop_uxn_opcodes_h_l603_c41_4a96_ins <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_ins;
     pop_uxn_opcodes_h_l603_c41_4a96_pc <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_pc;
     pop_uxn_opcodes_h_l603_c41_4a96_sp <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_sp;
     pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_stack_read;
     pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read <= VAR_pop_uxn_opcodes_h_l603_c41_4a96_previous_ram_read;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l603_c41_4a96_return_output := pop_uxn_opcodes_h_l603_c41_4a96_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l604_c1_353f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l605_c7_b21c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l605_c7_b21c_return_output;
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l604_c1_353f_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_4f46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue := VAR_pop_uxn_opcodes_h_l603_c41_4a96_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l606_c7_d7e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_7336] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output;

     -- pop2[uxn_opcodes_h_l604_c41_f98e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l604_c41_f98e_phase <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_phase;
     pop2_uxn_opcodes_h_l604_c41_f98e_stack_index <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_stack_index;
     pop2_uxn_opcodes_h_l604_c41_f98e_ins <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_ins;
     pop2_uxn_opcodes_h_l604_c41_f98e_pc <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_pc;
     pop2_uxn_opcodes_h_l604_c41_f98e_sp <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_sp;
     pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_stack_read;
     pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read <= VAR_pop2_uxn_opcodes_h_l604_c41_f98e_previous_ram_read;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l604_c41_f98e_return_output := pop2_uxn_opcodes_h_l604_c41_f98e_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_7336_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue := VAR_pop2_uxn_opcodes_h_l604_c41_f98e_return_output;
     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_dff4] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l607_c7_74da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l607_c7_74da_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_dff4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l608_c7_aeef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l648_c7_aa76] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l608_c7_aeef_return_output;
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse := VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_aa76_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c7_2832] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output;

     -- opc_result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_5ff6] LATENCY=0
     -- Inputs
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_cond;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iftrue;
     opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse <= VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_iffalse;
     -- Outputs
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output := opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c7_2832_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l610_c7_43cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output;

     -- opc_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l646_c7_f710] LATENCY=0
     VAR_opc_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l646_c7_f710_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     VAR_opc_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_5ff6_return_output);

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l610_c7_43cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse := VAR_opc_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l646_c7_f710_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l611_c7_0b0f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c7_5292] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c7_5292_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l613_c7_19b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l613_c7_19b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c7_a3ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l615_c7_c697] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l614_c1_695e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l615_c7_c697_return_output;
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l614_c1_695e_return_output;
     -- ovr2[uxn_opcodes_h_l614_c41_aa1e] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l614_c41_aa1e_phase <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_phase;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_stack_index;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_ins <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_ins;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_pc <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_pc;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_sp <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_sp;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_stack_read;
     ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read <= VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_previous_ram_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output := ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l616_c7_98a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l616_c7_98a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue := VAR_ovr2_uxn_opcodes_h_l614_c41_aa1e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l617_c7_241e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l617_c7_241e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l618_c7_5b0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l619_c7_7dd1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l620_c7_be19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l620_c7_be19_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c7_795c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c7_795c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l622_c7_39ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l622_c7_39ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l623_c7_3dfa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c7_548e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c7_548e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l624_c1_5c8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c7_f9a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output;
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l624_c1_5c8b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l626_c7_29cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output;

     -- jmp2[uxn_opcodes_h_l624_c41_6ab6] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l624_c41_6ab6_phase <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_phase;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_stack_index;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_ins <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_ins;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_pc <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_pc;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_sp <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_sp;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_stack_read;
     jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read <= VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_previous_ram_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output := jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l626_c7_29cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue := VAR_jmp2_uxn_opcodes_h_l624_c41_6ab6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l627_c7_e692] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l627_c7_e692_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c7_3b9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l629_c7_6977] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l629_c7_6977_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l630_c7_a05c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l630_c7_a05c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l631_c7_bd4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l632_c7_03b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l632_c7_03b9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l633_c7_066f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c7_066f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l634_c7_3fed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c7_3fed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l635_c7_7981] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l635_c7_7981_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l636_c7_5c18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l636_c7_5c18_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l637_c7_12b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l637_c7_12b3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l638_c7_3593] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c7_3593_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l639_c7_f711] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l639_c7_f711_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l640_c7_9cca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c7_9cca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l641_c7_1e54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l641_c7_1e54_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l642_c7_719d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l642_c7_719d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l643_c7_b60c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l643_c7_b60c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c7_2c11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c7_2c11_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l645_c7_52e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c7_52e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l645_c1_0e8a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l646_c7_f710] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output;

     -- Submodule level 57
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c7_f710_return_output;
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l645_c1_0e8a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l646_c1_b579] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output;

     -- deo[uxn_opcodes_h_l645_c41_fc29] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l645_c41_fc29_phase <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_phase;
     deo_uxn_opcodes_h_l645_c41_fc29_stack_index <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_stack_index;
     deo_uxn_opcodes_h_l645_c41_fc29_ins <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_ins;
     deo_uxn_opcodes_h_l645_c41_fc29_pc <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_pc;
     deo_uxn_opcodes_h_l645_c41_fc29_sp <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_sp;
     deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_stack_read;
     deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_ram_read;
     deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l645_c41_fc29_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l645_c41_fc29_return_output := deo_uxn_opcodes_h_l645_c41_fc29_return_output;

     -- Submodule level 58
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l646_c1_b579_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue := VAR_deo_uxn_opcodes_h_l645_c41_fc29_return_output;
     -- deo2[uxn_opcodes_h_l646_c41_9408] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l646_c41_9408_phase <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_phase;
     deo2_uxn_opcodes_h_l646_c41_9408_stack_index <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_stack_index;
     deo2_uxn_opcodes_h_l646_c41_9408_ins <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_ins;
     deo2_uxn_opcodes_h_l646_c41_9408_pc <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_pc;
     deo2_uxn_opcodes_h_l646_c41_9408_sp <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_sp;
     deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_stack_read;
     deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_ram_read;
     deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l646_c41_9408_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l646_c41_9408_return_output := deo2_uxn_opcodes_h_l646_c41_9408_return_output;

     -- Submodule level 59
     VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue := VAR_deo2_uxn_opcodes_h_l646_c41_9408_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l646_c7_f710] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_cond;
     opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iftrue;
     opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output := opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output;

     -- Submodule level 60
     VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l646_c7_f710_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l645_c7_52e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_cond;
     opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output := opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output;

     -- Submodule level 61
     VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l645_c7_52e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l644_c7_2c11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_cond;
     opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output := opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output;

     -- Submodule level 62
     VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l644_c7_2c11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l643_c7_b60c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_cond;
     opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output := opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output;

     -- Submodule level 63
     VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l643_c7_b60c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l642_c7_719d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_cond;
     opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output := opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output;

     -- Submodule level 64
     VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l642_c7_719d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l641_c7_1e54] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_cond;
     opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iftrue;
     opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output := opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output;

     -- Submodule level 65
     VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l641_c7_1e54_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l640_c7_9cca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_cond;
     opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output := opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output;

     -- Submodule level 66
     VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l640_c7_9cca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l639_c7_f711] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_cond;
     opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iftrue;
     opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output := opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output;

     -- Submodule level 67
     VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l639_c7_f711_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l638_c7_3593] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_cond;
     opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iftrue;
     opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output := opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output;

     -- Submodule level 68
     VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l638_c7_3593_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l637_c7_12b3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_cond;
     opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output := opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output;

     -- Submodule level 69
     VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l637_c7_12b3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l636_c7_5c18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_cond;
     opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output := opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output;

     -- Submodule level 70
     VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l636_c7_5c18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l635_c7_7981] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_cond;
     opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iftrue;
     opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output := opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output;

     -- Submodule level 71
     VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l635_c7_7981_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l634_c7_3fed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_cond;
     opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output := opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output;

     -- Submodule level 72
     VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l634_c7_3fed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l633_c7_066f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_cond;
     opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output := opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output;

     -- Submodule level 73
     VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l633_c7_066f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l632_c7_03b9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_cond;
     opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output := opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output;

     -- Submodule level 74
     VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l632_c7_03b9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l631_c7_bd4d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_cond;
     opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output := opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l631_c7_bd4d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l630_c7_a05c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_cond;
     opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output := opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l630_c7_a05c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l629_c7_6977] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_cond;
     opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iftrue;
     opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output := opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l629_c7_6977_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l628_c7_3b9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_cond;
     opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output := opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l628_c7_3b9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l627_c7_e692] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_cond;
     opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iftrue;
     opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output := opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l627_c7_e692_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l626_c7_29cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_cond;
     opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output := opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l626_c7_29cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l625_c7_f9a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_cond;
     opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output := opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l625_c7_f9a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l624_c7_548e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_cond;
     opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output := opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l624_c7_548e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l623_c7_3dfa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_cond;
     opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output := opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l623_c7_3dfa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l622_c7_39ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_cond;
     opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output := opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l622_c7_39ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l621_c7_795c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_cond;
     opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output := opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l621_c7_795c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l620_c7_be19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_cond;
     opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output := opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l620_c7_be19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l619_c7_7dd1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_cond;
     opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output := opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l619_c7_7dd1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l618_c7_5b0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_cond;
     opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output := opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l618_c7_5b0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l617_c7_241e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_cond;
     opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output := opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l617_c7_241e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l616_c7_98a7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_cond;
     opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output := opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l616_c7_98a7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l615_c7_c697] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_cond;
     opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iftrue;
     opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output := opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l615_c7_c697_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l614_c7_a3ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_cond;
     opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output := opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l614_c7_a3ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l613_c7_19b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_cond;
     opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output := opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l613_c7_19b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l612_c7_5292] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_cond;
     opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iftrue;
     opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output := opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l612_c7_5292_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l611_c7_0b0f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_cond;
     opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output := opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l611_c7_0b0f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l610_c7_43cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_cond;
     opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output := opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l610_c7_43cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l609_c7_2832] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_cond;
     opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iftrue;
     opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output := opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l609_c7_2832_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l608_c7_aeef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_cond;
     opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output := opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l608_c7_aeef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l607_c7_74da] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_cond;
     opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iftrue;
     opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output := opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l607_c7_74da_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l606_c7_d7e7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_cond;
     opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output := opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l606_c7_d7e7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l605_c7_b21c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_cond;
     opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output := opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l605_c7_b21c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l604_c7_5f4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_cond;
     opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output := opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l604_c7_5f4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l603_c7_b82a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_cond;
     opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output := opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l603_c7_b82a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l602_c7_c1f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_cond;
     opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output := opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l602_c7_c1f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l601_c7_0b2e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_cond;
     opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output := opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l601_c7_0b2e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l600_c7_cdfb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_cond;
     opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output := opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l600_c7_cdfb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l599_c7_63d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_cond;
     opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output := opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l599_c7_63d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l598_c7_6616] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_cond;
     opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iftrue;
     opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output := opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l598_c7_6616_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l597_c7_1244] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_cond;
     opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iftrue;
     opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output := opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l597_c7_1244_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l596_c7_1f9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_cond;
     opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output := opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l596_c7_1f9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l595_c7_568e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_cond;
     opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output := opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l595_c7_568e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l594_c7_28ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_cond;
     opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output := opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l594_c7_28ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l593_c2_4b6a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_cond;
     opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output := opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output;

     -- Submodule level 113
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l700_c3_5161] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l700_c3_5161_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l706_c34_dfeb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l706_c34_dfeb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l691_l693_DUPLICATE_bc04 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l691_l693_DUPLICATE_bc04_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.sp;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l716_l714_DUPLICATE_a110 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l716_l714_DUPLICATE_a110_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l709_c33_53c1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l709_c33_53c1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_ram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l716_l713_DUPLICATE_cb67 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l716_l713_DUPLICATE_cb67_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l665_c19_e5b9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l665_c19_e5b9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l716_l712_DUPLICATE_0df3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l716_l712_DUPLICATE_0df3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l708_c32_eb72] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l708_c32_eb72_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l711_c30_4a45] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l711_c30_4a45_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d[uxn_opcodes_h_l689_c6_7ae0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l689_c6_7ae0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_sp_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l707_c23_63e7] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l707_c23_63e7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.pc;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l710_c29_3502] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l710_c29_3502_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l703_c3_606b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l703_c3_606b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l667_c22_c3ef] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l667_c22_c3ef_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d[uxn_opcodes_h_l666_c18_50b4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l666_c18_50b4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.stack_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l699_c3_06a7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l699_c3_06a7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l664_c18_7379] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l664_c18_7379_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l702_l698_DUPLICATE_3be4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l702_l698_DUPLICATE_3be4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l715_c32_ef82] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_c32_ef82_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l593_c2_4b6a_return_output.is_opc_done;

     -- Submodule level 114
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l703_c3_606b_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l700_c3_5161_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l689_c6_7ae0_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l689_c6_7ae0_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l664_c18_7379_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l664_c18_7379_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l664_c18_7379_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l665_c19_e5b9_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l665_c19_e5b9_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l665_c19_e5b9_return_output;
     VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0 := resize(VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l716_l712_DUPLICATE_0df3_return_output, 32);
     VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2 := resize(VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l716_l714_DUPLICATE_a110_return_output, 32);
     VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1 := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l716_l713_DUPLICATE_cb67_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l702_l698_DUPLICATE_3be4_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l702_l698_DUPLICATE_3be4_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l699_c3_06a7_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l691_l693_DUPLICATE_bc04_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l691_l693_DUPLICATE_bc04_return_output;
     VAR_stack_address_uxn_opcodes_h_l666_c2_596e := resize(VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l666_c18_50b4_return_output, 16);
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l667_c22_c3ef_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l667_c22_c3ef_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l667_c22_c3ef_return_output;
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l666_c2_596e;
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0 := resize(VAR_stack_address_uxn_opcodes_h_l666_c2_596e, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1 := resize(VAR_stack_address_uxn_opcodes_h_l666_c2_596e, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0 := resize(VAR_stack_address_uxn_opcodes_h_l666_c2_596e, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1 := resize(VAR_stack_address_uxn_opcodes_h_l666_c2_596e, 8);
     -- device_ram_update[uxn_opcodes_h_l697_c26_8d28] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0 <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address0;
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_value;
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_write0_enable;
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read0_enable;
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1 <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_address1;
     device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output := device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output;

     -- stack_r_ram_update[uxn_opcodes_h_l670_c22_6b6d] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address0;
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_address1;
     stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output := stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l679_c22_0ce8] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address0;
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_address1;
     stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output := stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l718_l568_DUPLICATE_fdc3 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l718_l568_DUPLICATE_fdc3_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l706_c34_dfeb_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l707_c23_63e7_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l708_c32_eb72_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l709_c33_53c1_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l710_c29_3502_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l711_c30_4a45_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l716_l712_DUPLICATE_0df3_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l716_l713_DUPLICATE_cb67_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l716_l714_DUPLICATE_a110_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_c32_ef82_return_output);

     -- printf_uxn_opcodes_h_l716_c2_b30c[uxn_opcodes_h_l716_c2_b30c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0 <= VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg0;
     printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1 <= VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg1;
     printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2 <= VAR_printf_uxn_opcodes_h_l716_c2_b30c_uxn_opcodes_h_l716_c2_b30c_arg2;
     -- Outputs

     -- sp1_MUX[uxn_opcodes_h_l690_c3_b258] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond <= VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_cond;
     sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iftrue;
     sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output := sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output;

     -- sp0_MUX[uxn_opcodes_h_l690_c3_b258] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond <= VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_cond;
     sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iftrue;
     sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output := sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output;

     -- Submodule level 115
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l718_l568_DUPLICATE_fdc3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l718_l568_DUPLICATE_fdc3_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l697_c2_891e := resize(VAR_device_ram_update_uxn_opcodes_h_l697_c26_8d28_return_output, 8);
     VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l690_c3_b258_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l690_c3_b258_return_output;
     VAR_stack_read_value_uxn_opcodes_h_l670_c3_de25 := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l670_c22_6b6d_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l679_c3_57f7 := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l679_c22_0ce8_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l697_c2_891e;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue := VAR_stack_read_value_uxn_opcodes_h_l670_c3_de25;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse := VAR_stack_read_value_uxn_opcodes_h_l679_c3_57f7;
     -- sp0_MUX[uxn_opcodes_h_l689_c2_dc5a] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond <= VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_cond;
     sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue;
     sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output := sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output;

     -- sp1_MUX[uxn_opcodes_h_l689_c2_dc5a] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond <= VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_cond;
     sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iftrue;
     sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output := sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output;

     -- stack_read_value_MUX[uxn_opcodes_h_l669_c2_3cfa] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_cond;
     stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output := stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output;

     -- Submodule level 116
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l689_c2_dc5a_return_output;
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l669_c2_3cfa_return_output;
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
REG_COMB_opc_done <= REG_VAR_opc_done;
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
     opc_done <= REG_COMB_opc_done;
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
